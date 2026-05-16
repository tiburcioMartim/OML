# /migracao-descobrir-telas

## Objetivo

Encontrar automaticamente todas as telas, URLs, menus, botões e fluxos do sistema legado.

## Quando usar

Na Fase 02, quando quiser que o OML monte o mapa de telas sem depender apenas de lista manual.

## Entradas esperadas

Acesso ao código do sistema legado (arquivos, banco, menus).

## Ações obrigatórias

- [ ] Ler menus principais do legado
- [ ] Ler submenus
- [ ] Identificar botões que navegam para outras telas
- [ ] Identificar links internos
- [ ] Identificar rotas AJAX e endpoints
- [ ] Identificar includes de menu
- [ ] Verificar permissões no banco
- [ ] Verificar coluna `url_erp_laravel`, se existir
- [ ] Verificar logs de acesso, se existirem
- [ ] Identificar páginas de relatório, impressão e exportação
- [ ] Identificar páginas administrativas escondidas
- [ ] Comparar URLs encontradas com lista manual (se houver)
- [ ] Gerar lista de possíveis telas esquecidas
- [ ] Salvar resultado em `memoria/backlog-telas.yaml`

## Ações proibidas

- [ ] Não implementar nada
- [ ] Não alterar banco
- [ ] Não alterar permissões
- [ ] Não assumir que a lista manual está completa

## Arquivos que atualiza

- `memoria/backlog-telas.yaml`
- `memoria/mapa-hierarquico-legado.yaml`

## Checklist de conclusão

- [ ] Menus analisados
- [ ] Botões e links internos rastreados
- [ ] Permissões no banco verificadas
- [ ] Backlog de telas gerado
- [ ] Telas esquecidas sinalizadas
- [ ] URLs duplicadas tratadas

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a Fase 02 — Descoberta Automática de Telas."

## Próximo passo

`/migracao-gerar-mapa-hierarquico`
