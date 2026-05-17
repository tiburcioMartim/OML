# Fase 04 — Página Visual Base

## Autonomia: 🔴 Crítico — GATE 1

**O OML NÃO avança para a Fase 05 sem aprovação explícita do layout pelo dev.**
Este é o gate mais importante de toda a migração. Todos os componentes devem ser construídos aqui.

## Objetivo
Criar a Página Visual base com TODOS os tokens, TODOS os componentes e IDs únicos antes da primeira tela migrada.

## Ações obrigatórias

### Tokens Visuais
- [ ] Definir cores (primária, secundária, neutras, feedback, acentos)
- [ ] Definir tipografia (família, tamanhos, pesos, line-heights)
- [ ] Definir espaçamentos (escala de spacing)
- [ ] Definir bordas (radius, espessuras)
- [ ] Definir sombras (elevações)

### Logomarcas
- [ ] Documentar logomarcas do legado (caminhos/URLs, formatos, dimensões)
- [ ] Incorporar logomarcas do legado nos tokens visuais do design system
- [ ] Nunca gerar ou inventar logomarcas — usar as do legado ou solicitar ao dev

### Biblioteca de Ícones
- [ ] Sugerir bibliotecas de ícones compatíveis com a stack do projeto (ex: Heroicons, Lucide, Phosphor para Vue 3; Blade Icons para Laravel) — apresentar opções com prós/contras e perguntar a preferência do dev
- [ ] Registrar a biblioteca de ícones escolhida no perfil do projeto

### Componentes de Layout (TODOS obrigatórios)
- [ ] Sidebar / Menu lateral com **modo acordeão nativo** (ver `docs/03-guardioes/guardiao-menus-navegacao.md`):
  - Ícone **chevron** (seta) em cada grupo indicando aberto ▼ / fechado ▶
  - Subitens expandem/recolhem com animação suave ao clicar no cabeçalho do grupo
  - Apenas um grupo aberto por vez (accordion clássico)
  - Estado persistido em localStorage — lembra a preferência do usuário
  - Grupo da página ativa abre automaticamente
  - Colapso total da sidebar (ícones somente), indicador de ativo, submenus
- [ ] **Menu gerado imediatamente a partir do backlog de telas (`memoria/backlog-telas.yaml`):**
  - Tela **pendente** (ainda não migrada) → texto claro/apagado, sem rota (visual disabled)
  - Tela **migrada** → texto escuro, rota vinculada ao botão (visual ativo, clicável)
  - O menu deve refletir automaticamente o progresso da migração
  - Conforme telas forem sendo migradas, o menu se "acende" progressivamente
- [ ] **Menu deve estar presente na página de Design System / guia visual** como componente documentado
- [ ] Topbar / Header (com logo, busca, notificações, avatar do usuário, logout)
- [ ] Breadcrumb (com navegação hierárquica)
- [ ] Footer (se aplicável)
- [ ] Layout principal (grid/flex com sidebar + content area)
- [ ] Página wrapper (com título, ações, filtros)

### Componentes Flutuantes Obrigatórios
- [ ] **Botão de Acessibilidade** — widget flutuante (floating), sempre visível e de fácil acesso em todas as páginas. Deve abrir um painel com:
  - Toggle de alto contraste
  - Ajuste de tamanho de fonte (aumentar / diminuir / resetar)
  - Toggle de redução de movimento (`prefers-reduced-motion`)
  - Toggle de modo daltônico (se aplicável)
  - Posição fixa na tela (canto inferior esquerdo ou direito — perguntar ao dev)
  - Deve funcionar em todas as páginas, não apenas no Design System
- [ ] **Botão Rolar para Cima (Scroll to Top)** — botão flutuante que aparece ao rolar a página para baixo. Deve:
  - Aparecer somente após scroll de pelo menos 300px
  - Executar scroll suave (`smooth scroll`) até o topo
  - Ter animação de entrada/saída
  - Ser acessível por teclado
  - Estar presente em TODAS as páginas do sistema
- [ ] **Toggle Dark/Light Mode** — alternância nativa do sistema. Deve:
  - Estar visível no Topbar/Header ou no painel de acessibilidade (perguntar ao dev)
  - Respeitar a preferência do sistema operacional (`prefers-color-scheme`) como padrão inicial
  - Persistir a escolha do usuário (localStorage ou banco)
  - Aplicar a transição de tema de forma suave (sem flash de tela branca)
  - Funcionar em TODOS os componentes do Design System desde o início

### Componentes de Interface (TODOS obrigatórios)
- [ ] Botões (primário, secundário, ghost, danger, outline, loading, disabled, com ícone)
- [ ] Inputs (text, password, email, number, search, com validação, com ícone)
- [ ] Select (simples, múltiplo, com busca)
- [ ] Date picker
- [ ] Textarea
- [ ] Checkbox e Radio
- [ ] Toggle / Switch
- [ ] Tabelas (com filtros, paginação, ordenação, ações por linha, seleção múltipla, estado vazio)
- [ ] Modais (confirmação, formulário, alerta, grande, pequeno)
- [ ] Cards (estatísticas, informação, ação)
- [ ] Toasts / Notificações (sucesso, erro, aviso, info)
- [ ] Badges e Tags
- [ ] Tabs / Abas
- [ ] Dropdowns
- [ ] Tooltips
- [ ] Alertas inline
- [ ] Skeleton loading
- [ ] Spinners / Loading
- [ ] Avatar
- [ ] Pagination

### Estados e Tema
- [ ] **Dark mode e Light mode como nativos do sistema** — não são opcionais, são obrigatórios desde o primeiro componente:
  - Aplicar estratégia Tailwind `darkMode: 'class'`.
  - Injetar **script de prevenção de FOUC** no `<head>` do arquivo base para ler `localStorage` e aplicar classe `.dark` antes do render.
  - Todos os tokens de cor e componentes criados devem ter variantes `dark:` emparelhadas com o tema claro.
  - Todos os componentes devem ser testados e aprovados nos dois modos.
  - Sincronizar com a preferência do SO via `window.matchMedia`.
  - A troca de tema deve ser instantânea e sem quebras visuais.
- [ ] Documentar alto contraste
- [ ] Documentar responsividade (breakpoints)
- [ ] Documentar estados (loading, vazio, erro, sucesso, disabled)

### Acessibilidade (Configurada de Berço)
- [ ] Garantir conformidade com WCAG 2.2 AA desde o início do Design System (contraste mínimo 4.5:1).
- [ ] Navegação completa e testada por teclado (Tab, Enter, Space, Esc, setas) para TODOS os componentes.
- [ ] Foco visível configurado com Tailwind: `focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary-500` (ajustar cor) em todos os elementos interativos.
- [ ] Atributos ARIA (`aria-label`, `aria-expanded`, `aria-hidden="true"` em ícones decorativos, `aria-current="page"`) configurados nos componentes base.
- [ ] Estrutura HTML Semântica rigorosa (ex: usar `<button>`/`<a>` e não `<div>` clicável, usar `<nav>`, `<aside>`, `<main>`).

### Página de Acompanhamento da Migração (Obrigatória)
- [ ] Criar uma página dedicada no novo sistema para acompanhar o andamento da migração. Deve conter:
  - **Visão geral:** Total de telas, quantas migradas, quantas pendentes, percentual de progresso
  - **Barra de progresso visual** (ou gráfico) do andamento geral
  - **Lista de telas** com status individual (pendente, em andamento, migrada, homologada)
  - **Filtros** por status, módulo e criticidade
  - **Histórico de atividades** (últimas telas migradas, datas, observações)
  - **Dados alimentados automaticamente** pelo backlog de telas (`memoria/backlog-telas.yaml`)
  - Página acessível pelo menu do sistema (não escondida)
  - Deve funcionar em dark e light mode desde o início

### Qualidade
- [ ] Atribuir IDs únicos a todos os elementos
- [ ] Conduzir entrevista de design (30 perguntas)

## Frase obrigatória de encerramento
"Com isso, finalizamos 100% a Fase 04 — Página Visual Base. Aguardando aprovação do layout para prosseguir."

## Próximo passo
**AGUARDAR APROVAÇÃO DO DEV.** Após aprovação, segue para Fase 05 em modo autônomo corrido.
