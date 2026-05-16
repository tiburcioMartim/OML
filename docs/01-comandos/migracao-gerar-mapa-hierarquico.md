# /migracao-gerar-mapa-hierarquico

## Objetivo

Organizar as telas descobertas em um mapa hierárquico por temas, menus, submenus e módulos.

## Quando usar

Após a descoberta de telas, para visualizar a estrutura completa do sistema legado.

## Entradas esperadas

`memoria/backlog-telas.yaml` preenchido.

## Ações obrigatórias

- [ ] Ler backlog de telas
- [ ] Agrupar por módulo/tema
- [ ] Organizar hierarquia (menu > submenu > tela)
- [ ] Identificar telas sem menu (órfãs)
- [ ] Gerar mapa hierárquico visual
- [ ] Salvar em `memoria/mapa-hierarquico-legado.yaml`

## Ações proibidas

- [ ] Não implementar nada
- [ ] Não inventar hierarquias que não existem

## Arquivos que atualiza

- `memoria/mapa-hierarquico-legado.yaml`

## Checklist de conclusão

- [ ] Mapa hierárquico gerado
- [ ] Telas órfãs sinalizadas
- [ ] Hierarquia revisada

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a Fase 03 — Mapa Hierárquico."

## Próximo passo

`/migracao-analisar-tela [ID]` ou Fase 04 (Página Visual Base)
