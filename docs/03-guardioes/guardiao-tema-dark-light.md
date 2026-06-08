# Guardião de Tema Dark/Light

## Missão
Ser a **fonte única de verdade** do tema claro/escuro do sistema. Dark mode e light mode são **nativos e obrigatórios** desde o primeiro componente — nunca opcionais, nunca uma refatoração posterior.

## Regra (endurecida — 2026-06-08)
Todo artefato visual — **página, layout, componente compartilhado e qualquer mapa de classes em `<script>`** — nasce com as variantes `dark:` emparelhadas com o tema claro. **Nenhum componente avança de fase, vira PR ou é homologado (Gate 2) sem ter sido verificado e aprovado nos DOIS modos.** Pareamento de tema **não é cosmético nem opcional**: é item **bloqueante** da Definição de Pronto.

## Quando ativo
Sempre, em qualquer modo de projeto. Em construção, é item obrigatório do [Catálogo de Boas Práticas](guardiao-boas-praticas-proativas.md) e da [Definição de Pronto](../00-visao-geral/definicao-de-pronto.md).

---

## Diretrizes obrigatórias

- **Estratégia Tailwind:** utilizar `darkMode: 'class'`. O controle do tema é feito adicionando/removendo a classe `.dark` no elemento raiz (`<html>`).
- **Mapeamento exaustivo:** todo novo componente **deve** possuir as classes `dark:` mapeadas e emparelhadas com as cores do tema claro (ex.: `bg-white dark:bg-surface-900`, `text-surface-900 dark:text-white`).
- **Sincronização com o SO:** detectar a preferência do usuário via `window.matchMedia('(prefers-color-scheme: dark)')` como padrão inicial.
- **Persistência:** persistir a escolha do usuário em `localStorage` (ou banco), de modo que o tema sobreviva a recarregamentos e sessões.
- **Prevenção de FOUC (Flash of Unstyled Content):** injetar um script inline mínimo no `<head>` do arquivo base (ex.: `app.blade.php`) que lê o `localStorage` e aplica a classe `.dark` **antes** da renderização, evitando o "piscar branco" inicial.
- **Transição suave:** a troca de tema deve ser instantânea, sem flashes nem quebras visuais.
- **Contraste preservado:** os dois temas devem atender ao contraste mínimo WCAG 2.2 AA (4.5:1) — ver [guardião de acessibilidade](guardiao-acessibilidade.md).
- **Tokens, não cores cruas:** as variantes `dark:` derivam dos tokens centralizados (`surface`/`primary`/`slate`…), nunca de cor hardcoded — ver [guardião de design](guardiao-design.md).

---

## ⛔ Padrões PROIBIDOS (reprovam a revisão automaticamente)

Toda classe de cor de **superfície, texto, borda, ring, divide, placeholder, sombra e ícone** precisa do par `dark:`. É **proibição**, não preferência:

| Proibido (light-only) | Correto (pareado) |
|---|---|
| `bg-white` | `bg-white dark:bg-surface-900` |
| `bg-gray-50` / `bg-slate-50` | `bg-slate-50 dark:bg-surface-800/50` |
| `text-gray-900` / `text-slate-800` | `text-slate-800 dark:text-white` |
| `text-gray-400` (label/muted) | `text-slate-500 dark:text-slate-400` |
| `border-slate-200` / `border-*-100` | `border-slate-200 dark:border-surface-700` |
| `divide-slate-100` | `divide-slate-100 dark:divide-surface-800` |
| `text-[#001036]` e **qualquer** `*-[#hex]` | token do tema **+** `dark:` (ex.: `text-[#001036] dark:text-white`) |
| placeholder claro sem par | `placeholder-slate-400 dark:placeholder-surface-500` |

### 🪤 A armadilha-padrão: cor escondida em `<script>` e componente compartilhado

Incidente fundador (projeto ERP hospitalar, tela `/acolher/qualidade`, 2026-06-08): um componente **compartilhado** de KPI tinha fundo `bg-white` (sem `dark:`) e um **mapa de variantes em `<script>`** (`variantMap = { blue: { valueColor: 'text-[#001036]', iconBg: 'bg-blue-50' … } }`) **inteiramente light-only**. Resultado: cartões brancos no tema escuro de **todas** as telas que usavam o componente.

> **Lição cravada na regra:** cores escondidas em **objetos JS** (`variantMap`, `statusColors`, `cardConfigMap`, computeds `*Class`…) **escapam da revisão visual do `<template>`**. O guardião as trata como superfície de primeira classe: **cada entrada de mapa de classe em `<script>` também deve ter `dark:`.**

> **Regra do componente compartilhado:** um único componente compartilhado light-only quebra o tema escuro de **N telas de uma vez**. Componentes reutilizáveis recebem escrutínio **redobrado** e verificação no `/styleguide` antes de qualquer uso.

---

## ✅ Definição de Pronto de tema (checklist BLOQUEANTE)

Nenhuma tela/componente é "pronto" enquanto **todos** os itens não estiverem satisfeitos:

- [ ] Toda superfície (`bg-*`) tem par `dark:`.
- [ ] Todo texto (`text-*`) tem par `dark:`, com contraste WCAG 2.2 AA (≥4.5:1) **nos dois fundos**.
- [ ] Bordas, divisores e rings (`border-*` / `divide-*` / `ring-*`) pareados.
- [ ] Ícones e **estados** (`hover:` / `focus:` / `active:` / `disabled:`) pareados.
- [ ] **Mapas de classe em `<script>`** (`variantMap`, `statusColors`, computeds `*Class`…) com `dark:` em **cada** entrada.
- [ ] **Zero cor hardcoded** (`-[#hex]`) sem par `dark:` e sem justificativa comentada.
- [ ] **Renderizado e conferido nos DOIS modos** (claro + escuro) — evidência anexada (ver verificação).
- [ ] **Componente compartilhado:** conferido no `/styleguide` (ou design system) em ambos os modos, ciente de quantas telas o consomem.

## 🔍 Verificação obrigatória (não confiar só no olho)

1. **Grep mecânico** antes de marcar pronto (na raiz do projeto novo):
   ```bash
   # A) superfícies brancas sem par dark (deve sair VAZIO, salvo exceção comentada)
   grep -rnE "bg-white" resources/js | grep -vE "dark:bg-|tema:.*intencional"
   # B) cores hardcoded em hex (deve sair VAZIO, salvo exceção comentada)
   grep -rnE "(text|bg|border|ring)-\[#" resources/js | grep -vE "tema:.*intencional"
   ```
   Saída esperada: **vazia**. Qualquer linha é pendência antes de "pronto".
2. **Render nos dois temas:** abrir a tela com `.dark` ligado **e** desligado e conferir visualmente. Para componente compartilhado, usar a rota dev `/styleguide`. Os plugins `verify` / `run` / **Playwright** servem para capturar o screenshot dos dois modos (Gate 2).

## Exceções legítimas (permitidas, mas EXPLÍCITAS)

Superfícies que **devem** permanecer claras por requisito funcional — sempre acompanhadas do comentário `tema: branco intencional (motivo)` na linha:

- **QR Code / código de barras** (exigem fundo branco para leitura).
- **Área de impressão / exportação PDF**, **pad de assinatura**, **overlay translúcido sobre imagem** (`bg-white/50` sobre foto).

Fora desses casos, branco sem `dark:` é **bug**, não estilo.

---

## Toggle obrigatório

O sistema **deve** oferecer alternância de tema (Claro / Escuro / Sistema), com 1 clique, em todas as páginas:

- Visível no Topbar/Header e/ou no painel de acessibilidade (perguntar ao dev a posição preferida).
- Acessível por teclado (focável, ativável por Enter/Space).
- Gerenciado globalmente, não por página.

---

## Por que é "de berço"

Reduz a fadiga visual e respeita a preferência do usuário e do sistema operacional. Implementar dark/light depois que o sistema cresceu obriga a reescrever cada componente — por isso é fundacional desde o Design System (Fase 04 / Gate 1).

## Camada 3 — Gate mecânico de CI (rede de segurança)

Além do contexto (este guardião) e da revisão, o [protocolo de CI/qualidade](../04-protocolos/protocolo-ci-qualidade.md) **deve** barrar no PR qualquer ocorrência de `bg-white` ou `*-[#hex]` **sem par `dark:`** e sem o marcador `tema: … intencional` — usando exatamente os greps acima. Rigor de verdade **não depende** de o agente "lembrar": falha o build.

## Impacto em outros guardiões
- **[Definição de Pronto](../00-visao-geral/definicao-de-pronto.md):** o checklist de tema acima é critério bloqueante de "pronto".
- **[Guardião de Acessibilidade](guardiao-acessibilidade.md):** o contraste de ambos os temas é validado pelos critérios WCAG.
- **[Guardião de Design / Customização Visual](guardiao-design.md):** as variantes `dark:` derivam dos tokens centralizados, não de cores hardcoded.
- **[Guardião de Reúso de Componentes](guardiao-reuso-componentes.md):** componente compartilhado light-only é débito sistêmico — quebra N telas.
- **[Guardião de Boas Práticas Proativas](guardiao-boas-praticas-proativas.md):** este guardião é o item "Tema Dark/Light" do catálogo.
- **[Protocolo de CI/Qualidade](../04-protocolos/protocolo-ci-qualidade.md):** Camada 3 (gate mecânico).
