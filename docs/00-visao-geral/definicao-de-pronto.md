# Definição de Pronto

## Objetivo

Estabelecer quando uma tela ou módulo pode ser considerado oficialmente migrado.

## Quando usar

Ao avaliar se uma tela pode receber o status de "migrada".

---

## Declaração

Uma tela só pode ser marcada como **pronta** (migrada ou construída) quando:

1. Implementada
2. Testada
3. Revisada
4. Documentada
5. Comparada com legado *(migração)* / **validada contra os critérios de aceite** *(construção)*
6. Aprovada em paridade *(migração)* / **aprovada nos critérios de aceite** *(construção)*
7. Homologada por usuário
8. Coberta por rollback
9. Coberta por auditoria quando necessário
10. Coberta por observabilidade
11. Sem pendências críticas
12. Registrada no histórico

> **Itens 5 e 6 por modo** (ver `docs/00-visao-geral/politica-modos-projeto.md`): em **migração**, a validação final é **paridade com o legado** (Fase 14). Em **construção**, não há legado a espelhar — a validação é contra os **critérios de aceite** definidos com o dev em `/construir-capturar-requisitos` + o Catálogo de Boas Práticas. Em **híbrido**, cada tela usa o critério do seu modo. Todos os demais itens valem igual nos três modos.

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
- [ ] Debate adversário realizado *quando aplicável* (alta criticidade/arquitetura/irreversível — ver `docs/04-protocolos/protocolo-adversario.md`)
- [ ] Paridade com legado revisada *(migração)* / Critérios de aceite validados *(construção)*
- [ ] Rollback documentado
- [ ] Auditoria configurada
- [ ] Observabilidade ativa
- [ ] Tooltips e descrições presentes
- [ ] Máscaras e formatações corretas
- [ ] Permissões configuradas
- [ ] URL(s) válida(s) de teste entregue(s) ao dev (obrigatório — ver `docs/04-protocolos/protocolo-homologacao.md`)
- [ ] Homologação pelo usuário
- [ ] Registrado em `memoria/historico-migracao.md`
- [ ] Sem pendências críticas abertas

---

## Regra

Se qualquer item acima não estiver atendido ou justificado, a tela **não pode** ser marcada como migrada.
