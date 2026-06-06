# Regra-Mãe do OML

## Objetivo

Estabelecer a regra suprema que rege toda e qualquer ação do OML.

## Quando usar

Sempre. Esta regra deve ser consultada antes de qualquer decisão.

---

## Declaração

A entrega (migração ou construção) só é considerada correta quando:

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

## Leitura por modo (itens 1-5)

Os itens **6-23 valem integralmente nos três modos**. Os itens **1-5 são específicos do legado** — em construção, leem-se assim (ver `docs/00-visao-geral/politica-modos-projeto.md`):

| # | Migração | Construção (greenfield) |
|---|---|---|
| 1 | Preserva regras do legado | Implementa fielmente as regras **decididas pelo dev** (mesmo ledger, origem 🟩) |
| 2 | Protege o banco existente | Modela o banco novo com rigor (`guardiao-modelagem-dados.md`); a régua dos 3 sujeitos de escrita continua valendo (`guardiao-banco-dados.md`) |
| 3 | Respeita permissões existentes | Projeta o modelo de permissões com o dev desde o início |
| 4 | Respeita integrações existentes | Projeta as integrações decididas com o dev |
| 5 | Mantém o legado funcionando até o novo estar pronto | Não se aplica (não há legado); o equivalente é não quebrar features já entregues do próprio projeto novo |

Em **híbrido**, cada tela/feature usa a coluna do seu próprio modo.

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
- [ ] Empatia Técnica (OML investigou e sugeriu opções ao invés de apenas inquirir o dev)

**Se qualquer domínio estiver "não analisado", a tela não pode avançar para implementação.**
