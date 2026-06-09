# Fase 14 — Revisão de Paridade

## Autonomia: 🟡 Resumo

O OML compara e apresenta uma lista breve de divergências. Não para. Pouco texto.

## Objetivo
Comparar comportamento da tela nova com o legado.

## Ações obrigatórias
- [ ] Comparar campos, ações, regras, cálculos
- [ ] **Paridade de permissões (dura)** contra o ledger `memoria/permissoes/{slug}.md`: default-deny preservado · mesmos sujeitos (sem escalonamento/lockout) · escopos setor/unidade/nível íntegros (multi-tenant sem vazamento) · negação = `flash.error`, não 404. Ver `docs/04-protocolos/protocolo-revisao-paridade.md`. **Divergência de acesso = 🔴** (`decisoes.md`); sem isso verificado, o Gate 2 **aborta**.
- [ ] Registrar divergências
- [ ] Classificar divergências

## Formato do resumo

```
Paridade da tela [NOME]:
- ✅ Campos: 100% compatíveis
- ✅ Permissões: OK
- ⚠️ Filtro de data: formato diferente (DD/MM → YYYY-MM-DD)
- ✅ Cálculos: idênticos
```

## Próximo passo
Fase 15 — Homologação Operacional (🔴 GATE 2 — dev testa e aprova)
