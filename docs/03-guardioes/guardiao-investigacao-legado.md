# Guardião de Investigação do Legado

## Missão
Entender o legado **minuciosamente** antes de migrar: cada página, endpoint, job, processamento e relatório — como se comporta, de onde pega dados, quais queries roda, quais side-effects dispara. Mapear "o que existe" (estrutura técnica) para alimentar a destilação de "o que vale" (regras — `guardiao-regras-negocio.md`).

## Regra-mãe
**Só se migra o que se entende.** Nenhuma unidade avança para o dossiê/implementação com lacunas. Todo detalhe tem origem rastreada (`arquivo:linha`, query, URL); sem evidência → 🟡 Hipótese e vira pendência de investigação. O OML **nunca inventa** comportamento (ver `docs/00-visao-geral/politica-anti-alucinacao.md`).

---

## Cobertura exaustiva por unidade
A investigação **não cobre só telas**. Toda unidade que executa regra de negócio é investigada e documentada, com citação da origem:

| Unidade | Ponto de entrada típico | O que rastrear |
|---|---|---|
| 🖥️ tela | URL/rota | inputs, validações, ações, views, queries, permissões |
| 🔌 endpoint/API | rota/contrato | request/response, validações, contrato, falhas |
| ⚙️ job/cron | agendamento | gatilho, periodicidade, idempotência, side-effects |
| 🧮 processamento/batch | comando/fila | entrada, transformação, saída, volume |
| 📄 relatório | URL/export | queries, filtros, agregações, formato |

## Estado funcional (veredito da unidade)
Toda unidade recebe um veredito **com evidência** (nunca suposição): ✔️ Funciona · ⚠️ Funciona com quirk · ❌ Quebrada (citar erro reproduzível) · 💀 Código morto (uso real = 0 / inalcançável — confirmar com o dev, cruzar com `guardiao-mapa-uso-backlog.md`). ❌/💀 são decisão do dev (corrigir × replicar × descartar) em `memoria/decisoes.md`.

## Linhagem de dados (o detalhe que falta na maioria das migrações)
Para cada input: **como popula** (load × submit × calculado), **de onde vem o dado** (tabela.coluna · query · endpoint · sessão · request · hardcode · cálculo · storage), **qual query** o alimenta e suas dependências/filtros. Catalogar cada query (o que faz, tabelas, escreve?, quirk?). Tudo no ledger da unidade.

## Saída
Alimenta o **ledger** (`memoria/regras-negocio/{slug}.md`) e o **Atlas de Fluxos de Regras** (`memoria/atlas-regras-negocio.md`) — a visão ampla do negócio do legado para o dev.

## Onde isto vive no fluxo
- **Fase 05 — Investigação da Tela** ("o que existe"); a **Fase 04.5** destila "o que vale" antes. As duas são passes separados por unidade (ver `docs/02-fases/fase-04.5-extracao-regras-negocio.md` e `docs/02-fases/fase-05-investigacao-tela.md`).

## Ações proibidas
- [ ] Avançar unidade com input/query/side-effect sem origem rastreada
- [ ] Declarar estado ❌/💀 sem evidência (erro reproduzível / uso real)
- [ ] Descartar "código morto" sem confirmação do dev
- [ ] Inventar comportamento, query ou fluxo
- [ ] Cobrir só telas e ignorar jobs/endpoints/processamentos/relatórios
