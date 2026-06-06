# Guardião de Testes

## Missão
Garantir que **toda regra de negócio crítica** seja protegida por teste automatizado e que o sistema possa evoluir sem medo de regressão. Testes são parte da Definição de Pronto, não um extra opcional.

## Regra-dura
1. **Toda regra crítica** (do legado em migração; da decisão do dev em construção) gera **ao menos um teste** que falharia se ela quebrasse.
2. **Nenhuma feature avança** para homologação sem os testes da sua faixa de criticidade verdes no [CI](../04-protocolos/protocolo-ci-qualidade.md).
3. **Bug corrigido = teste de regressão** que reproduz o bug antes do fix.

## Quando ativo
Sempre. O rigor escala pela [matriz de criticidade](../00-visao-geral/matriz-criticidade.md).

---

## Pirâmide de testes

| Nível | O que cobre | Stack típica |
|---|---|---|
| **Unitário** | Funções puras, regras isoladas, cálculos, máscaras, validações | Pest/PHPUnit · Vitest |
| **Feature/Integração** | Endpoints, fluxo HTTP, banco, policies, eventos, jobs | Pest/PHPUnit (DB de teste) |
| **Componente (front)** | Componentes/composables Vue, estados, props | Vitest + Testing Library |
| **E2E** | Jornadas reais ponta a ponta (login → ação → efeito) | Playwright/Cypress |

Base larga (muitos unitários), topo enxuto (poucos E2E, nos fluxos que mais importam).

## Tipos obrigatórios por domínio
- **Regra de negócio:** cada regra do ledger (`memoria/regras-negocio/{slug}.md`) tem teste rastreável à regra.
- **Autorização/permissões:** cada papel vê/age só no que pode (negativos inclusos).
- **Validação:** entradas inválidas são rejeitadas com mensagem correta.
- **Regressão:** todo bug vira teste.
- **Acessibilidade:** checagem automatizada (axe) nas páginas-chave (ver [acessibilidade](guardiao-acessibilidade.md)).
- **Segurança:** authz, CSRF/XSS/SQLi nos pontos sensíveis (ver [segurança](guardiao-seguranca.md)).
- **Performance:** asserts em consultas críticas (sem N+1) onde aplicável.
- **Dados/migração:** em migração, paridade de cálculo legado×novo; conciliação (Fase 17).
- **Rollback/restore:** o procedimento de rollback e o restore de backup são testáveis/ensaiados (ver [DR](guardiao-recuperacao-desastre.md)).

---

## Cobertura e dados
- **Mínimos de cobertura por criticidade** (acordados no perfil): Estrito > Padrão > Expresso. Cobertura mede regra crítica coberta, não só linhas.
- **Dados de teste:** factories/seeds; PII **anonimizada** (ver [dados de teste](guardiao-dados-teste.md)). Nunca dump de produção cru.
- **Isolamento:** cada teste cria e limpa seu estado (transações/refresh); sem depender de ordem.
- **Determinismo:** sem flakiness — controlar tempo, aleatoriedade e rede (mocks). Teste intermitente é bug.

## TDD
Onde a regra é clara e crítica (cálculo financeiro/clínico, autorização), escrever o teste **antes**. Onde é exploratório, testar logo após estabilizar a interface.

## Anti-padrões
- Regra crítica sem teste; "testarei depois".
- Teste que sempre passa (não asserta o comportamento real).
- Mock de tudo a ponto de não testar nada.
- Cobertura inflada sem testar regra.

## Checklist
- [ ] Cada regra crítica do ledger tem teste rastreável
- [ ] Pirâmide respeitada (unit > feature > e2e)
- [ ] Autorização, validação e regressão cobertas
- [ ] a11y/segurança/performance testadas onde a criticidade exige
- [ ] Cobertura mínima da faixa atingida no CI
- [ ] Dados de teste anonimizados; testes determinísticos e isolados
- [ ] Rollback/restore ensaiáveis

## Impacto em outros guardiões
- **[Protocolo de CI/Qualidade](../04-protocolos/protocolo-ci-qualidade.md):** executa e barra no PR.
- **[Regras de Negócio](guardiao-regras-negocio.md):** o ledger é a origem dos casos de teste.
- **[Dados de Teste](guardiao-dados-teste.md):** anonimização.
- **[Boas Práticas Proativas](guardiao-boas-praticas-proativas.md):** eixo "Testes".
