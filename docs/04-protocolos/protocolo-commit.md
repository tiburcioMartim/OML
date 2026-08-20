# Protocolo de Commit

Como o OML fecha o trabalho em commits locais — semânticos, por tarefa, sem publicar. É a
metade "limpar → commitar" do Protocolo de Push (`protocolo-push.md`), extraída para comando
próprio: o `/push` a usa como suas etapas 1-2, e o `/commit` a usa sozinho, para quando o dev
quer consolidar o trabalho sem decidir ainda se (ou quando) ele sobe.

> Acionado por `docs/01-comandos/commit.md` (`/commit`) e por `docs/01-comandos/push.md`
> (`/push`, etapas 1-2). Respeita o motor de autonomia (`docs/00-visao-geral/politica-autonomia.md`):
> a limpeza tem **gate 🔴 Crítico** (ver abaixo).

---

## Descoberta dos projetos

Cada diretório **irmão** do OML (`docs/00-visao-geral/politica-estrutura-workspace.md`) que
tenha `.git` é candidato à varredura — não é lista fixa: workspace de par (legado + novo) tem
um projeto, workspace de ecossistema (vários repositórios do mesmo produto) tem N. `git status
--porcelain` decide quem entra na rodada: só quem tem working tree sujo.

## 0. Frente viva — não commitar o que está sendo escrito agora 🔴

Antes de tocar em qualquer arquivo de um projeto, checar se **outra sessão está escrevendo
nele agora**. Em workspace de ecossistema é comum haver várias sessões de IA (ou o próprio dev)
trabalhando no mesmo repositório ao mesmo tempo.

- Comparar o `mtime` dos arquivos sujos com o relógio atual. Escrita nos últimos minutos é
  sinal de sessão concorrente — não é prova sozinha (pode ser a própria sessão, minutos atrás),
  mas pede uma segunda checagem antes de agir.
- **Reconferir a estabilidade imediatamente antes de operar** (`git status`/mtime de novo,
  rente ao momento do `git add`), não só uma vez no início da varredura — o working tree pode
  mudar entre a apuração e a ação, e é exatamente nesse intervalo que a corrida acontece.
- Sinal mais confiável que o relógio: se, na mesma varredura, **uma frente foi commitada por
  quem a escreve e outra não**, a que ficou de fora não está pronta — é disso que o autor está
  avisando ao não fechá-la também.
- Se a frente estiver viva: **não commitar**. Listar o que foi pulado e por quê. Nunca commitar
  trabalho alheio pela metade — commit prematuro de código em construção pode capturar estado
  quebrado e, mais tarde, ser publicado por engano.

## 1. Limpeza — remover debug e arquivos inúteis 🔴

Antes de qualquer commit, varrer o working tree por:

- arquivos de **debug** (dumps, `console.log`/`dd()` esquecidos, prints temporários, `*.log`);
- **scratch de teste** e arquivos descartáveis que **não devem ser versionados** (rascunhos,
  `test-*.tmp`, saídas de execução, pastas temporárias);
- artefatos de build não versionáveis e arquivos órfãos.

**Regra de ouro (segurança contra exclusão indevida):**
> **Se houver QUALQUER dúvida se um arquivo é inútil, NÃO exclua — PERGUNTE ao dev.** A
> exclusão é uma ação destrutiva: a régua é a mesma do sujeito 2 do
> `docs/03-guardioes/guardiao-banco-dados.md` (escrita destrutiva do agente = parar e sinalizar).

- Arquivos **claramente** descartáveis (extensão temporária óbvia, ignorados pelo `.gitignore`)
  → o OML pode remover e **listar** o que removeu (🟡 Resumo).
- Qualquer arquivo **ambíguo** (código, doc, config, dado, ou que o OML não criou) → **listar e
  perguntar** antes de excluir (🔴 Crítico, não prossegue sem "sim").
- Olhar o conteúdo antes de excluir — se contradiz a descrição de "inútil", **não exclua**;
  surfaça a dúvida.
- O que for inútil mas merece ficar fora do versionamento (não apagado) → sugerir entrada no
  `.gitignore`, não deletar.

Complementa: `docs/03-guardioes/guardiao-limpeza-arquivos.md` e
`docs/03-guardioes/guardiao-segredos-credenciais.md` (jamais commitar segredo/credencial —
abortar o commit se detectar).

### 1.1 Dado sensível no que seria commitado — gate duro 🔴🔴

Nem todo achado sensível é credencial. Além de segredo/senha, **parar e perguntar** quando o
que entraria no commit expõe **dado pessoal identificável** — nome de paciente, de funcionário,
CPF, e-mail, captura de tela de sistema de terceiro com sessão logada. LGPD trata os dois como
o mesmo tipo de vazamento uma vez publicados, mesmo que um não seja tecnicamente "segredo".

- Se o arquivo sensível **nunca foi commitado** (só está no working tree): reverter ou mover
  para fora do commit é suficiente — nada vazou. Prosseguir com o resto normalmente.
- Se **já está no histórico** (de um commit anterior, ainda não publicado ou já publicado):
  sinalizar que reverter o arquivo não desfaz a exposição — ela já passou por editor, terminal
  e o que mais tiver lido o arquivo — e que a credencial/dado precisa ser tratada como
  comprometida (trocar senha, avaliar o dado pessoal), independente do commit seguir ou não.

## 2. Verificar integridade antes de agrupar 🟡

Antes de decidir os cortes por tarefa, confirmar que o que vai ser commitado não está quebrado:

- **Sintaxe** do que muda — `php -l` em cada `.php` sujo (ou o lint equivalente da stack do
  projeto: `node --check`, etc.).
- **Build/compile quando plausível** (ex.: `npm run build` do frontend) — não como bloqueio se
  falhar por motivo externo ao código (permissão de pasta, ambiente local incompleto), mas como
  evidência de que o código em si compila. Se o build falhar por causa externa, registrar a
  causa e seguir pela checagem de sintaxe.
- Zero erro de sintaxe é a barra **mínima** — não substitui rodar a suíte de testes quando o
  tempo permitir, mas garante que o commit não introduz um arquivo que quebra o
  autoload/build na primeira execução depois dele.

## 3. Commit — por tarefa e semanticamente

- **Um commit por tarefa/unidade lógica** — não juntar mudanças sem relação no mesmo commit;
  não fazer um commitão de tudo.
- Agrupar os arquivos pelo que pertence à mesma tarefa (usar `git add` seletivo / por caminho
  — nunca `git add -A`/`git add .` cru).
- Mensagem **semântica** (Conventional Commits, em PT-BR): `feat:`, `fix:`, `docs:`, `chore:`,
  `refactor:`, `test:`, com escopo quando útil (`feat(construcao): ...`).
- Mensagem descreve **o quê e por quê**, não só "ajustes" — preservar a densidade de contexto
  que o repositório já usa (números medidos, motivo da decisão, o que foi descartado e por quê)
  em vez de resumir tudo numa linha genérica.
- Commitar **tudo o que estiver disponível e seguro** — não deixar mudança relevante de fora só
  porque não coube num agrupamento óbvio; se sobrar algo assim, isolar como o próprio commit
  (`chore:`) em vez de descartar.

### 3.1 Arquivo compartilhado por duas tarefas — cirurgia de hunk 🔑

Quando um arquivo sujo (rota, manifesto, menu, config) mistura mudanças de **duas frentes
diferentes** dentro do mesmo working tree, `git add` do arquivo inteiro levaria a tarefa errada
junto. O corte é por **hunk**, não por arquivo:

1. Gerar o diff do arquivo (`git diff -- arquivo`) e separar por hunk (marcado por `@@ ... @@`).
2. Identificar a que tarefa cada hunk pertence (pela rota/chave/entrada que ele adiciona).
3. Reverter o arquivo para o `HEAD` (`git checkout HEAD -- arquivo`).
4. Aplicar só os hunks da tarefa em curso (`git apply` de um patch composto pelo cabeçalho do
   diff + os hunks daquela tarefa) e commitar.
5. Repetir para a(s) outra(s) tarefa(s), reaplicando os hunks restantes.
6. **Reconstruir e comparar**: ao fim de todos os commits daquele arquivo, o estado final deve
   ficar **byte-a-byte igual** ao que estava no working tree antes da cirurgia (`diff` contra
   uma cópia salva no início) — é a prova de que nenhum hunk foi perdido, duplicado ou foi
   parar no commit errado.

Vale para JSON de manifesto/catálogo também: reconstruir a partir do `HEAD` + só as chaves da
tarefa em curso, em vez de levar o arquivo inteiro (que poderia incluir a chave de uma frente de
outra sessão, ainda não pronta para publicar).

---

## Ações proibidas

- [ ] `git add -A`/`git add .` sem checagem do que entra
- [ ] Commit único misturando tarefas distintas
- [ ] Mensagem não-semântica ("update", "wip", "ajustes", "atualização")
- [ ] Excluir arquivo ambíguo sem perguntar (regra de ouro)
- [ ] Commitar segredo, credencial ou dado pessoal identificável
- [ ] Commitar trabalho de outra sessão que está sendo escrito no momento
- [ ] Deixar mudança relevante de fora do commit sem motivo — e sem reportar

## Checklist de conclusão

- [ ] Frente viva checada por projeto; o que estava sendo escrito ficou de fora, e foi reportado
- [ ] Working tree varrido; inúteis claros removidos e listados; ambíguos perguntados
- [ ] Sem segredos nem dado pessoal identificável no que foi commitado
- [ ] Sintaxe/build conferidos antes de agrupar
- [ ] Commits por tarefa, com mensagens semânticas descrevendo o quê e por quê
- [ ] Arquivo compartilhado por duas tarefas: cirurgia de hunk, reconstrução final conferida por diff
- [ ] Tudo o que era relevante e seguro foi commitado
