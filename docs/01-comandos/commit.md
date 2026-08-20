# /commit

## Objetivo

Consolidar o trabalho pendente de cada projeto do workspace em commits locais, semânticos e
por tarefa — sem publicar. É a metade "limpar → commitar" do Protocolo de Push
(`docs/04-protocolos/protocolo-commit.md`), isolada como comando próprio.

## Quando usar

Quando o dev pedir "commita tudo", "faz os commits", "fecha o trabalho em commit", ou quiser
consolidar o que está pendente sem decidir ainda se (ou quando) publica. Também usado
internamente pelo `/push` — as etapas 1-2 dele **são** este protocolo.

## Diferença para o `/push`

`/push` = pull → **limpar → commitar** → selecionar projetos → publicar.
`/commit` = **limpar → commitar**. Para aí.

Não há campo de seleção de projetos aqui: commit é sempre local e seguro (sem efeito fora da
máquina), então não existe "candidato a não escolher" — todo projeto com trabalho pendente,
seguro e pronto é commitado. O campo de seleção do `/push` existe porque publicar tem efeito
externo; commitar não tem.

## Entradas esperadas

Nenhuma obrigatória. Opcional: escopo (um projeto específico, uma tarefa específica).

## Ações obrigatórias

- [ ] **Descobrir os projetos**: cada diretório irmão do OML com `.git` e working tree sujo
      (`docs/04-protocolos/protocolo-commit.md`)
- [ ] Por projeto: checar **frente viva** antes de tocar em qualquer arquivo — não commitar o
      que outra sessão está escrevendo agora
- [ ] **Limpeza**: remover inúteis claros e listar; perguntar antes de excluir qualquer arquivo
      ambíguo (🔴 nunca supor)
- [ ] Parar e alertar se houver **segredo/credencial ou dado pessoal identificável** no que
      seria commitado (gate duro)
- [ ] **Verificar integridade** do que vai ser commitado (sintaxe/build) antes de agrupar
- [ ] **Commitar por tarefa**, com mensagem semântica (Conventional Commits, PT-BR) —
      descrevendo o quê e por quê
- [ ] Quando um arquivo for compartilhado por duas tarefas, fazer **cirurgia de hunk** e
      reconstruir o arquivo por diff ao final
- [ ] Commitar tudo o que estiver disponível, seguro e legítimo — não deixar mudança relevante
      de fora sem motivo
- [ ] Reportar por projeto: quantos commits, o que cada um fez, o que ficou de fora e por quê

## Ações proibidas

- [ ] Dar push (fora do escopo deste comando — usar `/push`)
- [ ] Abrir campo de seleção de projetos (não há decisão de publicação aqui)
- [ ] `git add -A`/`git add .` sem checagem
- [ ] Commit único genérico misturando tarefas
- [ ] Mensagem não-semântica
- [ ] Excluir arquivo ambíguo sem perguntar
- [ ] Commitar segredo, credencial ou dado pessoal
- [ ] Commitar trabalho de outra sessão em andamento
- [ ] Terminar sem reportar o que ficou de fora e por quê

## Arquivos que atualiza

O histórico Git de cada projeto (commits locais, sem push). Eventualmente `.gitignore` (ao
mover inútil para fora do versionamento).

## Checklist de conclusão

Ver `docs/04-protocolos/protocolo-commit.md`.

## Frase obrigatória de encerramento

"Commit concluído: [N] commit(s) criado(s) em [projeto(s)]. Limpeza: [resumo]. Sem commit:
[projeto(s) e motivo]."

## Próximo passo

`/push`, quando o dev decidir publicar — os commits já estarão prontos, e o push pula direto
para a seleção de projetos e a publicação.
