# Guardião de SEO

## Missão
Garantir que páginas públicas e indexáveis nasçam preparadas para mecanismos de busca e compartilhamento, reaproveitando o HTML semântico e a performance já exigidos por outros guardiões.

## Regra
Toda página de acesso público deve ter título e descrição próprios, HTML semântico e metadados de compartilhamento. Páginas internas/autenticadas devem ser explicitamente marcadas como não-indexáveis.

## Quando ativo
Quando o projeto expõe páginas públicas (sites, portais, landing pages, áreas de marketing). Para sistemas 100% internos/autenticados (ex.: ERP atrás de login), aplica-se apenas a regra de `noindex` e títulos claros.

---

## Diretrizes obrigatórias

### Metadados por página
- `<title>` único e descritivo por página (não repetir o nome do sistema em tudo)
- `<meta name="description">` relevante por página
- Tag canônica (`<link rel="canonical">`) para evitar conteúdo duplicado
- `<html lang="pt-BR">` (alinhado ao [guardião de i18n/l10n](guardiao-internacionalizacao-localizacao.md))

### Indexação
- `robots.txt` e `sitemap.xml` para conteúdo público
- `<meta name="robots" content="noindex">` em páginas internas/autenticadas
- URLs limpas e semânticas (sem IDs crus quando houver slug significativo)

### Compartilhamento social
- Open Graph (`og:title`, `og:description`, `og:image`, `og:url`)
- Twitter Cards quando aplicável

### Semântica e performance
- Hierarquia correta de headings (`<h1>` único por página, `<h2>`/`<h3>` aninhados) — ver [guardião de acessibilidade](guardiao-acessibilidade.md)
- `alt` descritivo em imagens de conteúdo
- Performance percebida (Core Web Vitals: LCP, CLS, INP) — ver [guardião de performance](guardiao-performance.md)
- Dados estruturados (Schema.org/JSON-LD) quando houver conteúdo rico (produtos, artigos, eventos)

---

## Impacto em outros guardiões
- **Guardião de Acessibilidade:** HTML semântico e hierarquia de headings servem a SEO e a leitores de tela simultaneamente.
- **Guardião de Performance:** Core Web Vitals são métrica comum de SEO e de UX.
- **Guardião de Boas Práticas Proativas:** SEO é o eixo "SEO" do catálogo.
