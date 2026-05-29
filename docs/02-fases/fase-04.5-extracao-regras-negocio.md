# Fase 04.5 — Extração de Regras de Negócio

## Autonomia: 🟡 Resumo

O OML destila as regras da tela e apresenta uma lista breve ao final. Não para — salvo elevação automática (🔴) por segurança do paciente ou cálculo financeiro/clínico (ver `docs/00-visao-geral/politica-autonomia.md`).

## Posição no fluxo

Roda **por tela**, logo após o Gate 1 (Fase 04 — Design System aprovado) e **antes** da Fase 05.

> **Modo do projeto** (ver `docs/00-visao-geral/politica-modos-projeto.md`): esta fase se aplica a **migração** e **híbrido** (há legado a destilar). Em **construção** pura, o ledger é alimentado por `/construir-capturar-requisitos` (origem = decisão do dev), no mesmo formato e com os mesmos status.

```
04 (Gate 1) → [por tela: 04.5 Regras → 05 Investigação → 06 Dossiê → ...]
```

- **Fase 04.5 = "o que vale"** — validações, cálculos, fluxos, quirks. Saída: ledger.
- **Fase 05 = "o que existe"** — arquivos, tabelas, integrações, dependências. Saída: inventário técnico.
- São passes **sequenciais por tela** (04.5 **antes** de 05): a 04.5 destila o que vale, depois a 05 investiga o que existe. As regras destiladas aqui **focam** a investigação e o dossiê; sem elas, o dossiê sai genérico.
- O Gate 1 (Fase 04) roda **uma única vez** no projeto; daí em diante **cada tela** percorre `04.5 → 05 → 06 → ...` em sequência.

## Objetivo

Produzir o **ledger de regras** da tela (`memoria/regras-negocio/{slug}.md`) — fonte da verdade persistente que sobrevive ao fim da migração.

## Ações obrigatórias

- [ ] Localizar o código do legado que serve a tela (controller, requests/validações, models, services, views, queries) a partir do ponto de entrada já mapeado nas Fases 02–03
- [ ] Para **cada regra** encontrada, registrar no ledger: descrição objetiva, **tipo**, **origem** (`arquivo:linha` — citação direta obrigatória) e **status**
- [ ] Classificar o **tipo**: validação · cálculo · fluxo · permissão · side-effect · temporal · integração · mensagem · default · quirk
- [ ] Classificar o **status**: ✅ Confirmada · 🟡 Hipótese · 🟠 Possível bug (perguntar ao dev) · 🔴 Bug intencional do legado
- [ ] Marcar **quirks** (GROUP BY sem ORDER BY, cálculo dividindo por 100, input hidden duplicado, etc.) como 🟠 e encaminhar ao dev — **nunca reproduzir como regra confirmada nem "corrigir" sozinho**
- [ ] Definir **modo** de cada regra: 🟦 Legado · 🟩 Greenfield · 🟪 Híbrido (ver guardião de regras de negócio)
- [ ] Se 2+ apps: preencher **app dono** e **apps que leem** (referência, não duplicação)
- [ ] Registrar em `memoria/pendencias.md` todo 🟠; em `memoria/decisoes.md` todo 🟪/🟩 e toda mudança vs. legado

## Ações proibidas
- [ ] Inventar regra sem evidência (sem evidência → 🟡 Hipótese)
- [ ] Implementar código
- [ ] Alterar banco
- [ ] Reproduzir ou "corrigir" comportamento suspeito sem decisão do dev

## Arquivos que atualiza
- `memoria/regras-negocio/{slug}.md` (cria/atualiza o ledger)
- `memoria/pendencias.md` (itens 🟠)
- `memoria/decisoes.md` (itens 🟪/🟩 e desvios vs. legado)
- `memoria/backlog-telas.yaml` (status → `regras_extraidas`)

## Checklist de conclusão
- [ ] Ledger criado/atualizado para a tela
- [ ] Toda regra tem tipo, origem citada e status
- [ ] Quirks (🟠) encaminhados ao dev
- [ ] Modo e multi-app preenchidos quando aplicável

## Próximo passo
Fase 05 — Investigação da Tela (🟢 segue automaticamente). O dossiê (Fase 06) **só pode ser gerado** com o ledger existente — gate duro em `/migracao-gerar-dossie`.
