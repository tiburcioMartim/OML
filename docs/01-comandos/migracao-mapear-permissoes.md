# /migracao-mapear-permissoes

## Objetivo

Investigar e registrar o **controle de acesso** (permissões) de uma tela/unidade do legado nos **8 eixos** (auth, tela, setor, unidade, nível, ação, domínio, auditoria) e gravá-lo no ledger persistente `memoria/permissoes/{slug}.md`, com o mapeamento fiel para o novo sistema. Executa a investigação de acesso da Fase 05.

## Quando usar

Por tela, na investigação (Fase 05), **após** `/migracao-extrair-regras` e **antes** de `/migracao-gerar-dossie`. Aplica-se em modo **migração/híbrido**. Em **construção** pura, o controle de acesso da feature nova vem de `/construir-capturar-requisitos` + `decisoes.md` (origem = decisão do dev).

## Validação obrigatória de pré-requisitos (Gate duro)

> ⛔ **Se o Gate 1 (Fase 04 — Design System) não tiver sido aprovado, ABORTAR:**
> "Gate bloqueado: o Design System (Fase 04) precisa ser aprovado antes de mapear permissões. Conclua a Fase 04 e obtenha o 'sim' explícito do dev."

Ver `docs/04-protocolos/protocolo-gates-validacao.md`.

## Entradas esperadas

ID ou slug da tela. Exemplo: `/migracao-mapear-permissoes TELA-0001`

## Ações obrigatórias

- [ ] Seguir `docs/04-protocolos/protocolo-investigacao-permissoes.md` (passo a passo) e o `docs/03-guardioes/guardiao-permissoes-acessos.md`
- [ ] Criar/atualizar o ledger a partir de `docs/05-templates/ledger-permissoes.template.md`
- [ ] **Eixo ②:** resolver `url → id_tela` (`telas`), confirmar **default-deny** de `permissao_tela`, e **verificar se a tela aplica a guarda** (`include` de `verificar_permissao.php`) — sem guarda = achado 🟠
- [ ] **Eixos ③④⑤:** mapear escopos por setor / unidade (multi-tenant, sem vazamento) / nível, com citação
- [ ] **Eixo ⑥:** listar ações/CRUD e o que condiciona cada uma
- [ ] **Eixo ⑦:** mapear permissões de domínio (`permissao_estoque/scan/carrinho/criador/notificacao`)
- [ ] **Eixo ⑧:** registrar auditoria/negação (`view_unauthorized_logs.php`, `acesso_negado.php`); negação no novo = `flash.error`, nunca 404
- [ ] **Sujeitos:** levantar quem detém cada concessão (origem citada); se não for possível ao vivo → 🟡 + pendência (nunca inventar a lista)
- [ ] **Mapear para o novo:** middleware/policy/gate/`usePermissions` + **chave de permissão estável** por eixo
- [ ] **Veredito de paridade:** default-deny preservado · mesmos sujeitos/escopos · sem escalonamento · sem lockout
- [ ] **Self-healing:** dado investigável faltando → investigar, preencher e seguir (não parar)
- [ ] Atualizar a **matriz RBAC** `memoria/permissoes/matriz-permissoes.md`
- [ ] **Marcar "mapa verificado" (✅)** só ao cumprir a *Definição de Pronto*; senão, manter na fila
- [ ] Status ∈ {✅ Confirmado, 🟡 Hipótese, 🟠 Aberto/anômalo, 🔴 Mudança de acesso}

## Ações proibidas

- [ ] Presumir tela pública sem evidência (sem guarda confirmada → investigar / 🟠)
- [ ] Inventar permissão, sujeito, setor ou nível
- [ ] Afrouxar default-deny, escalonar privilégio ou causar lockout
- [ ] Cobrir só o acesso à tela e ignorar setor/unidade/nível/ação/domínio
- [ ] Não implementar código (este comando só investiga e registra)
- [ ] Aplicar mudança de acesso (🔴) sem decisão explícita do dev em `decisoes.md`

## Arquivos que atualiza

- `memoria/permissoes/{slug}.md` (ledger)
- `memoria/permissoes/matriz-permissoes.md` (matriz RBAC)
- `memoria/pendencias.md` (achados 🟠 e 🟡 a validar ao vivo)
- `memoria/decisoes.md` (mudanças de acesso 🔴)
- `memoria/backlog-telas.yaml` (campo `permissoes: mapeada`)

## Checklist de conclusão

- [ ] Ledger salvo, 8 eixos avaliados
- [ ] Guarda aplicada confirmada (ou 🟠 registrado)
- [ ] Default-deny preservado; escopos e ações mapeados
- [ ] Mapeamento para o novo + chaves estáveis
- [ ] Veredito de paridade preenchido; 🔴 em `decisoes.md`; 🟠/🟡 em `pendencias.md`
- [ ] Matriz RBAC atualizada

## Frase obrigatória de encerramento

"Mapa de acesso da tela [NOME] concluído: [N] concessões (✅ [n] · 🟡 [n] · 🟠 [n] · 🔴 [n]). Eixos: [cobertos]. Paridade: default-deny [✓/✗] · sem escalonamento [✓/✗] · sem lockout [✓/✗]. [apto ao Gate 2 / falta: …]"

## Próximo passo

`/migracao-gerar-dossie [ID]` (consome este ledger). O Gate 2 (`/migracao-homologar`) tem **gate duro 🔴** na paridade de acesso deste ledger.
