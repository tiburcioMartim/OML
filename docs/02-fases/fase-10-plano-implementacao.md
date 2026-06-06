# Fase 10 — Plano de Implementação

## Autonomia: 🟢 Autônomo

O OML cria o plano técnico sem parar. Segue automaticamente para a próxima fase.

## Objetivo
Criar plano técnico detalhado com microfases de codificação.

## Ações obrigatórias
- [ ] Definir microfases de implementação
- [ ] Listar arquivos a criar/alterar
- [ ] Definir Models e o banco:
  - **Migração:** Model **adaptado ao banco legado** (`$table`/colunas reais, validados — ver `docs/04-protocolos/protocolo-varredura-models.md`); só DDL aditivo (`guardiao-banco-dados.md`).
  - **Construção:** Model e schema **novos**, projetados com `docs/03-guardioes/guardiao-modelagem-dados.md` (migrations completas, sem banco legado a respeitar). Origem da decisão de modelagem em `memoria/decisoes.md`.
- [ ] Definir validações e permissões
- [ ] Definir testes e rollback

## Próximo passo
Fase 11 — Planejamento de Testes (🟢 segue automaticamente)
