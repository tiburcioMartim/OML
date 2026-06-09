# Protocolo de Investigação de Permissões

Procedimento de `/migracao-mapear-permissoes [ID]`, executado na investigação da tela (Fase 05), **antes** do dossiê. Produz o ledger `memoria/permissoes/{slug}.md` (template `docs/05-templates/ledger-permissoes.template.md`) e alimenta a matriz RBAC global (`memoria/permissoes/matriz-permissoes.md`).

Governado por `docs/03-guardioes/guardiao-permissoes-acessos.md`. Convivência legado↔novo: `docs/03-guardioes/guardiao-coexistencia-permissoes.md`.

## Princípio

*Só se migra o acesso que se entende.* Cada concessão, cada negação, cada escopo precisa de **origem citada** (`arquivo:linha`, tabela.coluna, query SQL ou validação humana). Sem evidência → 🟡 Hipótese → pendência de investigação; a tela **não passa pelo Gate 2** com o mapa de acesso incompleto. **Default-deny, sem escalonamento, sem lockout** são invariantes (ver guardião).

> **Permissão é segurança + LGPD.** Qualquer alteração de acesso vs. legado é **🔴 Crítico** (decisão do dev + `decisoes.md`), nunca silenciosa.

## Modelo de acesso do legado (referência fixa)

O ERP legado controla acesso em **8 eixos em camadas** (detalhe e evidência no guardião). Resumo operacional:

```
① Auth      $_SESSION['usuarioId']  (+ realm 'cirurgiao')   → ausente = exit "não autenticado"
② Tela      telas(url→id_tela) + permissao_tela(status)     → status nulo/≠1 = NEGADO (default-deny)
③ Setor     permissao_setor(es)(v2) + setoresv2
④ Unidade   permissao_unidade(s) + $_SESSION['unidade']      → multi-tenant; não vazar entre unidades
⑤ Nível     nivel_acesso                                     → visualizar × editar × admin
⑥ Ação      botões/rotas condicionados (CRUD/aprovar/exportar)
⑦ Domínio   permissao_estoque/scan/carrinho/criador/notificacao
⑧ Auditoria view_unauthorized_logs.php; acesso_negado.php
Ponte:      coluna url_erp_laravel (camada paralela do novo ERP)
```

Guarda central: `includes/session/verificar_permissao.php` — **mas cada tela precisa dar `include`**. Tela sem include = potencialmente **aberta** → achado 🟠.

## Passos

1. **Localizar o ponto de entrada da tela** (URL/rota legada, do mapa das Fases 02–03) e o arquivo PHP que a serve.
2. **Eixo ① Autenticação.** Confirmar qual realm protege (sessão padrão `usuarioId` × `cirurgiao`). Citar onde a sessão é exigida.
3. **Eixo ② Acesso à tela — a checagem central.**
   - A tela **dá `include` na guarda** (`verificar_permissao.php` ou equivalente)? **Citar a linha.** Se **não** → 🟠 "tela sem guarda de permissão" (não presumir pública nem bug) → pendência.
   - Resolver `url → id_tela` via tabela **`telas`**. Registrar o `id_tela`.
   - Confirmar o **default-deny** de `permissao_tela.status` (nulo/≠1 ⇒ negado).
4. **Eixo ③④⑤ Escopos (setor / unidade / nível).** Procurar no código da tela os filtros e gates por `permissao_setor*`/`setoresv2`, `permissao_unidade*`/`$_SESSION['unidade']`, `nivel_acesso`. Para cada um: o que restringe (dados? ação? visibilidade?), com citação. **Atenção multi-tenant:** registrar exatamente como o dado é filtrado por unidade — é o que impede vazamento entre hospitais.
5. **Eixo ⑥ Ações/CRUD.** Listar as ações da tela (criar/editar/excluir/aprovar/exportar/…) e o que **condiciona** cada botão/rota (nível? setor? flag?). Ação sem condição explícita = acessível a quem abre a tela (registrar).
6. **Eixo ⑦ Permissões de domínio.** Mapear flags específicas (`permissao_estoque`, `permissao_scan*`, `permissao_carrinho*`, `permissao_criador`, `permissao_notificacao`) que a tela consulta.
7. **Enumerar os sujeitos (quem tem).** Quando possível, levantar **quem** detém a concessão (SQL no admin `erp/ti/permissoes.php`/`permissao_usuario.php`, ou query em `permissao_tela`/`permissao_setor*`). Registrar com origem; se não for possível ao vivo, marcar 🟡 e abrir pendência de validação (não inventar a lista de usuários).
8. **Eixo ⑧ Auditoria + negação.** Como o legado registra/responde acesso negado (`view_unauthorized_logs.php`, `acesso_negado.php`). No novo: negação = `flash.error` claro, **nunca 404 cru**; preservar trilha.
9. **Ponte `url_erp_laravel`.** Verificar se a tela já tem URL do novo mapeada nessa coluna (camada paralela). Registrar para o mapeamento.
10. **Mapear para o novo sistema.** Para cada eixo, definir o **mecanismo Laravel/Vue equivalente** e a **chave**: route middleware (`auth`, `can:`), Policy/Gate, `usePermissions` no Vue (some/desabilita controle), scoping de query por unidade/setor. Registrar a **chave de permissão** estável (tela↔rota↔gate↔usePermissions) — é o que garante rastreabilidade e paridade.
11. **Veredito de paridade de acesso.** Preencher, com evidência, se o novo: preserva **default-deny**, replica os **mesmos sujeitos/escopos**, **não escalona** e **não causa lockout**. Divergência intencional → 🔴 → `decisoes.md`.
12. **Self-healing.** Faltou dado **investigável** (qual id_tela, qual coluna, qual query) → o OML investiga, preenche o ledger e segue. Só vira pendência/decisão o que depende de **gente**: 🟠 anomalia, 🔴 mudança de acesso, ou a lista de sujeitos que exige consulta ao banco vivo.
13. **Atualizar a matriz RBAC** (`memoria/permissoes/matriz-permissoes.md`) com as linhas da tela (sujeito × tela × ação × escopo).
14. **Fechar com resumo breve** (🟡): eixos cobertos, achados 🟠 (telas sem guarda, permissões órfãs), 🔴 (mudanças de acesso) aguardando o dev, e se o ledger ficou **verificado** (apto ao Gate 2) ou o que falta.

## Definição de Pronto (mapa de acesso "verificado")

A tela só está **apta ao Gate 2** quando o ledger tem:
- [ ] Os **8 eixos** avaliados (cobertos **ou** explicitamente "não se aplica", com evidência)
- [ ] Confirmação de que a **guarda é aplicada** (ou achado 🟠 registrado se não for)
- [ ] **Default-deny** confirmado e preservado no mapeamento do novo
- [ ] **Escopos** (setor/unidade/nível) mapeados — multi-tenant sem vazamento
- [ ] **Ações/CRUD** com condição de acesso citada
- [ ] **Mapeamento para o novo** (middleware/policy/gate/usePermissions + chave estável) preenchido
- [ ] **Veredito de paridade** (default-deny ✓, mesmos sujeitos ✓, sem escalonamento ✓, sem lockout ✓) — divergências 🔴 em `decisoes.md`
- [ ] Sem 🟡 Hipótese **investigável** ainda não investigada

## Gate

`/migracao-homologar [ID]` (Gate 2) **aborta** (🔴 humano) se o ledger `memoria/permissoes/{slug}.md` não existir ou a **paridade de acesso** não estiver verificada. Ver `docs/04-protocolos/protocolo-gates-validacao.md`. O dossiê (`/migracao-gerar-dossie`) consome este ledger; se ausente, **auto-resolve** disparando `/migracao-mapear-permissoes` (gate de completude), escalando ao dev só 🟠/🔴.

## Varredura orquestrada em rodadas controladas (multiagente)

Quando a varredura cobre muitas telas (sweep de módulo/projeto), ela roda **orquestrada em rodadas**, cada rodada = um lote *bounded* (ex.: um módulo). Regras (reforçam `docs/00-visao-geral/politica-anti-alucinacao.md` e `politica-preservacao-contexto.md`):

- **1 rodada por vez — gate 🔴 humano ao fim.** Concluída a rodada, o OML **PARA**, apresenta o que mapeou + achados 🟠/🔴, e pede ao dev **verificar, validar e autorizar** a próxima. **Não inicia a rodada seguinte sem "sim" explícito.**
- **Estado persistente (memória anti-perda):** o progresso vive em `memoria/permissoes/_controle-varredura.md` — módulos, status por rodada, telas cobertas, achados, e autorização do dev (com data). **Atualizar ANTES de parar.** Qualquer sessão retoma exatamente de onde parou; nada de progresso só no chat.
- **Verificação adversarial obrigatória:** cada mapeamento passa por um verificador que tenta refutá-lo (guarda omitida? permissão alucinada? default-deny invertido? regime trocado?) antes de persistir. Sem evidência (`arquivo:linha`) → 🟡.
- **Mecanismo-only quando sem banco vivo:** sujeitos/concessões reais dependem de query → 🟡 pendência. **Nunca inventar listas de usuários/perfis.**
- **Documentar tudo a cada rodada:** ledgers + matriz RBAC + controle atualizados; achados 🟠 → `pendencias.md`, mudanças 🔴 → `decisoes.md`.

## Ciclo de vida do ledger

- **Criação/atualização:** Fase 05 (investigação) via `/migracao-mapear-permissoes`.
- **Consulta:** dossiê (06), plano (10) — planejar o enforcement; paridade (14); homologação (15).
- **Mudança vs. legado:** sempre 🔴 em `memoria/decisoes.md`, referenciada no ledger.
- **Persistência:** sobrevive ao fim da migração — fonte de verdade de acesso consultável.
