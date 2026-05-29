# Protocolo de Diretivas de IA no Styleguide

## Problema

Ao ler/editar o código, o agente tende a (a) recriar estilos e componentes que já existem no Design System usando Tailwind solto, (b) reescrever lógicas/formatações já encapsuladas em Composables, e (c) ignorar botões/componentes legados que vê de passagem. A correção é **embutir a regra no próprio código**, onde o agente sempre a lê.

## Diretiva embarcada (`<ai_directive>`)

O arquivo-índice do Design System (ex.: `resources/js/Pages/Styleguide/Index.vue`) deve abrir com um bloco de diretiva rígido, em comentário, que o OML é **obrigado a ler e obedecer** antes de gerar ou editar qualquer componente:

```vue
<!--
  <ai_directive priority="must">
  Este projeto tem Design System próprio. Ao gerar ou editar UI:
  1. USE os componentes do DS — ex.: <RhcButton> em vez de <button>, <RhcInput> em vez de <input>.
     NUNCA recrie um componente que já existe aqui. NUNCA use Tailwind solto para refazer um padrão existente.
  2. USE os Composables do projeto (ver docs/06-perfis/vue/composables-obrigatorios.md):
     useMasks(), useTheme(), useA11y(), usePermissions(), useTable().
     É PROIBIDO reescrever lógica de formatação, tema, acessibilidade, permissão ou tabela já encapsulada.
  3. NUNCA use cores hardcoded — use os tokens. Todo componente respeita dark/light (classes dark:).
  4. AUTO-LIMPEZA: ao tocar um arquivo que viola estas regras, refatore-o para o padrão novo
     no mesmo passo (ver docs/00-visao-geral/politica-auto-limpeza-refatoracao.md).
  Violar esta diretiva é um defeito, não uma escolha de estilo.
  </ai_directive>
-->
```

(Adaptar nomes — `RhcButton` etc. — ao prefixo real de componentes do projeto, registrado no perfil.)

## Como o OML usa

- **Ao ler** qualquer arquivo do Design System ou um componente de tela, procurar o bloco `<ai_directive>` e tratá-lo como **regra obrigatória**, não comentário informativo.
- **Ao criar** o Design System (Fase 04), o OML **insere** este bloco no `Index.vue` do Styleguide, com os nomes reais de componentes e o caminho dos Composables.
- **Ao gerar UI** (Fase 13), consultar o DS e os Composables antes de escrever; preferir componente/Composable existente a recriar.
- **Violação detectada** → refatorar imediatamente (auto-limpeza) dentro do escopo permitido.

## Relacionados
- `docs/06-perfis/vue/composables-obrigatorios.md` — catálogo de Composables.
- `docs/00-visao-geral/politica-auto-limpeza-refatoracao.md` — quando refatorar sozinho.
- `docs/03-guardioes/guardiao-design.md` / `guardiao-continuo-padronizacao.md` — padronização.
