# Guardião de Permissões e Acessos

## Missão

Mapear, registrar e **preservar fielmente** o controle de acesso do legado — **quem** pode acessar **o quê**, em **qual escopo**, fazendo **qual ação** — e garantir que o novo sistema reproduza esse controle **sem afrouxar (escalonamento de privilégio) nem apertar demais (lockout)**. Acesso é **segurança + LGPD**: erro aqui expõe dado de paciente/colaborador ou tranca quem precisa trabalhar. Por isso, este guardião tem o **mesmo rigor de ledger persistente** do `guardiao-regras-negocio.md` — permissão é cidadão de **1ª classe**, não sub-tópico de regra.

> **Permissão ≠ regra de negócio.** O tipo `permissão` no ledger de regras registra *que existe uma checagem*; este subsistema registra **o modelo de acesso inteiro** (sujeitos, recursos, escopos, ações, default, auditoria) com sua própria investigação, ledger, matriz e gate.

## Regra-mãe

Todo fato de acesso deve ter **origem rastreável** com citação direta (`arquivo:linha`, query SQL, nome de tabela/coluna, ou validação humana), um **eixo** (que dimensão protege) e um **status explícito**. Sem evidência, é 🟡 Hipótese — **nunca** ✅ Confirmada. O OML **nunca inventa permissão** nem presume que uma tela é pública (ver `docs/00-visao-geral/politica-anti-alucinacao.md`).

**Três invariantes inegociáveis (herdados do legado, preservados no novo):**
1. **Default-deny.** Ausência de concessão = **negado**. Se o legado nega por omissão (ex.: `permissao_tela.status` nulo → sem acesso), o novo **também** nega por omissão. Nunca "liberar por engano".
2. **Sem escalonamento.** O novo **não pode** conceder a um sujeito acesso que ele **não tinha** no legado. Ampliar acesso = mudança de segurança = **decisão explícita do dev** registrada em `decisoes.md`.
3. **Sem lockout.** O novo **não pode** remover acesso de quem **tinha** no legado. Tirar acesso = idem (decisão explícita).

## Por que o guardião-toco anterior era insuficiente

O modelo de acesso do ERP legado é **multidimensional e em camadas** — uma única tabela/checagem não o descreve. A guarda central (`includes/session/verificar_permissao.php`) só cobre a **camada 1** (tela); as demais são enforced espalhadas pelas telas. Mapear "acesso à tela" e parar ali **deixa buracos de segurança**.

---

## Os 8 eixos do controle de acesso (modelo do legado)

> Confirmado por sondagem do legado (`rhc-erp/`). Cada eixo é uma **coluna/checagem** que o ledger e a investigação devem cobrir. Origem citada obrigatória por tela.

| # | Eixo | Mecanismo legado (evidência) | O que preservar no novo |
|---|---|---|---|
| ① | **Autenticação** | `$_SESSION['usuarioId']` (ausente → "não autenticado", exit); realm separado `cirurgiao` (`$_SESSION['cirurgiao_logado']/cirurgiao_id`) | `auth` middleware / guard; realms distintos não se misturam |
| ② | **Acesso à tela** | `telas(url→id_tela)` + `permissao_tela(id_usuario,id_tela,status)`; **default-deny** (`status` nulo → nega); guarda em `includes/session/verificar_permissao.php` | route middleware + policy por tela; default-deny; chave estável tela↔rota |
| ③ | **Escopo por setor** | `permissao_setor(es)(v2)` + `setoresv2`/`setoresv` | filtro de dados por setor; gate de ação por setor |
| ④ | **Escopo por unidade (multi-tenant)** | `permissao_unidade(s)`/`permissao_unidades_id` + `$_SESSION['unidade']` | scoping por unidade hospitalar; **nunca** vazar dado entre unidades |
| ⑤ | **Nível de acesso** | `nivel_acesso` (ex.: visualizar × editar × admin) | gate de ação por nível; campos read-only por nível |
| ⑥ | **Ação / CRUD dentro da tela** | botões/rotas condicionados (criar/editar/excluir/aprovar/exportar) | `can:` por ação; `usePermissions` no Vue some/desabilita o controle |
| ⑦ | **Permissões de domínio** | `permissao_estoque`, `permissao_scan(_acolher/_rotina)`, `permissao_carrinho(_local)`, `permissao_criador`, `permissao_notificacao` | flags de feature por domínio; mapear 1:1 |
| ⑧ | **Auditoria de acesso** | `erp/ti/view_unauthorized_logs.php` (log de tentativa negada); `acesso_negado.php`/`acesso_bloqueado.php` | manter trilha de acesso negado; negação = `flash.error` claro, **nunca 404 cru** |

**Camada paralela de migração:** coluna **`url_erp_laravel`** = ponte de permissão para o novo ERP (ver `guardiao-coexistencia-permissoes.md`). Durante a convivência, **as duas camadas valem**; o novo adiciona sem remover a do legado.

**Buraco silencioso a caçar:** uma tela legada que **não dá `include`** na guarda central fica **aberta** (ou protegida só por `usuarioId`). A investigação deve verificar, por tela, **se a guarda é de fato aplicada** — "sem include" é um achado 🟠 (não presumir nem que é seguro, nem que é bug).

---

## Onde isto vive no fluxo

- **Investigação:** comando **`/migracao-mapear-permissoes [ID]`** (`docs/01-comandos/migracao-mapear-permissoes.md`), executado na investigação da tela (Fase 05), **antes** do dossiê.
- **Protocolo:** `docs/04-protocolos/protocolo-investigacao-permissoes.md` (passo a passo, ancorado no modelo legado).
- **Ledger:** `memoria/permissoes/{slug}.md` — um arquivo por tela/unidade, formato `docs/05-templates/ledger-permissoes.template.md`. **Sobrevive ao fim da migração.**
- **Matriz RBAC global:** `memoria/permissoes/matriz-permissoes.md` (agrega os ledgers: sujeito × tela × ação × escopo) — espelho dos ledgers, nunca inventa.
- **Gate duro 🔴 (humano):** `/migracao-homologar` (Gate 2) **aborta** se a **paridade de acesso** da tela não estiver verificada no ledger (default-deny preservado, mesmos sujeitos, sem escalonamento/lockout) — ver `docs/04-protocolos/protocolo-gates-validacao.md`.
- **Paridade:** `protocolo-revisao-paridade.md` / Fase 14 trata **permissão como dimensão obrigatória** de paridade.

## Status do fato de acesso

| Status | Significado | Ação do OML |
|---|---|---|
| ✅ Confirmado | Concessão/negação observada no código/banco com origem citada e/ou validada pelo dev | Reproduzir fielmente |
| 🟡 Hipótese | Inferido, não validado (ex.: "parece exigir setor X") | Marcar, seguir, investigar/validar antes do Gate 2 |
| 🟠 Aberto/anômalo | Tela sem guarda, permissão órfã, concessão inconsistente | **Perguntar ao dev.** Não "consertar" nem presumir seguro |
| 🔴 Mudança de acesso | Afrouxar/apertar/ampliar/remover acesso vs. legado | **Gate 🔴 — exige "sim" explícito** + registro em `decisoes.md` |

> **Qualquer alteração de acesso é 🔴 Crítico** (eleva automaticamente, ver `docs/00-visao-geral/politica-autonomia.md` e `guardiao-seguranca.md`): nunca silenciosa do agente.

---

## Ações proibidas

- [ ] **Presumir que uma tela é pública** sem confirmar que ela não passa pela guarda (sem evidência → 🟡 Hipótese, investigar)
- [ ] **Inventar** permissão, papel, setor, nível ou concessão sem origem citada
- [ ] **Afrouxar default-deny** — liberar por omissão o que o legado negava por omissão
- [ ] **Escalonar privilégio** — dar acesso que o sujeito não tinha no legado (sem decisão do dev)
- [ ] **Causar lockout** — remover acesso que o sujeito tinha no legado (sem decisão do dev)
- [ ] **Cobrir só a camada de tela** e ignorar setor/unidade/nível/ação/domínio
- [ ] **Vazar dado entre unidades/setores** ao migrar (quebrar o scoping multi-tenant)
- [ ] Trocar negação de acesso por **404 cru** (deve ser `flash.error` claro)
- [ ] Migrar/homologar tela **sem** o ledger de permissões verificado (gate 🔴 do Gate 2)
- [ ] Duplicar a definição de uma permissão em 2 apps — referenciar o app dono (ver multi-app em `guardiao-regras-negocio.md`)
