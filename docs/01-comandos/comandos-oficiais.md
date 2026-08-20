# Comandos Oficiais do OML

## Objetivo

Listar e explicar todos os comandos disponíveis no OML.

## Quando usar

Sempre que precisar saber qual comando usar em determinada situação.

---

## Lista completa de comandos

| Comando | Quando usar | O que faz |
|---|---|---|
| `/migracao-ativar` | No início do projeto / quando a memória pode estar defasada | Inicia o OML, detecta o modo, sincroniza memória (varre o código) e carrega regras |
| `/migracao-ativar-rapido` | Padrão do dia a dia — trabalho contínuo, código sem mudanças relevantes | Ativação enxuta: carrega regras + garante memória + pendências + status, **sem** varrer o código. Para refrescar a memória, rode `/migracao-sincronizar` |
| `/oml-atualizar` | Quando o motor do OML evoluiu | Atualiza o **motor** do OML preservando o **estado** do projeto (memória, decisões, regras). Ver `docs/04-protocolos/protocolo-atualizacao-oml.md` |
| `/migracao-sincronizar` | Início de sessão / sob demanda | Varre o código real e sincroniza `memoria/` (telas, componentes, scaffolds) |
| `/migracao-configurar-projeto` | Após ativar | Define modo, perfil, stack e políticas |
| `/construir-capturar-requisitos` | Construção/Híbrido, por feature | Captura requisitos e gera a fonte de verdade da feature nova |
| `/migracao-descobrir-telas` | Migração/Híbrido — descoberta | Encontra telas do legado automaticamente |
| `/migracao-carregar-urls` | Complemento manual | Adiciona URLs manualmente |
| `/migracao-gerar-mapa-hierarquico` | Após descoberta | Organiza telas por hierarquia |
| `/migracao-extrair-regras` | Por unidade, antes de analisar (Fase 04.5) | Destila regras de negócio no ledger `regras-negocio/{slug}.md` (estado funcional, linhagem de inputs, queries, fluxograma) |
| `/migracao-gerar-atlas-regras` | Após extrair regras de unidades | Agrega os ledgers no Atlas de Fluxos de Regras (`memoria/atlas-regras-negocio.md`) — visão ampla do negócio do legado |
| `/migracao-analisar-tela` | Para cada tela | Investiga o que existe (técnico) de uma tela |
| `/migracao-mapear-permissoes` | Por tela, na investigação (Fase 05) | Mapeia o controle de acesso nos 8 eixos (auth/tela/setor/unidade/nível/ação/domínio/auditoria) no ledger `permissoes/{slug}.md` + matriz RBAC; veredito de paridade (default-deny, sem escalonamento/lockout) |
| `/migracao-gerar-dossie` | Após análise | Gera dossiê funcional completo (gate duro: exige o ledger de regras) |
| `/migracao-propor-interface` | Após dossiê | Propõe protótipo visual |
| `/migracao-planejar-implementacao` | Após protótipo | Cria plano técnico |
| `/migracao-autorizar-implementacao` | Quando pronto | Libera para codificação |
| `/migracao-revisar-paridade` | Após implementação (Fase 14) | Agente rigoroso de paridade: ficha D1–D11 + ledger de regras + 8 eixos de permissão, e **write-back no painel** (`verificado_agente` + links íntegros). Ver `docs/04-protocolos/protocolo-paridade-rigorosa.md` |
| `/migracao-homologar` | Após paridade (Gate 2) | Homologa com o usuário; exige `verificado_agente` no painel (auto-resolve se faltar) e grava `homologado` no "sim" do dev |
| `/migracao-auditar-padroes` | A qualquer momento | Audita padrões do repositório |
| `/migracao-gerar-relatorio-aprimoramento` | Periodicamente | Gera relatório de melhorias |
| `/migracao-status` | A qualquer momento | Mostra status geral |
| `/commit` | Ao querer consolidar o trabalho sem publicar ainda | Limpa inúteis (perguntando no que for ambíguo) e commita por tarefa e semanticamente, em todos os projetos do workspace — sem dar push (ver `docs/04-protocolos/protocolo-commit.md`) |
| `/push` | Ao fechar um bloco versionável | Roda a limpeza e o commit do `/commit` e, além disso, escolhe os projetos e dá o push (ver `docs/04-protocolos/protocolo-push.md`) |
| `/migracao-proxima-tela` | Após concluir uma tela | Avança para a próxima |
| `/migracao-bloquear` | Quando necessário | Bloqueia uma tela/módulo |
| `/migracao-retomar` | Após bloqueio | Retoma tela bloqueada |

---

## Regras gerais

1. Cada comando documenta: quando usar, o que faz, o que não faz, arquivos que atualiza, exemplo e próximo passo.
2. Nenhum comando de implementação pode ser executado sem autorização prévia.
3. Comandos de investigação e documentação podem ser executados livremente.
4. Comandos com **gate duro** abortam com mensagem se o artefato da fase anterior não existir (ver `docs/04-protocolos/protocolo-gates-validacao.md`). Gate duro > convenção implícita.
5. Os comandos de **descoberta/paridade do legado** (`descobrir-telas`, `carregar-urls`, `gerar-mapa-hierarquico`, `analisar-tela`, `extrair-regras`, `mapear-permissoes`, `revisar-paridade`) só se aplicam em modo **migração/híbrido**. Em modo **construção**, a fonte de verdade vem de `/construir-capturar-requisitos`. Os demais comandos (configuração, propor-interface, planejar/autorizar implementação, homologar, auditar, status) são compartilhados entre os modos (ver `docs/00-visao-geral/politica-modos-projeto.md`).
6. `/oml-atualizar` é **agnóstico de modo** (vale para migração, construção e híbrido) e mexe no **motor** do agente — não confundir com `/migracao-sincronizar` (reconcilia a **memória** com o código) nem com `/migracao-ativar` (carrega o agente na sessão). Ver `docs/00-visao-geral/politica-versionamento-atualizacao.md`.
7. Todos estes comandos estão registrados como **slash commands do Claude Code** em `.claude/commands/` (motor, versionado) — aparecem no autocomplete do `/` quando o diretório de trabalho é o clone do OML. Cada arquivo delega ao doc correspondente em `docs/01-comandos/`. Para tê-los **dentro do projeto novo** (onde se codifica), o `/migracao-configurar-projeto` gera os comandos em `.claude/commands/` do projeto; e para tê-los em **qualquer pasta**, rode `scripts/instalar-comandos-globais.ps1` (instala em `~/.claude/commands/` apontando para este OML; re-rode após `/oml-atualizar`). Precedência: projeto > clone do OML > global.
