# /push

## Objetivo

Publicar o trabalho no remoto seguindo o **Protocolo de Push**: limpar → commitar por tarefa e semanticamente → dar o push. Mode-agnóstico (migração / construção / híbrido).

## Quando usar

Quando o dev pedir para "dar push", "subir o código", "commitar e enviar", ou ao fechar um bloco de trabalho versionável.

## Entradas esperadas

Nenhuma obrigatória. Opcional: branch de destino e escopo (quais tarefas commitar).

## Ações obrigatórias

- [ ] **Pull primeiro:** se algum projeto estiver `behind` no `fetch`, **puxar** para atualizar (regra do dev; `--rebase` se também estiver à frente)
- [ ] **Limpeza:** varrer o working tree por debug e arquivos inúteis (ver `docs/04-protocolos/protocolo-push.md`)
- [ ] **Perguntar antes de excluir** qualquer arquivo ambíguo (🔴 — nunca deletar por suposição)
- [ ] Verificar que não há segredos/credenciais no diff (`docs/03-guardioes/guardiao-segredos-credenciais.md`)
- [ ] **Commitar por tarefa**, com mensagem semântica (Conventional Commits, PT-BR)
- [ ] Commitar tudo o que estiver disponível e relevante
- [ ] **Listar os projetos** que receberão push (e os que ficam de fora, com motivo)
- [ ] Confirmar a branch de destino — **homologação quando existir; produção/`main` só se não houver homologação**
- [ ] **Dar o push efetivamente** e reportar o resultado real

## Ações proibidas

- [ ] Excluir arquivo ambíguo sem perguntar
- [ ] Commit único genérico misturando tarefas
- [ ] Mensagens não-semânticas ("wip", "ajustes")
- [ ] Push antes de limpar e commitar tudo
- [ ] Push direto em produção/`main` quando há branch de homologação (sem intenção explícita do dev)
- [ ] Pular o pull quando o projeto está desatualizado
- [ ] Terminar em "pronto para push" sem executar o push

## Arquivos que atualiza

- O histórico Git do repositório (commits + push). Eventualmente `.gitignore` (ao mover inútil para fora do versionamento).

## Checklist de conclusão

- [ ] Inúteis removidos/listados; ambíguos perguntados
- [ ] Sem segredos no diff
- [ ] Commits por tarefa e semânticos
- [ ] Push executado e reportado

## Frase obrigatória de encerramento

"Push concluído: [N] commit(s) enviado(s) para [branch] em [projeto(s)]. Pull: [resumo]. Limpeza: [resumo]. Sem push: [projeto(s) e motivo]."

## Próximo passo

Continuar o fluxo de onde parou (o push não altera a fase atual da esteira).
