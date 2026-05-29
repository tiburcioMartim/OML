# Guardião de Acessibilidade

## Missão
Garantir WCAG 2.2 AA como baseline. Navegação por teclado, foco visível, leitores de tela, alto contraste, dark/light mode, ajuste de fonte, redução de movimento.

## Regra de Berço (Design System)
A acessibilidade deve ser **100% configurada de berço** já na criação da Página Visual Base (Fase 04 / Design System) e deve crescer organicamente junto com o projeto. Acessibilidade não é uma refatoração posterior, é um requisito fundacional dos componentes.

## Botão de Acessibilidade (Widget Flutuante)

O sistema **deve** possuir um botão de acessibilidade flutuante, sempre visível e facilmente acessível em todas as páginas. Ao clicar, abre um painel com:

- Toggle de alto contraste
- Ajuste de tamanho de fonte (aumentar / diminuir / resetar)
- Toggle de redução de movimento (`prefers-reduced-motion`)
- Toggle de modo daltônico (se aplicável)

O botão deve:
- Ter posição fixa na tela (perguntar ao dev a posição preferida)
- Ser acessível por teclado (focável, ativável por Enter/Space)
- Persistir as preferências do usuário (localStorage ou banco)
- Funcionar em todas as páginas, não apenas no Design System

## Dark/Light Mode Nativo

Dark mode e light mode são **nativos do sistema** e obrigatórios, vitais para reduzir a fadiga visual. A especificação completa (estratégia Tailwind `darkMode: 'class'`, mapeamento `dark:` emparelhado, sincronização com o SO, persistência, prevenção de FOUC, toggle) é mantida em **fonte única**: ver [guardião de tema dark/light](guardiao-tema-dark-light.md).

Aqui basta a regra de acessibilidade: o **contraste de ambos os temas** deve atender WCAG 2.2 AA (4.5:1) e todos os componentes devem ser testados e visualmente corretos nos dois modos.

## Botão Rolar para Cima (Scroll to Top)

O sistema **deve** possuir um botão flutuante de "rolar para cima" em todas as páginas:
- Aparece após scroll de pelo menos 300px
- Executa scroll suave até o topo
- Acessível por teclado
- Animação de entrada/saída

## Padrões Técnicos Obrigatórios (Linting Humano)

A acessibilidade deixou de ser um adendo e passou a ser um requisito fundamental do Design System, focando na usabilidade universal, essencial em ambientes hospitalares.

1. **HTML Semântico Rigoroso:** 
   - Substituição do uso excessivo de `<div>` por tags semânticas estruturais (`<nav>`, `<aside>`, `<main>`, `<section>`, `<header>`).
   - Agrupamentos lógicos de listas sempre com `<ul>` e `<li>`.
   - Elementos clicáveis devem ser `<button>` ou `<a>`, nunca `<div>` ou `<span>` com evento de clique.

2. **Navegação por Teclado (`focus-visible`):** 
   - Todos os elementos interativos (botões, links, inputs, itens de menu) **devem** possuir anéis de foco customizados.
   - Padrão Tailwind obrigatório: `focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary-500` (ajustar a cor primária conforme o projeto).
   - Isso garante acessibilidade sem poluir o visual para usuários de mouse.

3. **Atributos ARIA (Accessible Rich Internet Applications):**
   - `aria-hidden="true"`: Obrigatório em ícones (SVGs) puramente decorativos para ocultá-los dos leitores de tela.
   - `aria-label`: Obrigatório em botões que possuem apenas ícones (ex: botão de notificações, recolher sidebar) e componentes puramente visuais (como gráficos) para descrever a informação apresentada.
   - `aria-expanded`: Obrigatório para o gerenciamento dinâmico do estado de menus dropdown, modais e seções colapsáveis.
   - `aria-current="page"`: Obrigatório para indicação clara de qual item de navegação representa a página atual.

4. **Contraste e Legibilidade:**
   - Garantir conformidade com a taxa de contraste mínima (4.5:1) da diretriz WCAG AA.
   - Elevação do nível de contraste de textos passivos (exemplo: usar `text-surface-600` em fundos claros ao invés de `text-surface-500`).

## Regra Contínua
Nenhuma tela é considerada pronta ou pode avançar de fase sem revisão rigorosa e aprovação destes padrões de acessibilidade (ARIA, contraste, foco, semântica e teclado).
