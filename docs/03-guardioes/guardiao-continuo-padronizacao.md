# Guardião Contínuo de Padronização

## Missão
Analisar commits, novos arquivos, componentes, rotas, permissões, integrações e padrões quebrados — antes, durante e depois da migração.

## Regra
O agente deve atuar **antes, durante e depois** da migração como guardião de qualidade contínua.

## Atuação transversal (a cada turno)

A vigilância **não** é só a Fase 19 (consolidação final): é **transversal e ativa a cada turno**. O OML não pode "dormir no ponto" sobre guardiões e regras durante fluxos longos. A cada arquivo lido/editado:

- [ ] Reler a `<ai_directive>` embarcada no Styleguide quando tocar UI (`docs/04-protocolos/protocolo-diretivas-ia-styleguide.md`)
- [ ] Validar contra Design System, Composables obrigatórios e tokens (sem cor hardcoded, com `dark:`)
- [ ] **Auto-limpeza:** refatorar violação de forma no sistema novo no mesmo passo, no escopo permitido (`docs/00-visao-geral/politica-auto-limpeza-refatoracao.md`)
- [ ] Nunca alterar comportamento de negócio por auto-limpeza — isso passa pelo ledger de regras + `decisoes.md`

A **Fase 19** continua sendo a consolidação periódica (relatórios de violações, dívida técnica e aprimoramento) — não substitui a vigilância contínua, a encerra.
