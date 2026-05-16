# /migracao-planejar-implementacao

## Objetivo

Criar o plano técnico de implementação da tela, quebrando em microfases com checklist.

## Quando usar

Após o protótipo visual estar aprovado.

## Entradas esperadas

ID da tela com protótipo concluído.

## Ações obrigatórias

- [ ] Definir microfases de implementação
- [ ] Listar arquivos que serão criados/alterados
- [ ] Definir Models e adaptações ao banco legado
- [ ] Definir validações
- [ ] Definir permissões (Policies)
- [ ] Definir testes necessários
- [ ] Definir auditoria
- [ ] Definir observabilidade
- [ ] Definir rollback
- [ ] Estimar ordem de execução

## Ações proibidas

- [ ] Não implementar código ainda
- [ ] Não alterar banco
- [ ] Não criar tabelas sem autorização

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status → `plano_tecnico_concluido`)

## Checklist de conclusão

- [ ] Microfases definidas
- [ ] Arquivos listados
- [ ] Testes planejados
- [ ] Rollback definido

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% o Plano de Implementação da tela [NOME]."

## Próximo passo

`/migracao-autorizar-implementacao [ID]`
