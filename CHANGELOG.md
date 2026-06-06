# Changelog

Todas as mudanças relevantes do OML serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/).

---

## [Não lançado]

### Adicionado

- **Aprofundamento de Regras de Negócio (entendimento minucioso do legado):**
  - **Unidades legadas de 1ª classe** — extração cobre 🖥️ tela · 🔌 endpoint · ⚙️ job · 🧮 processamento · 📄 relatório (não só telas)
  - **Estado funcional da unidade** — ✔️ Funciona · ⚠️ quirk · ❌ Quebrada · 💀 Código morto (com evidência; ❌/💀 = decisão do dev, 💀 cruza o Mapa de Uso)
  - **Linhagem de dados** — mapa de cada input (origem do dado + comportamento) e catálogo de queries no ledger
  - **Fluxograma (Mermaid)** por unidade + **Atlas de Fluxos de Regras** (`memoria/atlas-regras-negocio.md`, comando `/migracao-gerar-atlas-regras`) dando ao dev a visão ampla do negócio do legado — doc agora, promovível a página Vue
  - Atualizados: `ledger-regras-negocio.template.md`, `protocolo-extracao-regras.md`, `fase-04.5`, `migracao-extrair-regras`, `guardiao-investigacao-legado.md` (reescrito de stub), `guardiao-regras-negocio.md`; novos `atlas-regras-negocio.template.md` e `migracao-gerar-atlas-regras.md`
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
