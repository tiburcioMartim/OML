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

## Ações proibidas

- [ ] Não corrigir automaticamente sem autorização
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
