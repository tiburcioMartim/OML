# Fase 13 — Implementação em Microfase

## Autonomia: 🟢 Autônomo

O OML implementa seguindo o plano, sem parar. Fluxo contínuo de microfases.

## Objetivo
Implementar a tela em microfases muito pequenas, sequenciais e testáveis.

## Ações obrigatórias
- [ ] Seguir plano de implementação
- [ ] Criar Model adaptado ao banco legado
- [ ] Criar Controller, Service, Action
- [ ] Criar validações
- [ ] Criar Policies/permissões
- [ ] Criar componentes Vue **usando o Design System aprovado e os Composables obrigatórios** (`useMasks`, `useTheme`, `useA11y`, `usePermissions`, `useTable` — ver `docs/06-perfis/vue/composables-obrigatorios.md`); nunca recriar componente/lógica que já existe, nunca cor hardcoded (obedecer a `<ai_directive>` do Styleguide — `docs/04-protocolos/protocolo-diretivas-ia-styleguide.md`)
- [ ] **Auto-limpeza:** ao tocar arquivo do sistema novo que viole o padrão, refatorar no mesmo passo (ver `docs/00-visao-geral/politica-auto-limpeza-refatoracao.md`)
- [ ] Implementar fielmente as regras do ledger `memoria/regras-negocio/{slug}.md` (reproduzir 🔴 bug intencional; **não** reproduzir 🟠 possível bug sem decisão do dev)
- [ ] Criar testes
- [ ] Configurar auditoria
- [ ] Rodar linter
- [ ] Cada microfase com checklist (verificação silenciosa)

## Próximo passo
Fase 14 — Revisão de Paridade (🟡 resumo breve)
