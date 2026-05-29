# Guardião de Tema Dark/Light

## Missão
Ser a **fonte única de verdade** do tema claro/escuro do sistema. Dark mode e light mode são **nativos e obrigatórios** desde o primeiro componente — nunca opcionais, nunca uma refatoração posterior.

## Regra
Todo componente nasce com as variantes `dark:` emparelhadas com o tema claro. Nenhum componente avança de fase sem estar correto e testado nos dois modos.

## Quando ativo
Sempre, em qualquer modo de projeto. Em construção, é item obrigatório do [Catálogo de Boas Práticas](guardiao-boas-praticas-proativas.md) e da Definição de Pronto.

---

## Diretrizes obrigatórias

- **Estratégia Tailwind:** utilizar `darkMode: 'class'`. O controle do tema é feito adicionando/removendo a classe `.dark` no elemento raiz (`<html>`).
- **Mapeamento exaustivo:** todo novo componente **deve** possuir as classes `dark:` mapeadas e emparelhadas com as cores do tema claro (ex.: `bg-white dark:bg-surface-900`, `text-surface-900 dark:text-white`).
- **Sincronização com o SO:** detectar a preferência do usuário via `window.matchMedia('(prefers-color-scheme: dark)')` como padrão inicial.
- **Persistência:** persistir a escolha do usuário em `localStorage` (ou banco), de modo que o tema sobreviva a recarregamentos e sessões.
- **Prevenção de FOUC (Flash of Unstyled Content):** injetar um script inline mínimo no `<head>` do arquivo base (ex.: `app.blade.php`) que lê o `localStorage` e aplica a classe `.dark` **antes** da renderização, evitando o "piscar branco" inicial.
- **Transição suave:** a troca de tema deve ser instantânea, sem flashes nem quebras visuais.
- **Contraste preservado:** os dois temas devem atender ao contraste mínimo WCAG 2.2 AA (4.5:1) — ver [guardião de acessibilidade](guardiao-acessibilidade.md).

---

## Toggle obrigatório

O sistema **deve** oferecer alternância de tema (Claro / Escuro / Sistema), com 1 clique, em todas as páginas:

- Visível no Topbar/Header e/ou no painel de acessibilidade (perguntar ao dev a posição preferida).
- Acessível por teclado (focável, ativável por Enter/Space).
- Gerenciado globalmente, não por página.

---

## Por que é "de berço"

Reduz a fadiga visual e respeita a preferência do usuário e do sistema operacional. Implementar dark/light depois que o sistema cresceu obriga a reescrever cada componente — por isso é fundacional desde o Design System (Fase 04 / Gate 1).

## Impacto em outros guardiões
- **Guardião de Acessibilidade:** o contraste de ambos os temas é validado pelos critérios WCAG.
- **Guardião de Design / Customização Visual:** as variantes `dark:` derivam dos tokens centralizados, não de cores hardcoded.
- **Guardião de Boas Práticas Proativas:** este guardião é o item "Tema Dark/Light" do catálogo.