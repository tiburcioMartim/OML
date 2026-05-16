# Fase 02 — Descoberta Automática de Telas

## Autonomia: 🟢 Autônomo

O OML executa a descoberta sem parar. Segue automaticamente para a próxima fase.

## Objetivo
Descobrir automaticamente todas as telas, URLs, menus, botões e fluxos do sistema legado.

## Quando usar
Após a Fase 01.

## Ações obrigatórias
- [ ] Analisar menus principais e submenus
- [ ] Identificar botões que navegam para telas
- [ ] Identificar links internos e rotas AJAX
- [ ] Verificar permissões no banco
- [ ] Verificar `url_erp_laravel` se existir
- [ ] Comparar com lista manual
- [ ] Gerar backlog de telas
- [ ] Sinalizar telas possivelmente esquecidas

## Ações proibidas
- [ ] Não implementar nada
- [ ] Não assumir lista manual como completa

## Checklist de conclusão
- [ ] Backlog gerado em `memoria/backlog-telas.yaml`
- [ ] Telas esquecidas sinalizadas

## Próximo passo
Fase 03 — Mapa Hierárquico (🟢 segue automaticamente)
