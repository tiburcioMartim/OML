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
- [ ] **Abrir o campo de opções de seleção de projetos** — montar a lista de projetos **candidatos** (com push líquido a fazer) e **abrir um campo de opções interativo** (no Claude Code: a ferramenta de pergunta com opções, `AskUserQuestion` com `multiSelect: true` — nunca apenas uma lista em texto) com **uma opção por linha** (cada projeto + **"Todos"**, seleção múltipla). Só candidatos com push aparecem; **se não houver nenhum candidato, não abrir campo (nada aparece)**
- [ ] Confirmar a branch de destino — **homologação quando existir; produção/`main` só se não houver homologação**
- [ ] **Dar o push efetivamente** — apenas nos projetos selecionados — e reportar o resultado real (e os candidatos não-selecionados)

## Ações proibidas

- [ ] Excluir arquivo ambíguo sem perguntar
- [ ] Commit único genérico misturando tarefas
- [ ] Mensagens não-semânticas ("wip", "ajustes")
- [ ] Mostrar no campo um projeto sem push líquido, ou abrir o campo quando não há candidato
- [ ] Imprimir a seleção como lista/texto em vez de abrir o campo de opções interativo
- [ ] Empurrar projeto que o dev não selecionou
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
- [ ] Campo de opções interativo aberto (uma opção/linha + "Todos"); só candidatos com push; nenhum campo se não há candidato
- [ ] Push executado apenas nos selecionados e reportado (incluindo os de fora)

## Frase obrigatória de encerramento

"Push concluído: [N] commit(s) enviado(s) para [branch] em [projeto(s)]. Pull: [resumo]. Limpeza: [resumo]. Sem push: [projeto(s) e motivo]."

## Próximo passo

Continuar o fluxo de onde parou (o push não altera a fase atual da esteira).
