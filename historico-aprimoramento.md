# Histórico de Aprimoramento — OML

Fonte **única e canônica** do histórico de melhorias do OML. Consolida (e substitui) o antigo `relatorio-aprimoramento-agente.md`, sua cópia em `memoria/`, os relatórios de projeto transitórios de `aprimoramento/` e a conversa de gênese `context.md` — todos deletados após esta consolidação (2026-06-06).

> **Onde registrar novas melhorias:** acrescente uma linha na tabela "Log de sugestões" e, quando implementada, mova-a para a seção "Status de implementação" da rodada correspondente. Relatórios de projeto chegam em `aprimoramento/` (transitórios, gitignorados, apagados após consumo) e são consolidados aqui. O comando `/migracao-gerar-relatorio-aprimoramento` e a Fase 19 alimentam este arquivo.

---

## Status de implementação

### Rodada 2026-06-08

| Sugestão (data) | Onde foi implementado |
|---|---|
| Push: pull-first + alvo homologação + listar projetos (2026-06-08) | **Aplicado na OML do projeto** (`rhc-erp-laravel/OML`): `docs/04-protocolos/protocolo-push.md` (nova etapa "0. Sincronizar (pull)" + etapa 3 reescrita com branch-alvo homologação/fallback produção e lista de projetos), `docs/01-comandos/push.md` (ações obrigatórias/proibidas + frase de encerramento). **Pendente revisão p/ subir à matriz** (não aplicado aqui na matriz sem revisão, conforme regra do comando). |
| Guardião de Tema Dark/Light endurecido — cobrir cor escondida em `<script>` + exigir verificação nos 2 modos (2026-06-08) | **Aplicado na OML do projeto** (`rhc-erp-laravel/OML`): `docs/03-guardioes/guardiao-tema-dark-light.md` reescrito — Regra elevada a item **BLOQUEANTE** da Definição de Pronto; **tabela de padrões PROIBIDOS**; **regra nova "mapas de classe em `<script>` (`variantMap`/`statusColors`/computeds `*Class`) também precisam de `dark:`"**; **regra do componente compartilhado** (um light-only quebra N telas); **verificação obrigatória** (2 greps mecânicos + render nos 2 modos via `/styleguide`); **exceções explícitas** (QR/print/overlay); **Camada 3 — gate de CI**. **Pendente revisão p/ subir à matriz** (não aplicado aqui na matriz sem revisão, conforme regra do comando). |

> **Origem (uso real 2026-06-08):** ao rodar `/push`, o `rhc-erp` (legado, produção) aparecia 31 commits "à frente" só porque o `origin` estava desatualizado; após `fetch` virou 8 atrás / 3 à frente, e os commits à frente eram um par `ajuste`+`revert` com **diff líquido vazio**. O dev firmou a regra: (1) pull sempre que houver o que atualizar; (2) push vai para branch de **homologação** quando existir, produção só na ausência dela; (3) sempre listar os projetos que receberão push.

> **Origem (bug real 2026-06-08):** a tela `/acolher/qualidade` (ERP hospitalar) não respeitava dark mode. O culpado era o componente **compartilhado** `RhcKpiCard.vue`: fundo `bg-white` sem `dark:` **e** um `variantMap` em `<script>` 100% light-only — cor escondida em objeto JS escapa da revisão visual do `<template>`, e por ser componente compartilhado quebrava o tema escuro de N telas (Painel, Qualidade, CRM, DesignSystem). Corrigido o componente no projeto; o guardião foi endurecido para que **cor em `<script>`** e **componente compartilhado light-only** não se repitam. Classificação: **Vue / Design System / núcleo genérico**. Prioridade: **Alta**. Vira melhoria no GitHub: **sim** (retrocompatível).

### Rodada 2026-06-07

| Sugestão (data) | Onde foi implementado |
|---|---|
| Atualizar OMLs em uso sem perder memória/histórico dos projetos (2026-06-07) | Separação **Motor × Estado**: `oml.manifesto.json`, `docs/00-visao-geral/politica-versionamento-atualizacao.md`, `VERSION`; `memoria/` destravada do git (`git rm --cached`) + `.gitignore`; esqueleto vazio em `docs/05-templates/memoria-seed/`; comando `/oml-atualizar` + `docs/04-protocolos/protocolo-atualizacao-oml.md`; seed-if-missing em `migracao-ativar.md`; `.claude/settings.local.json` ignorado; registros em `comandos-oficiais.md`, `README.md`, `CHANGELOG.md` |
| Comandos do OML viram slash commands de verdade — autocomplete do `/` (2026-06-07) | `.claude/commands/` com 1 arquivo por comando (delegando a `docs/01-comandos/`); `.claude/commands/` marcado como motor no manifesto; bump v1.1.0 |
| Comandos do OML autocompletando dentro do projeto novo (2026-06-07) | `docs/05-templates/comando-projeto.template.md`; passo de geração em `migracao-configurar-projeto.md`; `protocolo-ativacao-permanente.md` (Camada 1) e `claude-md-projeto-novo.template.md` atualizados; **seed-if-missing de comandos no `/migracao-ativar`** (mantêm-se em dia); bump v1.2.0 |
| Comandos do OML disponíveis globalmente (2026-06-07) | `scripts/instalar-comandos-globais.ps1` gera os comandos em `~/.claude/commands/` (caminho absoluto p/ este OML); autocompletam em qualquer pasta; re-rodar após update; `scripts/` vira motor; bump v1.3.0 |
| Documentação do GitHub atualizada (2026-06-07) | `README.md` (badges, uso de slash commands, versionamento, árvore), `docs/00-visao-geral/introducao.md` (3 modos + versionamento), `CONTRIBUTING.md` (regras de versionamento); bump v1.2.1 |

> **Ação humana pendente:** limpar os caminhos absolutos de `.claude/settings.json` (o harness do Claude Code bloqueia a edição automática desse arquivo — proteção contra auto-concessão de permissão) e migrar permissões específicas de máquina para `.claude/settings.local.json`.

### Rodada 2026-06-06

| Sugestão (data) | Onde foi implementado |
|---|---|
| Banco de dados: 3 sujeitos da escrita — CRUD do usuário ✅ × escrita destrutiva do agente ⛔ × dado fake de teste ✅ (2026-05-30) | `docs/03-guardioes/guardiao-banco-dados.md` (reescrito de stub), `docs/03-guardioes/guardiao-dados-teste.md` (caso 3) |
| Prop aditiva `linhaClass` na tabela canônica (2026-06-05) | `docs/06-perfis/vue/componentes.md`, `docs/05-templates/dossie-tela.template.md` (§12) |
| Resolvedor de status: fallback ação→tela + tolerar URL de diretório (2026-06-05) | `docs/06-perfis/laravel/analise-uso-backlog.md` |
| Padrão "Mapa de Uso × Backlog" como guardião do núcleo (2026-06-05) | `docs/03-guardioes/guardiao-mapa-uso-backlog.md` |
| Modo construção (greenfield) — Etapa 2/3 | `docs/02-fases/fluxo-construcao.md`, `docs/06-perfis/construcao/perfil.md`; parametrização por modo em `regra-mae.md`, `definicao-de-pronto.md`, `politica-autonomia.md`, `fase-10`, `fase-13`; stubs enriquecidos (`guardiao-nomenclatura-semantica/lgpd-privacidade/seguranca/performance`) |
| Protocolo de Push (limpar → commitar por tarefa → push; regra de ouro: nunca deletar arquivo ambíguo sem perguntar) | `docs/04-protocolos/protocolo-push.md`, `docs/01-comandos/push.md`, `comandos-oficiais.md` |
| Consolidação do histórico de aprimoramento num arquivo único | este arquivo (`historico-aprimoramento.md`) |

### Rodada 2026-05-28

Auditoria cruzada de todas as sugestões contra a matriz OML (com citação `arquivo:linha`).

**Já implementado antes desta rodada (verificado):** ambiente/Docker, importação do `.env` do legado, coleta de dados do dev (nome/email/repo), busca de logomarcas, biblioteca de ícones, 2 Gates + 3 níveis de autonomia, Gate 1 com todos os componentes, riscos em lista breve, menu gerado do backlog, filosofia de autorização/proatividade e disciplina de fluxo/pendências.

**Implementado nesta rodada:**

| Sugestão (data) | Onde foi implementado |
|---|---|
| Regras de negócio como fase própria (2026-05-28) | `docs/02-fases/fase-04.5-extracao-regras-negocio.md`, `docs/01-comandos/migracao-extrair-regras.md`, `docs/03-guardioes/guardiao-regras-negocio.md` (expandido), `docs/04-protocolos/protocolo-extracao-regras.md` |
| Ledger estruturado com tipo, citação e status (2026-05-28) | `docs/05-templates/ledger-regras-negocio.template.md`, `memoria/regras-negocio/_README.md`, espelho no `dossie-tela.template.md` (bloco 7) |
| Status 🟠 Possível bug / 🔴 Bug intencional (2026-05-28) | enum de status no guardião de regras, ledger e dossiê; encaminhamento a `pendencias.md`/`decisoes.md` |
| Gates bloqueantes (abortar) (2026-05-28) | `docs/04-protocolos/protocolo-gates-validacao.md`; gate duro em `migracao-gerar-dossie`, `migracao-analisar-tela`, `migracao-extrair-regras`; `memoria/gates/_README.md` |
| Scaffolds alucinados (Models × `Schema::hasTable`) (2026-05-28) | `docs/04-protocolos/protocolo-varredura-models.md`, `memoria/scaffolds-suspeitos.md`, etapa no `migracao-ativar` |
| Separar Fase 05 ("o que existe") de 04.5 ("o que vale") (2026-05-28) | `fase-05-investigacao-tela.md` e `fase-04.5-extracao-regras-negocio.md` |
| Modo greenfield/híbrido (2026-05-28) | reflexo no ledger; fonte autoritativa em `docs/00-visao-geral/politica-modos-projeto.md` |
| Referência cruzada multi-app (2026-05-28) | seção "Convivência multi-app" no guardião de regras + `regras-negocio/_README.md` + ledger |
| Sincronização memória↔código (2026-05-18 / 2026-05-19) | `docs/01-comandos/migracao-sincronizar.md`, `docs/04-protocolos/protocolo-sincronizacao-memoria.md`, etapa no `migracao-ativar` |
| Guardião contínuo transversal (a cada turno) (2026-05-18) | `guardiao-continuo-padronizacao.md` (atuação transversal) |
| `<ai_directive>` no Styleguide (2026-05-19) | `docs/04-protocolos/protocolo-diretivas-ia-styleguide.md` |
| Composables obrigatórios (2026-05-19) | `docs/06-perfis/vue/composables-obrigatorios.md` |
| Auto-limpeza / refatoração proativa (2026-05-19) | `docs/00-visao-geral/politica-auto-limpeza-refatoracao.md`; `migracao-auditar-padroes` e `fase-13` alinhados |

---

## Log de sugestões (completo, por data)

| Data | Problema | Classificação | Sugestão | Prioridade |
|---|---|---|---|---|
| 2026-05-16 | OML não oferecia opção de uso com Docker | Ambiente | Apresentar opções (local, Docker, a definir) com prós/contras e perguntar preferência do dev | Média |
| 2026-05-16 | OML não aproveitava o .env do legado para alinhar configurações | Configuração | Pedir autorização para analisar o .env do legado, mapear variáveis automaticamente e sugerir .env.example | Alta |
| 2026-05-16 | OML não coletava dados do dev (nome, email, repo) durante o fluxo | Rastreabilidade | Perguntar nome, email e URL do repositório no início da configuração do projeto | Alta |
| 2026-05-16 | OML não buscava logomarcas do legado e arriscava usar logos aleatórias | Design | Buscar logos locais e URLs externas (R2, S3, CDN) no legado, documentar e usar nos protótipos — nunca inventar | Alta |
| 2026-05-16 | OML fazia perguntas técnicas que devs novatos não saberiam responder | Princípio | OML deve pedir autorização, investigar sozinho, sugerir opções concretas e perguntar a preferência — nunca esperar conhecimento técnico do dev | Crítica |
| 2026-05-16 | OML não definia biblioteca de ícones e não orientava o dev sobre opções | Design | Sugerir bibliotecas de ícones compatíveis com a stack (ex: Heroicons/Lucide para Vue 3), apresentar prós/contras e registrar a escolha no perfil | Alta |
| 2026-05-16 | OML parava em toda fase pedindo autorização, esgotando o dev | Autonomia | Reestruturar para 2 Gates (Design System + Homologação), fluxo autônomo no meio. 3 níveis: 🟢 Autônomo, 🟡 Resumo, 🔴 Crítico | Crítica |
| 2026-05-16 | Gate 1 (Design System) não exigia TODOS os componentes de uma vez | Design | Obrigar construção de absolutamente todos os componentes (menus, sidebar, topbar, botões, inputs, tabelas, modais, etc.) antes de prosseguir | Crítica |
| 2026-05-16 | Riscos geravam relatórios longos que cansavam o dev | Autonomia | Riscos devem ser uma lista breve, pouco texto, sem parar. Só eleva para 🔴 se for segurança do paciente ou financeiro | Alta |
| 2026-05-16 | OML se desviava do fluxo de migração quando o dev pedia tarefas fora do escopo | Disciplina | OML nunca se desvia do fluxo. Pedidos fora do escopo vão para `memoria/pendencias.md`. Fase por fase, sem pular | Crítica |
| 2026-05-16 | Menu era criado manualmente e não refletia o progresso da migração | Design | Menu gerado a partir do backlog: telas pendentes com texto claro (disabled), telas migradas com texto escuro e rota (ativo). Menu na página de Design System | Crítica |
| 2026-05-18 | OML não possui sincronização automática entre código-fonte e o histórico de migração | Rastreabilidade | Embutir no `/migracao-ativar` ou criar comando específico para varrer os Controllers e Pages e auto-atualizar o `historico-migracao.md` com as telas prontas. | Média |
| 2026-05-18 | Agente perde o contexto ou a vigilância ativa sobre os guardiões e regras durante fluxos de trabalho contínuos | Atenção/Vigilância | Criar um mecanismo de "Guardião Contínuo" (script de background, watcher local ou gatilho de sistema persistente) que valide passivamente o trabalho e reforce as regras a cada turno, garantindo que o agente nunca "durma no ponto" nos detalhes em sua responsabilidade. | Crítica |
| 2026-05-19 | Agente ignora o Styleguide e recria estilos ou componentes já existentes usando Tailwind | Governança de IA | Inserir uma `<ai_directive>` rígida dentro do código do `Styleguide/Index.vue` com regras estritas (ex. usar `RhcButton`) para forçar o agente a consultar e obedecer ao design system quando ler o arquivo. | Crítica |
| 2026-05-19 | Agente ignora lógicas de negócio ou formatação já encapsuladas, criando funções JS duplicadas | Governança de IA | Inserir na diretiva a proibição explícita de reescrever lógicas e obrigar o uso dos Composables do projeto (`useMasks`, `useTheme`, `useA11y`). | Alta |
| 2026-05-19 | Agente ignora botões ou componentes legados que vê durante o escaneamento ou edição de arquivos | Refatoração | Adicionar regra de "Auto-limpeza" (Refatoração Proativa) na diretiva. Ao escanear qualquer arquivo que viole o Styleguide, a IA é obrigada a refatorá-lo imediatamente para o padrão novo. | Alta |
| 2026-05-19 | Memória do OML fica desatualizada — agente opera com dados obsoletos sobre telas migradas, componentes e decisões | Sincronização | Ao executar `/migracao-ativar`, o OML **deve obrigatoriamente** varrer o projeto real (Controllers, Pages, Components, menu.js) e sincronizar automaticamente todos os arquivos de `memoria/` (historico-migracao.md, inventario-componentes.md, decisoes.md, pendencias.md, riscos.md) antes de iniciar qualquer trabalho. Nunca operar com memória defasada. | Crítica |
| 2026-05-28 | Guardião de Regras de Negócio era um stub de 4 linhas e regras viravam apenas 1 de 21 blocos do dossiê funcional, perdendo foco e rastreabilidade | Núcleo genérico / Governança | Promover regras de negócio a **fase própria** (Fase 04.5) com comando dedicado (`/migracao-extrair-regras`), template estruturado e ledger persistido em `memoria/regras-negocio/{slug}.md`. Cada regra precisa de tipo (validação/cálculo/fluxo/permissão/side-effect/temporal/integração/mensagem/default/quirk), citação direta `arquivo:linha` e status explícito (✅ Confirmada / 🟡 Hipótese / 🟠 Possível bug / 🔴 Bug intencional do legado). Ledger vira fonte da verdade consultável que sobrevive ao fim da migração. | Crítica |
| 2026-05-28 | Instruções textuais "antes de X, faça Y" são frequentemente puladas pelo agente ou pelo dev quando estão sob pressão de tempo | Núcleo genérico / Disciplina | Adotar **gates bloqueantes** entre fases críticas em vez de instruções soft. O comando da fase posterior deve **abortar com mensagem explícita** se o artefato da fase anterior não existir (ex: `/migracao-gerar-dossie` aborta sem `regras-negocio/{slug}.md`). Gate duro > convenção implícita. | Alta |
| 2026-05-28 | Scaffolds alucinados (Model→tabela inexistente, Vue inventando campos, controller chamando métodos fantasmas) aparecem repetidamente em projetos onde o setup inicial foi feito sem confirmar schemas do banco vivo, e só são descobertos no momento da migração (gerando retrabalho integral) | Núcleo genérico / Anti-alucinação | Adicionar etapa automática no `/migracao-ativar` que varre todos os Models do projeto e valida cada `$table` contra `Schema::hasTable()`, emitindo relatório `memoria/scaffolds-suspeitos.md` antes de qualquer trabalho. Modelos órfãos passam a ser pendência prioritária. | Crítica |
| 2026-05-28 | Cada tela tem 1+ "quirks" do legado (`GROUP BY` que retorna valor indeterminado, ORDER BY ausente, input hidden duplicado, cálculo dividindo por 100 quando dados estão em unidade base, etc.) — extrair como "regra" sem marcar pode levar o novo a reproduzir bugs silenciosamente OU a "corrigir" comportamento intencional e quebrar dados de produção | Núcleo genérico / Anti-alucinação | Ledger de regras precisa de status `🟠 Possível bug — perguntar ao dev` e `🔴 Bug intencional do legado` separados de `✅ Confirmada`. Diferenciar bug × intenção é decisão estratégica do dev, nunca silenciosa do agente. Toda mudança vs. legado deve ser registrada em `decisoes.md`. | Crítica |
| 2026-05-28 | OML foi modelada para migração pura mas projetos reais frequentemente são híbridos (migração de domínios legados + features 100% novas no mesmo projeto, ou novo projeto que herda domínios de um legado existente) | Núcleo genérico / Escopo | Reconhecer explicitamente o **modo greenfield/híbrido** no spec do guardião de regras: regras "inéditas" são registradas no mesmo ledger com origem = decisão do dev (`decisoes.md`) + telas análogas referenciadas. Mesmo formato, mesma fonte da verdade. Evita criar paralela "OML-criacao" forkada. | Alta |
| 2026-05-28 | Projetos modernos cada vez mais são compostos por 2+ apps que conversam via API (admin + portal de usuário, mobile + web, microserviços), e a mesma regra de negócio implementada em 2 lugares vai divergir | Núcleo genérico / Arquitetura | Ledger de regras suporta **referência cruzada entre apps**: regra mora no app que **escreve** (geralmente o admin); apps que apenas **leem** referenciam via link, não duplicam. Divergência de comportamento é proibida e vira pendência. Documentar na seção "Convivência multi-app" do README de `regras-negocio/`. | Alta |
| 2026-05-28 | Investigação técnica do legado (`/migracao-analisar-tela` + Fase 05) e extração de regras de negócio são confundidas porque ambas leem o código legado, mas servem propósitos diferentes (a primeira mapeia o que existe; a segunda destila o que vale) | Núcleo genérico / Separação de responsabilidades | Manter Fase 05 (Investigação Técnica) focada em "o que existe" (arquivos, tabelas, integrações, dependências) e nova Fase 04.5 (Extração de Regras) focada em "o que vale" (validações, cálculos, fluxos). A primeira alimenta a segunda, mas são saídas separadas com gates separados. Investigação sem regras destiladas → dossiê genérico e sem foco. | Média |
| 2026-05-30 | A política "não alterar o banco / não excluir dados sem autorização" era ambígua e fazia o agente hesitar ou auto-bloquear ao migrar telas de gestão cujo propósito é o USUÁRIO editar/excluir (CRUD) | Núcleo genérico / Governança de IA + Segurança de dados | Separar explicitamente no guardião de banco **3 sujeitos**: (1) CRUD do USUÁRIO na UI migrada = permitido e esperado; (2) escrita destrutiva do AGENTE automática/silenciosa sobre dado real = proibida → sinalizar; (3) dado FAKE de teste controlado, removido em seguida = autorizado. DDL: só CREATE aditivo, `down()` no-op em tabela legada. A régua é sobre QUEM dispara e se é dado real ou de teste, não sobre o verbo SQL. | Crítica |
| 2026-06-05 | Componente de tabela canônico não tinha estilo de linha dirigido por dados — destacar linha crítica/em alerta exigiria gambiarra por tela, quebrando a paridade comportamental | Vue / Design System | Adicionar prop **aditiva** `linhaClass` (string \| função `(linha, index) => string`, default null) ao componente de tabela — sem interferir em hover/seleção/formatação. Incluir na spec do Dossiê (§ Design). | Média |
| 2026-06-05 | "Análise de Uso" só gerava o botão **Novo** (deep-link) quando a rota era GET navegável → endpoints de ação migrados (POST) apareciam sem link, e URLs de diretório não casavam | Laravel / Rastreabilidade | No resolvedor de status: (1) **fallback ação→tela** — rota não-GET tenta o `modulo.recurso.index` (GET) do mesmo grupo; (2) **tolerar URL de diretório** (sem `.php`) → `index.php` do módulo. | Média |
| 2026-06-05 | O método "esta tela do legado já foi migrada e onde?" — cruzar log de acesso real × backlog (`rota_laravel`) × navegabilidade — era poderoso mas estava implícito, não documentado como artefato/guardião | Processo / Núcleo genérico | Documentar o padrão "**Mapa de Uso × Backlog**": (a) instrumentar o legado p/ logar acesso; (b) backlog = fonte única do vínculo legado→rota nova; (c) relatório ranqueia telas por uso real e linka legado/novo. Vira guardião/relatório no núcleo genérico. | Alta |
| 2026-06-08 | O Protocolo de Push só tratava limpar→commitar→push e ignorava (a) atualizar o projeto antes (pull), (b) qual branch recebe o push em repos com fluxo de homologação e (c) a transparência de quais projetos serão empurrados num push multi-projeto | Núcleo genérico / Processo | Acrescentar ao Protocolo de Push: **(1) etapa 0 "Sincronizar (pull)"** — `fetch` + se `behind>0` puxar (`--rebase` quando também à frente), e checar diff líquido p/ não empurrar commits que se cancelam; **(2) branch-alvo** — push vai para a branch de **homologação** quando existir, produção/`main` só na ausência dela (push direto em produção com fluxo de homolog. = deploy → gate 🔴); **(3) lista de projetos** — sempre enumerar os projetos que receberão push (e os de fora, com motivo). | Alta |

---

## Apêndice — Gênese (consolidado de `context.md`)

A conversa de gênese (256KB) foi a origem do OML; **praticamente todo o seu conteúdo já se materializou na matriz** (`docs/`). Preserva-se aqui apenas o que é difícil de reconstruir a partir do código.

**Evolução do nome:** RHC Migration Agent → Agente de Migração Legada → **OML (Orquestrador de Migração Legada)** — "orquestrador" para refletir os múltiplos guardiões + fases.

**Correções de comportamento que moldaram o agente:**
- O agente **não é "fazedor de código"** — é investigador/documentador/testador; executor só por último.
- Não depender de respostas que o dev não sabe — **investigar** em vez de exigir objetivo/arquivos/tabelas.
- "Refazer do zero" → "**reconstruir com o legado como fonte de verdade**" (reduz alucinação).
- Não "corrigir" comportamento legado sem autorização (matriz bug × regra).
- Documentar todo elemento visual inédito **antes** de consolidar como padrão.
- Comparar lista manual de URLs × URLs descobertas e apontar telas esquecidas.
- Encerrar fase/microfase **formalmente** ("100%" + próximo passo) para não perder contexto.
- Manter **memória operacional em arquivos** (a IA perde contexto; os arquivos mantêm o projeto vivo).
- Agente como **guardião contínuo** pós-migração e que **aprende** (gera relatório de aprimoramento por stack).
- Escrever o agente como **documentação operacional executável** (arquivos pequenos com formato fixo), não um prompt gigante único.

**Referências normativas adotadas:** WCAG 2.2 (AA baseline, AAA quando viável), LGPD (Lei 13.709/2018), OWASP Top 10, OWASP ASVS 5.0, NIST SP 800-34 (DR), Laravel Pint.

**Tema-núcleo do produto:** migração cirúrgica por super microfases com gates de autorização · preservação inviolável do legado (banco/regras/permissões/integrações) como fonte de verdade até o novo estar 100% · governança por múltiplos guardiões + documentação viva, tudo em PT-BR.
