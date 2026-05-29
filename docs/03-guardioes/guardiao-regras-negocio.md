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
