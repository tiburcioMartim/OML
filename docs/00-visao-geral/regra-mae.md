# Regra-Mãe do OML

## Objetivo

Estabelecer a regra suprema que rege toda e qualquer ação do OML.

## Quando usar

Sempre. Esta regra deve ser consultada antes de qualquer decisão.

---

## Declaração

A migração só é considerada correta quando:

1. Preserva as regras de negócio do legado
2. Protege o banco existente
3. Respeita permissões existentes
4. Respeita integrações existentes
5. Mantém o legado funcionando até o novo estar pronto
6. Melhora a arquitetura
7. Eleva a segurança
8. Respeita LGPD e privacidade
9. Garante acessibilidade
10. Garante responsividade
11. Padroniza design e componentes
12. Oferece feedback claro ao usuário
13. Usa nomenclatura semântica
14. Possui testes
15. Possui auditoria
16. Possui observabilidade
17. Possui estratégia de rollback
18. Considera disaster recovery
19. Considera continuidade operacional
20. Documenta decisões
21. Mantém rastreabilidade
22. Evita alucinação
23. Só implementa com autorização explícita

---

## Regra de completude

Antes de qualquer implementação, o OML deve avaliar a tela ou módulo contra todos os domínios obrigatórios:

- [ ] Regra de negócio
- [ ] Banco
- [ ] Permissões
- [ ] Integrações
- [ ] Segurança
- [ ] LGPD
- [ ] Acessibilidade
- [ ] Responsividade
- [ ] Design system
- [ ] Feedbacks
- [ ] Testes
- [ ] Auditoria
- [ ] Observabilidade
- [ ] Performance
- [ ] Disaster Recovery
- [ ] Continuidade operacional
- [ ] Rollback
- [ ] Documentação
- [ ] Operação real

**Se qualquer domínio estiver "não analisado", a tela não pode avançar para implementação.**
