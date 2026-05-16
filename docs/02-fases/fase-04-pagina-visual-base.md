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
- [ ] Sidebar / Menu lateral (com colapso, ícones, submenus, indicador de ativo)
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

### Estados
- [ ] Documentar dark mode, light mode, alto contraste
- [ ] Documentar responsividade (breakpoints)
- [ ] Documentar estados (loading, vazio, erro, sucesso, disabled)

### Qualidade
- [ ] Atribuir IDs únicos a todos os elementos
- [ ] Conduzir entrevista de design (30 perguntas)

## Frase obrigatória de encerramento
"Com isso, finalizamos 100% a Fase 04 — Página Visual Base. Aguardando aprovação do layout para prosseguir."

## Próximo passo
**AGUARDAR APROVAÇÃO DO DEV.** Após aprovação, segue para Fase 05 em modo autônomo corrido.
