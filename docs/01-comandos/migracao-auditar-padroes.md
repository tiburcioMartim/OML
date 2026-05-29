# /migracao-auditar-padroes

## Objetivo

Analisar o repositório em busca de violações de padrão, componentes não documentados, rotas sem permissão e outros problemas.

## Quando usar

A qualquer momento, especialmente após novos commits ou novas telas.

## Entradas esperadas

Nenhuma. Analisa o repositório inteiro.

## Ações obrigatórias

- [ ] Verificar componentes novos não documentados na Página Visual
- [ ] Verificar rotas sem permissão mapeada
- [ ] Verificar campos sem máscara
- [ ] Verificar cores hardcoded
- [ ] Verificar funções com nomes genéricos
- [ ] Verificar chamadas de API não inventariadas
- [ ] Verificar telas sem tutorial guiado (quando aplicável)
- [ ] Verificar telas sem tooltips
- [ ] Verificar testes ausentes
- [ ] Verificar acessibilidade
- [ ] Classificar severidade de cada violação
- [ ] Gerar relatório

## Auto-limpeza (correção proativa em escopo)

Seguir `docs/00-visao-geral/politica-auto-limpeza-refatoracao.md`:
- **Permitido sem perguntar:** refatorar violações de **forma** no sistema **novo** dentro do escopo da tela em implementação (Fase 13) — `<button>`→componente do DS, aplicar Composable, token em vez de cor hardcoded, faltar `dark:`.
- **Fase 19:** corrigir violações pequenas sem impacto em lógica; refatoração maior vira relatório de dívida técnica.

## Ações proibidas

- [ ] Não refatorar código **legado** nem alterar **comportamento de negócio** (isso passa pelo ledger de regras + `decisoes.md`, não por auto-limpeza)
- [ ] Não corrigir automaticamente fora do escopo permitido sem autorização
- [ ] Não ignorar violações

## Arquivos que atualiza

- Gera relatório de auditoria

## Checklist de conclusão

- [ ] Repositório analisado
- [ ] Violações listadas
- [ ] Severidades classificadas
- [ ] Relatório gerado

## Frase obrigatória de encerramento

"Auditoria concluída. Encontradas [N] violações. Recomendação: corrigir antes do merge."

## Próximo passo

Corrigir violações encontradas.
