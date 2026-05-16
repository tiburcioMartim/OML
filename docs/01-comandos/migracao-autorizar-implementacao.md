# /migracao-autorizar-implementacao

## Objetivo

Verificar o checklist de bloqueio e, se aprovado, liberar a tela para codificação.

## Quando usar

Quando o plano técnico estiver concluído e o responsável quiser autorizar.

## Entradas esperadas

ID da tela. Exemplo: `/migracao-autorizar-implementacao TELA-0001`

## Ações obrigatórias

- [ ] Verificar checklist de bloqueio (25 itens)
- [ ] Confirmar dossiê concluído
- [ ] Confirmar regras documentadas
- [ ] Confirmar banco mapeado
- [ ] Confirmar permissões mapeadas
- [ ] Confirmar integrações mapeadas
- [ ] Confirmar LGPD avaliada
- [ ] Confirmar acessibilidade avaliada
- [ ] Confirmar responsividade planejada
- [ ] Confirmar protótipo aprovado
- [ ] Confirmar testes planejados
- [ ] Confirmar rollback definido
- [ ] Solicitar confirmação explícita do responsável
- [ ] Registrar autorização em `memoria/decisoes.md`

## Ações proibidas

- [ ] Não autorizar se checklist incompleto
- [ ] Não auto-autorizar sem resposta humana

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status → `em_implementacao`, `implementacao_autorizada: true`)
- `memoria/decisoes.md`

## Checklist de conclusão

- [ ] Checklist de bloqueio 100% aprovado
- [ ] Autorização humana recebida
- [ ] Decisão registrada

## Frase obrigatória de encerramento

"Implementação autorizada para a tela [NOME]. Iniciando microfases de codificação."

## Próximo passo

Iniciar implementação em microfases conforme plano técnico.
