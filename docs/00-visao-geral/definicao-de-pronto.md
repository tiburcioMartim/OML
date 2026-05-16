# Definição de Pronto

## Objetivo

Estabelecer quando uma tela ou módulo pode ser considerado oficialmente migrado.

## Quando usar

Ao avaliar se uma tela pode receber o status de "migrada".

---

## Declaração

Uma tela só pode ser marcada como migrada quando:

1. Implementada
2. Testada
3. Revisada
4. Documentada
5. Comparada com legado
6. Aprovada em paridade
7. Homologada por usuário
8. Coberta por rollback
9. Coberta por auditoria quando necessário
10. Coberta por observabilidade
11. Sem pendências críticas
12. Registrada no histórico de migração

---

## Checklist de "Pronto"

- [ ] Código implementado
- [ ] Testes passando
- [ ] Linter passando
- [ ] Design system respeitado
- [ ] Acessibilidade revisada
- [ ] Responsividade testada (mobile, tablet, desktop)
- [ ] LGPD revisada
- [ ] Segurança revisada
- [ ] Paridade com legado revisada
- [ ] Rollback documentado
- [ ] Auditoria configurada
- [ ] Observabilidade ativa
- [ ] Tooltips e descrições presentes
- [ ] Máscaras e formatações corretas
- [ ] Permissões configuradas
- [ ] Homologação pelo usuário
- [ ] Registrado em `memoria/historico-migracao.md`
- [ ] Sem pendências críticas abertas

---

## Regra

Se qualquer item acima não estiver atendido ou justificado, a tela **não pode** ser marcada como migrada.
