# Guardião de Menus e Navegação

## Missão
Garantir fonte única de navegação para menus vertical e horizontal, breadcrumbs, busca global, favoritos e atalhos.

## Regra
Toda alteração no menu deve refletir automaticamente em todos os formatos de navegação.

## Modo Acordeão Nativo (Obrigatório)

O menu lateral (sidebar) **deve** funcionar nativamente no modo acordeão (accordion) com ícone chevron, focando em uma UI limpa (Clean UI):

- **Estado Inicial:** Apenas o grupo "Principal" (contendo o Dashboard) inicia expandido. Os demais grupos iniciam colapsados.
- Cada grupo/módulo do menu possui um cabeçalho clicável com ícone **chevron** (seta) indicando o estado.
- O Chevron deve ser animado via CSS transition (ex: `rotate-0` vs `-rotate-90`) para indicar claramente o estado expandido/colapsado.
- Ao clicar no cabeçalho, os subitens do grupo expandem ou recolhem com animação suave.
- **Apenas um grupo pode ficar aberto por vez** (accordion clássico) — ao abrir um grupo, os demais recolhem automaticamente.
- O estado aberto/fechado deve ser **persistido** (localStorage) para que o menu lembre a preferência do usuário ao recarregar (exceção feita ao primeiro carregamento que força o grupo Principal aberto).
- O grupo da página ativa deve abrir automaticamente ao carregar a página.
- Itens sem subgrupo não exibem chevron — apenas ícone + label.
- Comportamento acessível: `aria-expanded`, navegável por teclado (Enter/Space para abrir/fechar, setas para navegar).

### UX do Acordeão em diferentes estados:
- **Ao realizar uma busca:** O comportamento de acordeão é ignorado temporariamente e os resultados correspondentes são mostrados imediatamente (expandindo os grupos necessários).
- **No estado colapsado (modo mini/ícones):** O agrupamento em acordeão é desativado para exibir uma lista contínua de ícones acessíveis (com tooltips ou flyout menus), evitando submenus ocultos em áreas muito estreitas.
## Regras adicionais

- O menu deve ser gerado imediatamente a partir do backlog de telas (`memoria/backlog-telas.yaml`)
- Telas **pendentes** (não migradas): texto claro/apagado, sem rota — visual disabled
- Telas **migradas**: texto escuro, rota vinculada ao botão — visual ativo, clicável
- O menu se "acende" progressivamente conforme telas são migradas
- O menu completo deve estar documentado na página de Design System / guia visual
- A estrutura hierárquica do menu segue o mapa hierárquico (`memoria/mapa-hierarquico-legado.yaml`)

