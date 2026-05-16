# /migracao-revisar-paridade

## Objetivo

Comparar o comportamento da tela nova com a tela legada para garantir que nada foi perdido.

## Quando usar

Após a implementação estar concluída.

## Entradas esperadas

ID da tela implementada.

## Ações obrigatórias

- [ ] Comparar campos exibidos
- [ ] Comparar ações disponíveis
- [ ] Comparar regras de negócio
- [ ] Comparar permissões
- [ ] Comparar validações
- [ ] Comparar cálculos
- [ ] Comparar integrações
- [ ] Comparar relatórios/exports
- [ ] Registrar divergências encontradas
- [ ] Classificar divergências (bug, melhoria intencional, perda de regra)

## Ações proibidas

- [ ] Não ignorar divergências
- [ ] Não marcar como aprovado sem revisão real

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status → `paridade_aprovada` ou `requer_decisao`)

## Checklist de conclusão

- [ ] Comparação realizada
- [ ] Divergências documentadas
- [ ] Resultado registrado

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a Revisão de Paridade da tela [NOME]. Resultado: [APROVADA/PENDENTE]."

## Próximo passo

Se aprovada: `/migracao-homologar [ID]`
Se pendente: resolver divergências e revisar novamente.
