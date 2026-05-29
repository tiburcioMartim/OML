# Política de Auto-Limpeza (Refatoração Proativa)

## Objetivo

Impedir que o OML ignore botões, componentes ou lógicas legadas que vê durante o escaneamento ou a edição de arquivos. Ao tocar um arquivo que viola o Design System ou os Composables, o OML refatora **no mesmo passo** — sem deixar dívida para trás.

## Quando usar

Sempre que o OML ler ou editar um arquivo de UI/lógica do **sistema novo**. Reforçada pela `<ai_directive>` do Styleguide.

---

## Auto-limpeza PERMITIDA (refatorar na hora, sem perguntar)

Durante a implementação da própria tela (Fase 13) ou ao tocar um arquivo do sistema novo, se detectar violação de padrão, **refatorar imediatamente** para o padrão novo:

- `<button>`/`<input>` solto → componente do Design System (`<RhcButton>` etc.)
- Cor hardcoded → token; faltando variante `dark:` → adicionar
- Formatação/máscara na mão → `useMasks()`; tema na mão → `useTheme()`; ARIA/teclado ad-hoc → `useA11y()`
- Lógica duplicada que pertence a um Composable → mover para o Composable
- Componente novo não documentado → documentar na Página Visual

Isto é parte de "tornar pronto" — não exige autorização.

## Auto-limpeza CONDICIONAL (Fase 19 — Guardião Contínuo)

Após a homologação, o guardião pode corrigir violações **pequenas e sem impacto em lógica** (cor hardcoded, falta de `dark:`, nome genérico de função). Refatoração maior (que mexe em comportamento) → relatório de dívida técnica + pendência, não correção silenciosa.

## Auto-limpeza PROIBIDA

- **Código legado** (sistema antigo): nunca refatorar — é fonte de verdade da migração. Apenas observar e, se relevante, marcar `[A INVESTIGAR]`.
- Código de **terceiros / vendor**.
- Qualquer mudança que **altere comportamento de negócio** — isso é decisão do dev e passa pelo ledger de regras + `memoria/decisoes.md`, não por auto-limpeza.

---

## Regra

Refatoração proativa vale só para **forma** (padrão visual/estrutural) do sistema **novo**. **Comportamento** (regra de negócio) nunca muda por auto-limpeza — muda por decisão registrada. Na dúvida entre forma e comportamento, tratar como comportamento e não mexer.
