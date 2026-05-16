# Guardião de Menus e Navegação

## Missão
Garantir fonte única de navegação para menus vertical e horizontal, breadcrumbs, busca global, favoritos e atalhos.

## Regra
Toda alteração no menu deve refletir automaticamente em todos os formatos de navegação.

## Regras adicionais

- O menu deve ser gerado imediatamente a partir do backlog de telas (`memoria/backlog-telas.yaml`)
- Telas **pendentes** (não migradas): texto claro/apagado, sem rota — visual disabled
- Telas **migradas**: texto escuro, rota vinculada ao botão — visual ativo, clicável
- O menu se "acende" progressivamente conforme telas são migradas
- O menu completo deve estar documentado na página de Design System / guia visual
- A estrutura hierárquica do menu segue o mapa hierárquico (`memoria/mapa-hierarquico-legado.yaml`)
