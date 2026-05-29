# /migracao-extrair-regras

## Objetivo

Destilar as regras de negócio de uma tela do legado e gravá-las no ledger persistente `memoria/regras-negocio/{slug}.md`. Executa a Fase 04.5.

## Quando usar

Por tela, após o Gate 1 (Fase 04 — Design System aprovado) e **antes** de `/migracao-analisar-tela` / `/migracao-gerar-dossie`. Aplica-se em modo **migração/híbrido**; em **construção** pura, a fonte de verdade das regras vem de `/construir-capturar-requisitos` (ver `docs/00-visao-geral/politica-modos-projeto.md`).

## Validação obrigatória de pré-requisitos (Gate duro)

> ⛔ **Se o Gate 1 (Fase 04 — Design System) não tiver sido aprovado, ABORTAR** com:
> "Gate bloqueado: o Design System (Fase 04) precisa ser aprovado antes de extrair regras. Conclua a Fase 04 e obtenha o 'sim' explícito do dev."

Ver `docs/04-protocolos/protocolo-gates-validacao.md`.

## Entradas esperadas

ID ou slug da tela. Exemplo: `/migracao-extrair-regras TELA-0001`

## Ações obrigatórias

- [ ] Localizar o código do legado que serve a tela (controller, requests/validações, models, services, views, queries)
- [ ] Criar/atualizar o ledger a partir de `docs/05-templates/ledger-regras-negocio.template.md`
- [ ] Para cada regra: descrição objetiva + **tipo** + **origem** (`arquivo:linha`, citação direta) + **status** + **modo**
- [ ] Tipo ∈ {validação, cálculo, fluxo, permissão, side-effect, temporal, integração, mensagem, default, quirk}
- [ ] Status ∈ {✅ Confirmada, 🟡 Hipótese, 🟠 Possível bug, 🔴 Bug intencional}
- [ ] Modo ∈ {🟦 Legado, 🟩 Greenfield, 🟪 Híbrido}
- [ ] Marcar quirks como 🟠 e registrar em `memoria/pendencias.md`
- [ ] Registrar 🟪/🟩 e qualquer desvio vs. legado em `memoria/decisoes.md`
- [ ] Multi-app: preencher app dono / apps que leem; divergência → pendência prioritária

## Ações proibidas

- [ ] Não inventar regras (sem evidência → 🟡 Hipótese)
- [ ] Não implementar código
- [ ] Não reproduzir nem "corrigir" comportamento suspeito (🟠) sem decisão do dev
- [ ] Não duplicar regra entre apps — referenciar o app dono

## Arquivos que atualiza

- `memoria/regras-negocio/{slug}.md`
- `memoria/pendencias.md` (itens 🟠)
- `memoria/decisoes.md` (itens 🟪/🟩 e desvios)
- `memoria/backlog-telas.yaml` (status → `regras_extraidas`)

## Checklist de conclusão

- [ ] Ledger salvo
- [ ] Toda regra com tipo, origem citada e status
- [ ] Quirks encaminhados ao dev
- [ ] Decisões/pendências registradas

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a extração de regras da tela [NOME]. Regras: [N] (✅ [n] · 🟡 [n] · 🟠 [n] · 🔴 [n])."

## Próximo passo

`/migracao-analisar-tela [ID]` (Fase 05). O dossiê (`/migracao-gerar-dossie`) tem gate duro neste ledger.
