# Changelog

Todas as mudanças relevantes do OML serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/).

---

## [Não lançado]

## [1.7.0] - 2026-07-17

### Adicionado

- **Subsistema dedicado de Segurança** (promovido a cidadão de 1ª classe, no mesmo rigor do subsistema de Permissões v1.5.0). O tratamento anterior era um toco (guardião de 25 linhas + 3 guardiões de 7 linhas; sem comando/protocolo/ledger/gate). Agora há:
  - **Comando `/migracao-mapear-seguranca [ID]`** — investiga a postura de segurança da tela/endpoint nos **10 eixos** (E1 acesso/autz · E2 auth/sessão · E3 injeção · E4 validação/regra · E5 cripto/LGPD · E6 config/exposição · E7 API/externo · E8 integridade/supply chain · E9 log/auditoria · E10 erros/exceções), cada achado com **status + origem citada (`arquivo:linha`) + âncora**.
  - **Ancoragem em corpus autoritativo** (o agente cita, não "acha"): **OWASP Top 10 2025** (SSRF absorvido em A01, XSS reabsorvido em Injection, novas A03 Supply Chain e A10 Exceptional Conditions), **OWASP API Security Top 10 2023**, **OWASP ASVS 5.0** (L2 piso, **L3** para fluxos de dado de saúde), **CWE Top 25 2025**, + pitfalls Laravel e pacote hospitalar/LGPD (art. 11/46/37/48; retenção CFM ~20 anos).
  - **Protocolo de Investigação de Segurança** (`docs/04-protocolos/protocolo-investigacao-seguranca.md`) com a referência de padrões fixa, passos por eixo, a **trilha greenfield (threat model + controles de berço)**, Definição de Pronto, gate e varredura orquestrada com verificação adversarial.
  - **Ledger por tela** `memoria/seguranca/{slug}.md` + **matriz global** `memoria/seguranca/matriz-seguranca.md` (templates em `docs/05-templates/`), com seed-if-missing (`docs/05-templates/memoria-seed/seguranca/`).
  - **Gate 🔴 condicional no Gate 2:** `/migracao-homologar` **aborta** em tela de **alta criticidade** (dado de saúde, cálculo clínico/financeiro) sem o veredito de segurança verificado (tela de baixa criticidade não bloqueia — evita desperdício).
  - **Invariantes:** *não rebaixar controle do legado · secure-by-design no greenfield · validação no servidor · fail-safe · segredo/dado sensível fora do código e do log*. Rebaixamento/exposição/risco ao paciente = **🔴** (decisão do dev). Nunca inventar vulnerabilidade nem "confirmar" exploit sem evidência (sem ambiente vivo → 🟡).
  - **Integração com o `/adversario`:** o threat model/ledger é alvo natural do debate adversário em alta criticidade.

### Alterado

- **Guardião de Segurança** reescrito (missão, ancoragem a padrão vigente, 10 eixos mapeados, invariantes, leitura por modo migração/greenfield, elevação 🔴). **Wiring:** `comandos-oficiais.md` (registro), `fase-05` (mapear segurança na investigação), `fase-08` (riscos de segurança), `definicao-de-pronto.md` (segurança = ledger + L3), `protocolo-gates-validacao.md` (gate condicional à criticidade). Migração 1.7.0 no `oml.manifesto.json` (seed `memoria/seguranca/`).

## [1.6.0] - 2026-07-17

### Adicionado

- **Debate Adversário (`/adversario`)** — mecanismo de "advogado do diabo" do OML: um agente **Adversário** independente refuta a proposta/decisão/artefato **por padrão** e um **Juiz** independente julga e sintetiza, em rodadas, até convergir no melhor resultado — em vez de o OML autovalidar a própria ideia. Cobre arquitetura, código, artefatos de migração e textos/prompts. Novos `docs/04-protocolos/protocolo-adversario.md` e `docs/01-comandos/adversario.md`, launcher `.claude/commands/adversario.md`, registrado em `comandos-oficiais.md`.
  - **Três papéis isolados** (Proponente / Adversário / Juiz), cada um em subagente próprio — **regra dura de isolamento por papel** (um subagente por papel por rodada; Adversário só objeta, Juiz só julga) para impedir a autovalidação em que um único contexto propõe, critica e se aprova.
  - **Severidades** 🔴/🟡/🔵 **+ ⚠️ lacuna de evidência** (objeção sem origem por **fonte retida** bloqueia, não é rebaixada a estilo), e **pacote de evidência neutro** que o Proponente não pode curar a favor da tese.
  - **Três estados terminais** distintos: **CONVERGIDO** (2 secas consecutivas **ou** retornos decrescentes declarados pelo Juiz, sem 🔴/⚠️ aberto), **ESGOTADO** (teto de rodadas quentes com 🔴 aberto) e **BLOQUEADO** (⚠️ retém um fato que só o dev tem). O orçamento conta **só rodadas quentes**; **backstop absoluto** de 5 rodadas totais.
  - **Integração ao fluxo** condicionada à criticidade (decisão de arquitetura; `/migracao-autorizar-implementacao` e `/migracao-revisar-paridade` de alta criticidade) + item na **Definição de Pronto** e no **Protocolo de Gates**. Seção **"Quando NÃO usar"** para não desperdiçar no trivial/reversível.
  - **Ata durável** em `memoria/atas/` (seed `docs/05-templates/memoria-seed/atas/`) — rastro de todo debate (Regra-Mãe #21); **laço de aprendizado**: objeção recorrente (≥3 debates) é promovida a checklist/guardião via `historico-aprimoramento.md` (wiring em `/migracao-gerar-relatorio-aprimoramento`).

### Alterado

- **Wiring:** `docs/00-visao-geral/definicao-de-pronto.md` (item condicional de debate adversário), `docs/04-protocolos/protocolo-gates-validacao.md` (gate condicional à criticidade), `docs/01-comandos/migracao-gerar-relatorio-aprimoramento.md` (varre `memoria/atas/` atrás de objeções recorrentes), `comandos-oficiais.md` (registro). Migração 1.6.0 no `oml.manifesto.json` (seed `memoria/atas/`).

## [1.5.0] - 2026-06-09

### Adicionado

- **Subsistema dedicado de Permissões e Acessos** (promovido a cidadão de 1ª classe, com o mesmo rigor de ledger das Regras de Negócio — segurança + LGPD). O tratamento anterior era um toco (guardião de 8 linhas, template de tabela vazia, sem protocolo/comando/gate). Agora há:
  - **Comando `/migracao-mapear-permissoes [ID]`** (`docs/01-comandos/`) — mapeia os **8 eixos** do controle de acesso do legado (① auth · ② tela `telas`+`permissao_tela` *default-deny* · ③ setor · ④ unidade/multi-tenant · ⑤ nível · ⑥ ação/CRUD · ⑦ domínio · ⑧ auditoria), enumera sujeitos com origem citada e mapeia para o novo (middleware/policy/gate/`usePermissions` + chave estável).
  - **Protocolo de Investigação de Permissões** (`docs/04-protocolos/protocolo-investigacao-permissoes.md`), ancorado no mecanismo real do legado (`includes/session/verificar_permissao.php`), incl. caça a **telas sem guarda** (abertas) e veredito de paridade.
  - **Ledger por tela** `memoria/permissoes/{slug}.md` + **Matriz RBAC global** `memoria/permissoes/matriz-permissoes.md` (templates em `docs/05-templates/`), com seed-if-missing (`docs/05-templates/memoria-seed/permissoes/`).
  - **Gate duro 🔴 no Gate 2:** `/migracao-homologar` **aborta** se a paridade de acesso não estiver verificada (`protocolo-gates-validacao.md`). Dossiê auto-resolve o ledger ausente (gate de completude).
  - **Invariantes:** *default-deny preservado · sem escalonamento de privilégio · sem lockout*. Qualquer mudança de acesso vs. legado = 🔴 (decisão do dev em `decisoes.md`).

### Alterado

- **Guardião de Permissões e Acessos** reescrito (missão, regra-mãe, 8 eixos com evidência, status, elevação 🔴, ações proibidas). **Guardião de Coexistência de Permissões** reforçado (ponte `url_erp_laravel`, dupla camada durante a convivência, default-deny nas duas pontas).
- **Wiring:** `comandos-oficiais.md` (registro + regra de modo), `migracao-analisar-tela` e `fase-05` (mapear acesso na investigação), `protocolo-revisao-paridade` e `fase-14` (permissão = dimensão dura), `protocolo-sincronizacao-memoria` (reconciliar ledgers/matriz; tela sem controle = 🟠). `mapa-permissoes.template` e seed `inventario-permissoes` superados pelo subsistema (viram ponteiros).

## [1.4.0] - 2026-06-08

### Adicionado

- **Cofre de Acessos do OML (`acessos.local.env`):** o agente passa a ter um "`.env` próprio" com os **acessos operacionais** que ele usa para **agir e resolver o problema de ponta a ponta** — logar no ERP legado/novo, consultar o banco, acessar integrações — sem depender do dev executar cada passo. Dois arquivos: `acessos.example.env` (só **chaves**, versionado, fonte em `docs/05-templates/acessos.example.env`) e `acessos.local.env` (**valores reais**, ignorado pelo git via `*.local.env`, classificado como **local** no `oml.manifesto.json`). Novo `docs/04-protocolos/protocolo-acessos-oml.md`; seed-if-missing no `/migracao-ativar` (cria o que faltar, garante o `.gitignore`, reporta blocos preenchidos × vazios **mascarados**); migração 1.4.0 no manifesto (propaga via `/oml-atualizar`). Regras duras no `guardiao-segredos-credenciais.md`: valores só no `.local.env`, nunca imprimir/ecoar/commitar/colar-no-chat, 2FA/captcha não se burla. Distinto da Importação de `.env` do legado (que mapeia só **chaves**). Bloco "Cofre de Acessos do OML" no template de perfil.

### Alterado

- **Protocolo de Push — pull-first + branch de homologação + lista de projetos** (promovido do relatório de aprimoramento do `rhc-erp-laravel` para a matriz): nova **etapa 0 "Sincronizar (pull)"** (`fetch`, puxar quando `behind > 0` com `--rebase` se também à frente, conferir diff líquido p/ não empurrar ruído); etapa 3 passa a **listar os projetos** que receberão push e a mirar a branch de **homologação** quando existir (produção/`main` só na ausência — push direto em produção com fluxo de homolog. = deploy → gate 🔴). `docs/04-protocolos/protocolo-push.md` e `docs/01-comandos/push.md` (ações obrigatórias/proibidas, checklist e frase de encerramento).

## [1.3.0] - 2026-06-07

### Adicionado

- **Instalação global dos comandos:** `scripts/instalar-comandos-globais.ps1` gera os comandos do OML em `~/.claude/commands/` apontando (caminho absoluto) para este OML, fazendo-os autocompletar em **qualquer pasta** — não só no clone do OML. Idempotente: re-rode após `/oml-atualizar` para pegar comandos novos. Comandos do projeto e do clone do OML têm **precedência** sobre os globais. `scripts/` passa a ser **motor** no `oml.manifesto.json`. (Documentado no README e em `comandos-oficiais.md`.)

## [1.2.1] - 2026-06-07

### Alterado

- **Documentação de cara para o GitHub:** README com badges (versão/licença/idioma), seção de uso dos **slash commands** (incl. o "reabra a sessão para carregar"), seção de **versionamento e atualização** e árvore de projeto atualizada. `introducao.md` reflete os três modos e o versionamento. `CONTRIBUTING.md` ganha regras de versionamento (SemVer, CHANGELOG, tag; `memoria/` nunca versionada).

## [1.2.0] - 2026-06-07

### Adicionado

- **Comandos do OML também dentro do projeto novo:** `/migracao-configurar-projeto` passa a gerar `.claude/commands/` na raiz do projeto (via novo `docs/05-templates/comando-projeto.template.md`), um slash command por comando do OML delegando a `../OML/docs/01-comandos/`. Assim os comandos **autocompletam no `/` onde o dev codifica**, não só dentro do clone do OML. Documentado em `protocolo-ativacao-permanente.md` (Camada 1) e refletido no `claude-md-projeto-novo.template.md`. (`/oml-atualizar` fica de fora — roda no clone do OML.) Os comandos do projeto se mantêm em dia via **seed-if-missing no `/migracao-ativar`**: comando novo do OML aparece no autocomplete sem reconfigurar.

## [1.1.0] - 2026-06-07

### Adicionado

- **Comandos do OML como slash commands de verdade:** `/migracao-ativar`, `/push`, `/oml-atualizar` e todos os demais agora são registrados em `.claude/commands/` (um arquivo fino por comando, delegando ao doc em `docs/01-comandos/`), aparecendo no autocomplete do `/`. `.claude/commands/` passa a ser **motor** no `oml.manifesto.json` (propaga via `/oml-atualizar`).

## [1.0.0] - 2026-06-07

### Adicionado

- **Sistema de versionamento e atualização não-destrutiva (Motor × Estado):** projetos que já usam o OML passam a receber as melhorias do agente **sem perder estado** (memória, decisões, histórico, regras de negócio, backlog, gates, pendências).
  - **Contrato Motor × Estado** — `oml.manifesto.json` (raiz) + `docs/00-visao-geral/politica-versionamento-atualizacao.md` declaram o que é sobrescrevível (motor) e o que é intocável (estado)
  - **`memoria/` saiu do versionamento** (`git rm -r --cached memoria` + `.gitignore`): `git pull` nunca mais colide com os dados do projeto; o esqueleto vazio virou seed do motor em `docs/05-templates/memoria-seed/`
  - **`VERSION`** (SemVer) na raiz — todo projeto sabe sua versão e o delta do CHANGELOG
  - **Comando `/oml-atualizar`** + `docs/04-protocolos/protocolo-atualizacao-oml.md`: backup → destrava a memória → traz só o motor → seed-if-missing → registra em `decisoes.md`/`historico-migracao.md` → relatório com ações humanas
  - **seed-if-missing na ativação** — `/migracao-ativar` cria a estrutura de memória que falta (clone novo ou após atualização) **sem tocar** no que já existe
  - **`.claude/settings.local.json`** (ignorado pelo git) para permissões específicas de máquina; o `settings.json` versionado fica genérico
- **Aprofundamento de Regras de Negócio (entendimento minucioso do legado):**
  - **Unidades legadas de 1ª classe** — extração cobre 🖥️ tela · 🔌 endpoint · ⚙️ job · 🧮 processamento · 📄 relatório (não só telas)
  - **Estado funcional da unidade** — ✔️ Funciona · ⚠️ quirk · ❌ Quebrada · 💀 Código morto (com evidência; ❌/💀 = decisão do dev, 💀 cruza o Mapa de Uso)
  - **Linhagem de dados** — mapa de cada input (origem do dado + comportamento) e catálogo de queries no ledger
  - **Fluxograma (Mermaid)** por unidade + **Atlas de Fluxos de Regras** (`memoria/atlas-regras-negocio.md`, comando `/migracao-gerar-atlas-regras`) dando ao dev a visão ampla do negócio do legado — doc agora, promovível a página Vue
  - Atualizados: `ledger-regras-negocio.template.md`, `protocolo-extracao-regras.md`, `fase-04.5`, `migracao-extrair-regras`, `guardiao-investigacao-legado.md` (reescrito de stub), `guardiao-regras-negocio.md`; novos `atlas-regras-negocio.template.md` e `migracao-gerar-atlas-regras.md`
  - **Marcação de "extração finalizada"** + *Definição de Pronto da Extração*: unidade só sai da fila quando 100% documentada; o OML **persegue toda unidade não finalizada** até cobrir o projeto inteiro (visível em `/migracao-status` e no painel do Atlas)
  - **Gate de completude auto-resolvível (self-healing)**: lacuna investigável **não aborta** — o OML investiga, preenche a memória e retoma; `/migracao-gerar-dossie` auto-completa a extração em vez de abortar. Só **gente** (🟠/❌/💀, aprovações) detém o agente. Distinção gate humano × gate de completude em `protocolo-gates-validacao.md`
  - **Linhagem profunda** (cadeia de transformações origem→…→exibição/persistência, documentada para consulta futura) + **diagramas ricos** (flowchart + sequence para side-effects/integrações)
  - **Backlog instrutivo**: `tipo_unidade`, `estado_funcional`, `extracao_regras`, `ledger`, `uso_real` no `backlog-telas.template.yaml`
- **Robustez de projetos novos (greenfield) — lote 2026-06-06:**
  - **Protocolo de Plugins do Claude** — detectar/usar `frontend-design` e outros skills disponíveis, orientar instalação quando ausentes (honesto sobre o que o agente faz) — `docs/04-protocolos/protocolo-plugins-claude.md`
  - **Protocolo de Decisão de Arquitetura** — árvore SPA/Inertia × SSR conforme necessidade de SEO/GEO, registrada antes de codar — `docs/04-protocolos/protocolo-decisao-arquitetura.md`
  - **Guardião de Reúso de Componentes** — reuse-first rigoroso, variante em vez de cópia, hierarquia token→primitivo→composto — `docs/03-guardioes/guardiao-reuso-componentes.md`
  - **Guardião + memória de Pendências Humanas** — o que só o dev faz (VPS, DNS, chaves de produção, legal) registrado e cobrado; bloqueia "pronto em produção" — `docs/03-guardioes/guardiao-pendencias-humanas.md`, `memoria/pendencias-humanas.md`, template
  - **Protocolo de Ativação Permanente** — `CLAUDE.md` no projeto novo + hook + CI para guardiões valerem sem `/migracao-ativar`; template `claude-md-projeto-novo.template.md` — `docs/04-protocolos/protocolo-ativacao-permanente.md`
  - **Protocolo de CI/Qualidade (GitHub)** — pipeline com lint, análise estática, testes, a11y, audit; merge só com tudo verde — `docs/04-protocolos/protocolo-ci-qualidade.md`
  - **Protocolo de criação/configuração Docker** — passo a passo multi-stage complementando o guardião — `docs/04-protocolos/protocolo-docker.md`
  - **Protocolo de Decomissionamento Pós-Entrega** — o que manter × aposentar × remover; caça a módulos órfãos — `docs/04-protocolos/protocolo-decomissionamento-pos-entrega.md`
- **Histórico de Aprimoramento único** (`historico-aprimoramento.md`): fonte canônica que consolida o log datado de sugestões, o status de implementação por rodada e o apêndice de gênese — referências repointadas em `politica-preservacao-contexto.md` e `/migracao-gerar-relatorio-aprimoramento`
- **Protocolo de Push** + comando `/push`: limpa debug/arquivos inúteis (**perguntando** no que for ambíguo — nunca deletar por suposição), commita **por tarefa e semanticamente** (Conventional Commits PT-BR) e só então dá o push — `docs/04-protocolos/protocolo-push.md`, `docs/01-comandos/push.md`
- **Guardião do Mapa de Uso × Backlog** (núcleo genérico): cruza log de acesso real do legado × backlog (`rota_laravel`) × navegabilidade da rota para priorizar migração por uso e confirmar paridade — `docs/03-guardioes/guardiao-mapa-uso-backlog.md` (relatório de aprimoramento 2026-06-05)
- **Análise de Uso × Backlog — Laravel**: resolvedor de status com **fallback ação→tela** (rota não-GET → `modulo.recurso.index`) e **tolerância a URL de diretório** (sem `.php` → `index.php`) — `docs/06-perfis/laravel/analise-uso-backlog.md` (2026-06-05)
- **Prop aditiva `linhaClass`** no componente de tabela canônico (estilo de linha dirigido por dados, sem quebrar hover/seleção/formatação) — `docs/06-perfis/vue/componentes.md` + reflexo no §12 do template de dossiê (2026-06-05)
- **Fluxo de Construção (greenfield)** — mapa de quais fases aplicam/pulam/substituem por modo — `docs/02-fases/fluxo-construcao.md` (Etapa 2/3 do modo construção)
- **Perfil de Construção (greenfield)** — moldura de modo que combina com o perfil de stack — `docs/06-perfis/construcao/perfil.md`
- **Modos de projeto** (`migracao` | `construcao` | `hibrido`): o OML passa a apoiar também a **construção de projetos novos (greenfield)**, não só migração — `docs/00-visao-geral/politica-modos-projeto.md`
- **Guardião de Boas Práticas Proativas** (catálogo-orquestrador de LGPD, acessibilidade, dark/light, HTML semântico, nomenclatura, responsividade, performance, segurança, i18n, SEO, design tokens, modelagem de dados) — `docs/03-guardioes/guardiao-boas-praticas-proativas.md`
- **Guardião de Tema Dark/Light** como fonte única de verdade (consolida descrições antes duplicadas em acessibilidade, design e Fase 04) — `docs/03-guardioes/guardiao-tema-dark-light.md`
- **Guardião de SEO** — `docs/03-guardioes/guardiao-seo.md`
- **Comando `/construir-capturar-requisitos`** (fonte de verdade do greenfield, equivalente à descoberta de telas) — `docs/01-comandos/construir-capturar-requisitos.md`
- **Template de Catálogo de Boas Práticas** por feature — `docs/05-templates/catalogo-boas-praticas.template.md`

### Alterado

- `filosofia.md`: reconhece os três modos; a fonte de verdade sempre existe, muda apenas de onde vem
- `politica-estrutura-workspace.md`: `diretorio_legado` agora opcional; novo cenário greenfield (sem legado não é erro)
- `migracao-ativar.md` / `migracao-configurar-projeto.md`: detecção/gravação do `modo`; perguntas de banco e `.env` do legado condicionais ao modo
- `perfil-projeto.template.md`: campo `modo`; blocos de legado condicionais
- `fase-04-pagina-visual-base.md`: dark/light por referência ao guardião dedicado; logomarca e backlog adaptados a greenfield (features planejadas)
- `guardiao-banco-dados.md`: reescrito de stub para os **3 sujeitos da escrita** — (1) CRUD do usuário na UI migrada = permitido/esperado, (2) escrita destrutiva do agente sobre dado real = proibida→sinalizar, (3) dado fake de teste controlado = autorizado; DDL só aditivo com `down()` no-op em tabela legada (2026-05-30)
- `guardiao-dados-teste.md`: adicionado o caso de **dado fake para validação controlada** (sujeito 3), com cross-link ao guardião de banco (2026-05-30)
- **Parametrização por modo (Etapa 2/3 greenfield):**
  - `regra-mae.md`: itens 1-5 lidos por modo (legado × decisão do dev); itens 6-23 valem nos três modos
  - `definicao-de-pronto.md`: validação final = paridade *(migração)* × critérios de aceite *(construção)*
  - `politica-autonomia.md`: nota de fases por modo apontando para `fluxo-construcao.md`
  - `fase-10` / `fase-13`: Models por modo (adaptado ao legado × schema novo via `guardiao-modelagem-dados.md`)
  - Stubs enriquecidos como "padrões a aplicar de berço": `guardiao-nomenclatura-semantica.md`, `guardiao-lgpd-privacidade.md`, `guardiao-seguranca.md`, `guardiao-performance.md`
- **Sem mudança de comportamento quando `modo: migracao`** — toda a esteira de migração permanece idêntica
- **Aprimoramentos do lote 2026-06-06:**
  - `guardiao-acessibilidade.md`: especificação rigorosa de **controle de fonte com nível atual visível**, **alto contraste cuidadoso** (tema por tokens, não `filter`) e **corte 100% de animação** (kill-switch CSS + JS, sem "meia animação")
  - `guardiao-mascaras-formatacao.md`: reescrito com **catálogo completo** PT-BR (CPF/CNPJ/RG/telefone/CEP/dinheiro/data/%/placa/cartão/PIX…), exibição × armazenamento, UX de paste/cursor/mobile, a11y e formatação no backend
  - `guardiao-testes.md`: reescrito com pirâmide, tipos obrigatórios por domínio, cobertura por criticidade, determinismo e anti-padrões
  - `guardiao-seo.md` → **SEO/GEO/AIO**: adiciona Generative Engine Optimization (ser citado por IA) e AI Optimization (dados consumíveis por IA)
  - `guardiao-lgpd-privacidade.md`: direitos do titular, cookies/consentimento, RIPD/DPIA, resposta a incidente, PII × IA, operadores/DPA
  - `guardiao-design.md`: leitura conjunta com reúso; marcado como inegociável/sempre-ativo
  - `guardiao-boas-praticas-proativas.md`: catálogo ampliado (reúso, arquitetura, SEO/GEO/AIO, CI, Docker, plugins, pendências humanas, decomissionamento)

### Removido

- `context.md` (conversa de gênese), `relatorio-aprimoramento-agente.md` (raiz), `memoria/relatorio-aprimoramento-agente.md` (cópia curta) e `aprimoramento/*` (relatórios de projeto transitórios) — todo o conteúdo de valor foi consolidado em `historico-aprimoramento.md`

---

## [1.0.0] — 2026-05-16

### Adicionado

- Estrutura inicial do OML
- Documentação de visão geral (filosofia, regra-mãe, políticas)
- 18 comandos oficiais documentados
- 20 fases de migração documentadas
- 40+ guardiões documentados
- 13 protocolos operacionais
- 22 templates reutilizáveis
- 5 perfis de stack/projeto
- Estrutura de memória operacional
- README com instruções de uso
- Licença MIT
- Guia de contribuição
- Código de conduta
