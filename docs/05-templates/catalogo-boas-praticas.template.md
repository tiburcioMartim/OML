# Catálogo de Boas Práticas — [Nome da Feature]

<!--
  Preenchido por feature em modo construção/híbrido, como parte da Definição de Pronto.
  Referência: docs/03-guardioes/guardiao-boas-praticas-proativas.md
  Marque [x] quando atendido, [-] quando não aplicável (justifique), [ ] quando pendente.
-->

- Feature:
- Criticidade (Expresso / Padrão / Estrito):
- Responsável:
- Data:

## Privacidade e dados (LGPD)
- [ ] Dados pessoais/sensíveis (PII) mapeados por entidade
- [ ] Base legal e finalidade definidas
- [ ] Minimização, retenção e anonimização tratadas
- [ ] Consentimento e right-to-erasure previstos (quando aplicável)
- [ ] Logs de acesso a dados sensíveis

## Acessibilidade (WCAG 2.2 AA)
- [ ] Navegação por teclado completa e foco visível
- [ ] Atributos ARIA corretos
- [ ] Contraste mínimo 4.5:1
- [ ] Testado com leitor de tela

## Tema Dark/Light
- [ ] Variantes `dark:` emparelhadas em todos os componentes
- [ ] Correto e testado nos dois modos

## HTML semântico
- [ ] Tags estruturais (`<nav>`/`<main>`/`<section>`...) em vez de `<div>` genérico
- [ ] Elementos interativos como `<button>`/`<a>`

## Nomenclatura semântica
- [ ] Nomes claros orientados ao domínio (DB, API, UI)

## Responsividade
- [ ] Funciona em mobile, tablet e desktop (mobile-first)
- [ ] Ações críticas visíveis no mobile

## Performance
- [ ] Listas paginadas/filtradas, sem N+1
- [ ] Índices e cache onde necessário

## Segurança
- [ ] Validação server-side
- [ ] Autorização (policies/permissões) aplicada
- [ ] Proteções CSRF/XSS/SQLi

## Segredos
- [ ] Nenhum segredo no código ou em log; chaves em `.env`/`.env.example`

## Internacionalização / Localização
- [ ] Datas, moeda, fuso e documentos (CPF/CNPJ/CEP) formatados corretamente

## SEO
- [ ] Título, descrição e semântica (se página pública) — ou `noindex` (se interna)

## Design tokens
- [ ] Cores/espaçamentos vindos de tokens centralizados (sem hardcode)

## Modelagem de dados
- [ ] Schema normalizado, chaves, índices, soft deletes/auditoria, constraints

## Testes
- [ ] Toda regra de negócio crítica coberta por teste

## Observabilidade
- [ ] Operações críticas logadas/auditáveis

## Documentação
- [ ] Dossiê de feature e decisões registrados

## Critérios de aceite (substituem a paridade no greenfield)
<!-- Listar os critérios verificáveis acordados com o dev -->
- [ ]
