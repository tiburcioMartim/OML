# /migracao-gerar-atlas-regras

## Objetivo

Gerar/atualizar o **Atlas de Fluxos de Regras de Negócio** (`memoria/atlas-regras-negocio.md`) — a visão ampla do negócio do legado — a partir de todos os ledgers em `memoria/regras-negocio/*.md`.

## Quando usar

A qualquer momento após existir pelo menos um ledger (Fase 04.5). Recomendado reexecutar ao concluir a extração de cada nova unidade, para o dev acompanhar o mapa crescendo.

## Entradas esperadas

Nenhuma (varre todos os ledgers). Opcional: filtro por tipo/criticidade.

## Ações obrigatórias

- [ ] Varrer `memoria/regras-negocio/*.md` e ler de cada ledger: unidade, tipo, **estado funcional**, criticidade, uso real, contagem de regras e o **fluxograma Mermaid**
- [ ] Montar o atlas a partir de `docs/05-templates/atlas-regras-negocio.template.md`: painel de saúde, índice ranqueado (criticidade ↓, uso ↓), fluxos por unidade e visão de negócio macro
- [ ] Listar unidades **sem ledger** como `⏳ pendente de extração` (nunca inventar fluxo)
- [ ] Sincronizar cada fluxograma como **espelho** do ledger (a fonte da verdade é o ledger)

## Ações proibidas

- [ ] Inventar fluxo/regra que não esteja no ledger
- [ ] Marcar estado funcional diferente do ledger
- [ ] Implementar código ou alterar banco

## Arquivos que atualiza

- `memoria/atlas-regras-negocio.md`

## Checklist de conclusão

- [ ] Atlas reflete todos os ledgers atuais
- [ ] Painel de saúde com as contagens corretas
- [ ] Unidades sem ledger marcadas como pendentes

## Frase obrigatória de encerramento

"Atlas de regras atualizado: [N] unidades (✔️ [n] · ⚠️ [n] · ❌ [n] · 💀 [n] · ⏳ [n] pendentes)."

## Próximo passo

Continuar a extração das unidades pendentes (`/migracao-extrair-regras`) ou seguir o fluxo da unidade atual.
