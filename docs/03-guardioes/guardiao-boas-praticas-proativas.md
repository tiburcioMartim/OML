# Guardião de Boas Práticas Proativas

## Missão
Reunir, em um único catálogo acionável, as boas práticas que o OML deve **aplicar proativamente** ao construir um projeto — em vez de apenas preservá-las do legado. É o guardião-orquestrador do **modo construção** (greenfield/híbrido): aponta para os guardiões temáticos e materializa um checklist por feature.

## Regra
Em modo construção ou híbrido, **nenhuma feature é considerada pronta** sem passar pelo checklist deste catálogo. As boas práticas são requisitos fundacionais ("de berço"), não refatorações posteriores.

## Quando ativo
Quando o perfil do projeto indicar `modo: construcao` ou `modo: hibrido` (ver [política de modos de projeto](../00-visao-geral/politica-modos-projeto.md)). Em `modo: migracao` os mesmos guardiões continuam ativos, porém lidos como "comportamentos a preservar do legado".

---

## Catálogo de Boas Práticas

Cada eixo abaixo é fiscalizado por um guardião próprio. Este catálogo é o **índice proativo** que garante que todos sejam aplicados desde o início.

| Eixo | Guardião / Referência | O que aplicar de berço |
|---|---|---|
| **Privacidade e dados pessoais (LGPD)** | [guardiao-lgpd-privacidade.md](guardiao-lgpd-privacidade.md) | Privacy by design e by default: mapear PII por entidade, base legal, finalidade, minimização, retenção, consentimento, anonimização, right-to-erasure, logs de acesso |
| **Acessibilidade (WCAG 2.2 AA)** | [guardiao-acessibilidade.md](guardiao-acessibilidade.md) | Navegação por teclado, foco visível, ARIA, contraste 4.5:1, leitores de tela, ajuste de fonte, redução de movimento, widget de acessibilidade |
| **Tema Dark/Light** | [guardiao-tema-dark-light.md](guardiao-tema-dark-light.md) | Dark e light nativos desde o primeiro componente, sincronização com o SO, persistência, prevenção de FOUC, toggle obrigatório |
| **HTML semântico** | [guardiao-acessibilidade.md](guardiao-acessibilidade.md) (seção HTML Semântico) | `<nav>`/`<aside>`/`<main>`/`<header>`/`<section>`; `<button>`/`<a>` em vez de `<div>` clicável; listas com `<ul>`/`<li>` |
| **Nomenclatura semântica** | [guardiao-nomenclatura-semantica.md](guardiao-nomenclatura-semantica.md) | Nomes claros orientados ao domínio, sem abreviações, consistentes por camada (DB, API, UI) |
| **Responsividade** | [guardiao-responsividade.md](guardiao-responsividade.md) | Mobile-first; funciona em mobile, tablet e desktop; não esconder ações críticas no mobile |
| **Performance** | [guardiao-performance.md](guardiao-performance.md) | Paginação/filtros em listas, prevenção de N+1, índices, cache, filas, performance budget |
| **Segurança** | [guardiao-seguranca.md](guardiao-seguranca.md) | Validação server-side, authn/authz, CSRF/XSS/SQLi, rate limiting, headers, upload seguro, cripto |
| **Segredos e credenciais** | [guardiao-segredos-credenciais.md](guardiao-segredos-credenciais.md) | `.env` + `.env.example` com chaves vazias, nunca segredo no código nem em log, separação por ambiente |
| **Internacionalização / Localização** | [guardiao-internacionalizacao-localizacao.md](guardiao-internacionalizacao-localizacao.md) | PT-BR, datas/moeda/fuso, CPF/CNPJ/telefone/CEP, pluralização |
| **SEO** | [guardiao-seo.md](guardiao-seo.md) | Títulos e meta tags, HTML semântico para indexação, Open Graph, sitemap, performance percebida |
| **Design tokens / customização** | [guardiao-customizacao-visual.md](guardiao-customizacao-visual.md) | Cores, fontes, espaçamentos e preferências centralizados em tokens configuráveis |
| **Modelagem de dados** | [guardiao-modelagem-dados.md](guardiao-modelagem-dados.md) | Normalização, chaves, índices, soft deletes, auditoria, constraints na escrita |
| **Testes** | [guardiao-testes.md](guardiao-testes.md) | TDD onde fizer sentido; toda regra de negócio crítica gera ao menos um teste |
| **Observabilidade** | [guardiao-observabilidade.md](guardiao-observabilidade.md) | Logs estruturados, health checks, métricas, alertas, rastreabilidade |
| **Manutenibilidade** | [guardiao-manutenibilidade.md](guardiao-manutenibilidade.md) | Baixo acoplamento, alta coesão, SRP, sem overengineering |
| **Documentação** | [guardiao-documentacao.md](guardiao-documentacao.md) | Dossiê de feature, decisões, riscos, doc técnica e de usuário |

---

## Como o catálogo entra no fluxo

1. **Configuração (Fase 00):** a entrevista de design e as políticas do projeto já definem o baseline (a11y AA, LGPD, idioma, ambientes). Em construção, este catálogo é anexado ao perfil.
2. **Design System (Fase 04 — Gate 1):** acessibilidade, dark/light, semântica, tokens e responsividade são materializados "de berço". O Gate 1 não passa sem eles.
3. **Por feature:** ao planejar e implementar cada feature, o OML preenche o [template do catálogo](../05-templates/catalogo-boas-praticas.template.md) como parte da Definição de Pronto.
4. **Contínuo (Fase 19):** o guardião contínuo de padronização fiscaliza violações no repositório novo (cores hardcoded, componentes não documentados, nomes genéricos, faltas de a11y).

---

## Regra de proporcionalidade

O rigor segue a [matriz de criticidade](../00-visao-geral/matriz-criticidade.md): uma feature **Estrita** (dados sensíveis, cálculo financeiro/clínico) exige o catálogo completo e auditado; uma feature **Expressa** aplica o baseline sem cerimônia. Na dúvida, classifique como criticidade mais alta.

## Impacto em outros guardiões
- **[Guardião de Tema Dark/Light](guardiao-tema-dark-light.md):** este catálogo **delega** a especificação completa de dark/light ao guardião dedicado (fonte única de verdade); aqui ele aparece apenas como item do índice.
- **[Guardião de Regras de Negócio](guardiao-regras-negocio.md):** regras inéditas (greenfield/híbrido) entram com `origem: decisão do dev`, alimentando a fonte de verdade.
- **[Guardião Contínuo de Padronização](guardiao-continuo-padronizacao.md):** usa este catálogo como referência das boas práticas a fiscalizar pós-entrega.

## Regra Contínua
As boas práticas crescem organicamente com o projeto. Toda nova decisão de padrão é documentada antes de virar regra — nunca aplicada de forma isolada e tácita.