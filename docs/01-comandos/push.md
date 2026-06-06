# /push

## Objetivo

Publicar o trabalho no remoto seguindo o **Protocolo de Push**: limpar → commitar por tarefa e semanticamente → dar o push. Mode-agnóstico (migração / construção / híbrido).

## Quando usar

Quando o dev pedir para "dar push", "subir o código", "commitar e enviar", ou ao fechar um bloco de trabalho versionável.

## Entradas esperadas

Nenhuma obrigatória. Opcional: branch de destino e escopo (quais tarefas commitar).

## Ações obrigatórias

- [ ] **Limpeza:** varrer o working tree por debug e arquivos inúteis (ver `docs/04-protocolos/protocolo-push.md`)
- [ ] **Perguntar antes de excluir** qualquer arquivo ambíguo (🔴 — nunca deletar por suposição)
- [ ] Verificar que não há segredos/credenciais no diff (`docs/03-guardioes/guardiao-segredos-credenciais.md`)
- [ ] **Commitar por tarefa**, com mensagem semântica (Conventional Commits, PT-BR)
- [ ] Commitar tudo o que estiver disponível e relevante
- [ ] Confirmar a branch de destino
- [ ] **Dar o push efetivamente** e reportar o resultado real

## Ações proibidas

- [ ] Excluir arquivo ambíguo sem perguntar
- [ ] Commit único genérico misturando tarefas
- [ ] Mensagens não-semânticas ("wip", "ajustes")
- [ ] Push antes de limpar e commitar tudo
- [ ] Terminar em "pronto para push" sem executar o push

## Arquivos que atualiza

- O histórico Git do repositório (commits + push). Eventualmente `.gitignore` (ao mover inútil para fora do versionamento).

## Checklist de conclusão

- [ ] Inúteis removidos/listados; ambíguos perguntados
- [ ] Sem segredos no diff
- [ ] Commits por tarefa e semânticos
- [ ] Push executado e reportado

## Frase obrigatória de encerramento

"Push concluído: [N] commit(s) enviado(s) para [branch]. Limpeza: [resumo]."

## Próximo passo

Continuar o fluxo de onde parou (o push não altera a fase atual da esteira).
