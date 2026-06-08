# Protocolo de Push

Como o OML prepara e publica trabalho no repositório remoto. Mode-agnóstico (migração / construção / híbrido). Definição de um **bom push** segundo o dev: **limpar → commitar por tarefa e semanticamente → só então dar o push**.

> Acionado pelo comando `docs/01-comandos/push.md` (`/push`). Respeita o motor de autonomia (`docs/00-visao-geral/politica-autonomia.md`): a etapa de limpeza tem **gate 🔴 Crítico** (ver abaixo).

---

## O fluxo, em ordem

### 0. Sincronizar (pull) — atualizar antes de publicar 🔄
Antes de limpar/commitar/empurrar, em **cada** projeto que vai receber push:
- `git fetch` e verificar divergência (`git rev-list --left-right --count @{u}...HEAD`).
- **Se houver commits a puxar (`behind > 0`), puxe** — é regra do dev: "sempre que for identificado que há pull a ser feito para atualizar o projeto, faça-o". Preferir `--rebase` quando o local também estiver à frente (evita merge-bubble); abortar e sinalizar se houver conflito.
- Conferir o **conteúdo líquido** (`git diff <upstream>...HEAD`): se vazio, não há nada a publicar (commits que se cancelam) — não force push de ruído.

### 1. Limpeza — remover debug e arquivos inúteis 🔴
Antes de qualquer commit, varrer o working tree por:
- arquivos de **debug** (dumps, `console.log`/`dd()` esquecidos, prints temporários, `*.log`);
- **scratch de teste** e arquivos descartáveis que **não devem ser versionados** (rascunhos, `test-*.tmp`, saídas de execução, pastas temporárias);
- artefatos de build não versionáveis e arquivos órfãos.

**Regra de ouro (segurança contra exclusão indevida):**
> **Se houver QUALQUER dúvida se um arquivo é inútil, NÃO exclua — PERGUNTE ao dev.** "Limpar arquivos inúteis" já causou a exclusão acidental da própria OML. A exclusão é uma ação destrutiva: a régua é a mesma do sujeito 2 do `docs/03-guardioes/guardiao-banco-dados.md` (escrita destrutiva do agente = parar e sinalizar).

- Arquivos **claramente** descartáveis (extensão temporária óbvia, ignorados pelo `.gitignore`) → o OML pode remover e **listar** o que removeu (🟡 Resumo).
- Qualquer arquivo **ambíguo** (código, doc, config, dado, ou que o OML não criou) → **listar e perguntar** antes de excluir (🔴 Crítico, não prossegue sem "sim").
- Olhar o conteúdo antes de excluir — se contradiz a descrição de "inútil", **não exclua**; surfaça a dúvida.
- O que for inútil mas merece ficar fora do versionamento (não apagado) → sugerir entrada no `.gitignore`, não deletar.

Complementa: `docs/03-guardioes/guardiao-limpeza-arquivos.md` e `docs/03-guardioes/guardiao-segredos-credenciais.md` (jamais commitar segredo/credencial — abortar o push se detectar).

### 2. Commit — por tarefa e semanticamente
- **Um commit por tarefa/unidade lógica** — não juntar mudanças sem relação no mesmo commit; não fazer um commitão de tudo.
- Agrupar os arquivos pelo que pertence à mesma tarefa (usar `git add` seletivo / por caminho).
- Mensagem **semântica** (Conventional Commits, em PT-BR): `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, com escopo quando útil (`feat(construcao): ...`).
- Mensagem descreve **o quê e por quê**, não só "ajustes".
- Commitar **tudo o que estiver disponível** ao final — não deixar mudança relevante fora.

### 3. Push — só no fim, efetivamente
- Só depois de **toda** a limpeza e **todos** os commits por tarefa concluídos.
- **Listar antes os projetos** que vão receber push e o que cada um leva (regra do dev: "sempre dê uma lista de quais projetos irão ser feitos os push"). Projetos sem mudança líquida ficam fora da lista, com o motivo.
- **Branch-alvo — regra do dev:** o push vai para a branch de **homologação** quando ela existir (`origin/homologacao`); **só** vai para **produção/`main`** quando **não** houver branch de homologação. Nunca empurrar direto para `production`/`main` de um projeto que tenha fluxo de homologação sem intenção explícita do dev (= deploy → gate 🔴). Para melhoria, branch descritiva quando fizer sentido (ver `CONTRIBUTING.md`).
- `git push` de fato (o protocolo não termina em "pronto para push" — termina com o push feito).
- Reportar o resultado real (projeto, branch, commits enviados); se o push falhar, mostrar o erro e parar.

---

## Ações proibidas
- [ ] Excluir arquivo ambíguo sem perguntar ao dev (regra de ouro)
- [ ] Excluir arquivo que o OML não criou sem confirmação
- [ ] Commit único e genérico misturando tarefas distintas
- [ ] Mensagem de commit não-semântica ("update", "wip", "ajustes")
- [ ] Commitar segredos/credenciais/dados sensíveis
- [ ] Dar push antes de limpar e commitar tudo
- [ ] Pular o pull quando o projeto está desatualizado (`behind > 0`)
- [ ] Push direto em produção/`main` quando há branch de homologação (sem intenção explícita do dev)
- [ ] Empurrar sem listar antes os projetos que recebem push
- [ ] Encerrar em "pronto para push" sem executar o push

## Checklist de conclusão
- [ ] Projetos sincronizados (pull onde havia `behind`); diff líquido conferido
- [ ] Working tree varrido; inúteis claros removidos e listados
- [ ] Ambíguos perguntados ao dev (nenhuma exclusão por suposição)
- [ ] Sem segredos no diff
- [ ] Commits por tarefa, com mensagens semânticas
- [ ] Tudo o que era relevante foi commitado
- [ ] Projetos que recebem push listados (e os de fora, com motivo)
- [ ] Branch-alvo correta (homologação quando existe; produção só na ausência)
- [ ] Push executado e resultado reportado
