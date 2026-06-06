# Guardião de Regras de Negócio

## Missão
Extrair regras explícitas e escondidas — validações, cálculos, exceções, comportamentos condicionais, side-effects, defaults e quirks. Destilar **o que vale** (a regra) e separar de **o que existe** (a estrutura técnica, responsabilidade da Fase 05). Diferenciar bug do legado de regra intencional. Manter um **ledger persistente** que é a fonte da verdade e sobrevive ao fim da migração.

## Regra-mãe
Toda regra deve ter **origem rastreável** com citação direta (`arquivo:linha`, query SQL, URL ou validação humana), um **tipo** e um **status explícito**. Sem evidência, é 🟡 Hipótese — nunca ✅ Confirmada. O OML **nunca inventa regra** (ver `docs/00-visao-geral/politica-anti-alucinacao.md`).

---

## Onde isto vive no fluxo

- **Fase 04.5 — Extração de Regras** (`docs/02-fases/fase-04.5-extracao-regras-negocio.md`): destila as regras de cada tela **antes** da investigação técnica, para que dossiê e investigação fiquem focados no que importa.
- **Comando:** `/migracao-extrair-regras [ID]` (`docs/01-comandos/migracao-extrair-regras.md`).
- **Ledger:** `memoria/regras-negocio/{slug}.md` — um arquivo por tela/módulo, no formato `docs/05-templates/ledger-regras-negocio.template.md`.
- **Protocolo:** `docs/04-protocolos/protocolo-extracao-regras.md`.
- **Gate duro:** `/migracao-gerar-dossie [ID]` **aborta** se o ledger da tela não existir (ver `docs/04-protocolos/protocolo-gates-validacao.md`).

---

## Tipos de regra

`validação` · `cálculo` · `fluxo` · `permissão` · `side-effect` · `temporal` · `integração` · `mensagem` · `default` · `quirk`

## Status de regra

| Status | Significado | Ação do OML |
|---|---|---|
| ✅ Confirmada | Evidência citada e/ou validada pelo dev | Migrar fielmente |
| 🟡 Hipótese | Inferida, não validada | Marcar, seguir, validar depois |
| 🟠 Possível bug | Comportamento estranho do legado | **Perguntar ao dev. Não reproduzir nem corrigir sozinho.** |
| 🔴 Bug intencional | Dev confirmou que o "erro" deve ser preservado | Reproduzir o comportamento de propósito, com registro |

**Diferenciar bug × intenção é decisão estratégica do dev — nunca silenciosa do agente.** Toda mudança de comportamento vs. legado é registrada em `memoria/decisoes.md`.

---

## Unidade legada (escopo da extração)

A extração cobre **toda unidade** que executa regra de negócio, não só telas: 🖥️ `tela` · 🔌 `endpoint` · ⚙️ `job` · 🧮 `processamento` · 📄 `relatório`. Cada uma tem seu ledger, estado funcional e linhagem de dados. Detalhe (input/query/side-effect) sem origem citada = 🟡 Hipótese → pendência. *Só se migra o que se entende* (ver `docs/03-guardioes/guardiao-investigacao-legado.md`).

## Estado funcional da unidade

Além do status **por regra**, cada unidade recebe um veredito **inteiro**, com evidência (nunca suposição):

| Estado | Significado | Ação do OML |
|---|---|---|
| ✔️ Funciona | Comportamento correto | Migrar fielmente |
| ⚠️ Funciona com quirk | Opera, mas com anomalia | Decidir cada quirk (🟠/🔴) com o dev |
| ❌ Quebrada | Erro reproduzível (citar) | Decisão do dev: corrigir × replicar × descartar → `decisoes.md` |
| 💀 Código morto | Uso real = 0 / inalcançável | **Confirmar com o dev** antes de descartar (cruzar `guardiao-mapa-uso-backlog.md`) |

## Completude do projeto (o agente quer terminar)

A intenção é **contemplar o projeto inteiro** — extrair corretamente as regras de **todas** as unidades. Por isso:

- Cada unidade tem um marcador **Extração finalizada** (☐/✅) no ledger e `extracao_regras` no backlog. Só vira ✅ quando cumpre a **Definição de Pronto da Extração** (estado funcional, regras com origem, linhagem profunda de cada input, queries, fluxograma/sequência, quirks encaminhados).
- **Enquanto uma unidade não está finalizada, o OML a mantém na fila e volta a ela** até concluir. Nenhuma unidade fica para trás.
- O progresso é visível: painel do **Atlas** (✔️/⚠️/❌/💀/⏳) e `/migracao-status` (quantas finalizadas × pendentes). O projeto de regras só está "pronto" quando **0 unidades pendentes**.
- **Lacuna investigável não para o agente:** ele investiga, preenche o ledger e retoma (gate de completude auto-resolvível — `docs/04-protocolos/protocolo-gates-validacao.md`). Só **gente** o detém (🟠/❌/💀, aprovações).
- A linhagem fica **documentada para consulta futura** — uma vez rastreada, não se investiga de novo.

## Atlas de Fluxos de Regras

Cada ledger tem um **fluxograma** (Mermaid) das suas regras. Todos são agregados no **Atlas** (`memoria/atlas-regras-negocio.md`, gerado por `/migracao-gerar-atlas-regras`) — a **visão ampla do negócio do legado** para o dev. O atlas é **espelho** dos ledgers; nunca inventa fluxo. Doc + Mermaid hoje; promovido a página Vue navegável quando o Design System estiver pronto.

---

## Modo: greenfield / híbrido

O modo do projeto (migração / construção / híbrido) é governado por `docs/00-visao-geral/politica-modos-projeto.md` — **fonte autoritativa**. Aqui só importa o reflexo no ledger: regras inéditas usam o **mesmo ledger, mesmo formato, mesma fonte da verdade** (não existe fork "OML-criação"), mudando só a coluna **Modo**:

- 🟦 **Legado** — destilada do sistema antigo (origem = `arquivo:linha`).
- 🟩 **Greenfield** — inédita; origem = **decisão do dev** em `memoria/decisoes.md` + tela análoga de referência (quando houver). Em modo construção, alimentada por `/construir-capturar-requisitos`.
- 🟪 **Híbrido** — regra do legado adaptada/alterada; a mudança é registrada em `memoria/decisoes.md`.

---

## Convivência multi-app

Quando o projeto tem 2+ apps que conversam por API (admin + portal, mobile + web, microserviços), a mesma regra implementada em dois lugares **vai divergir**.

- A regra **mora no app que escreve** (o dono / fonte da verdade).
- Apps que só **leem** referenciam por link (coluna "App dono" do ledger) — **nunca duplicam**.
- **Divergência de comportamento é proibida** e vira pendência prioritária em `memoria/pendencias.md`.
- A convenção fica documentada na seção "Convivência multi-app" de `memoria/regras-negocio/_README.md`.

---

## Ações proibidas
- [ ] Inventar regra sem evidência (sem evidência → 🟡 Hipótese)
- [ ] Marcar 🟠/🔴 sem encaminhar (perguntar ao dev ou registrar decisão)
- [ ] "Corrigir" comportamento do legado sem decisão do dev registrada
- [ ] Reproduzir comportamento suspeito (🟠) como se fosse regra confirmada
- [ ] Duplicar a mesma regra em apps diferentes (referenciar o dono, não copiar)
