# Guardião de SEO, GEO e AIO

## Missão
Garantir que páginas públicas e indexáveis nasçam preparadas para os **três consumidores de conteúdo**: buscadores tradicionais (**SEO**), motores generativos/assistentes de IA (**GEO**) e a experiência de IA dentro do próprio produto (**AIO**) — reaproveitando o HTML semântico e a performance já exigidos por outros guardiões.

> **SEO** = ser **encontrado** por buscadores. **GEO** (Generative Engine Optimization) = ser **lido, entendido e citado** por LLMs (ChatGPT, Gemini, Perplexity, etc.). **AIO** (AI Optimization) = o conteúdo/dados do produto serem **consumíveis por IA** (estrutura, APIs, dados limpos). A base técnica é compartilhada; cada um adiciona exigências.

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

## GEO — Generative Engine Optimization (ser citado por IA)
Para que LLMs leiam e citem o conteúdo corretamente:
- **HTML server-rendered** (sem SSR/SSG o crawler de IA também vê página vazia — ver [decisão de arquitetura](../04-protocolos/protocolo-decisao-arquitetura.md)).
- **Conteúdo extraível e factual:** respostas diretas, definições claras, listas e tabelas; evitar enterrar a informação em JS/imagem.
- **Dados estruturados (Schema.org/JSON-LD)** ricos — `FAQPage`, `Article`, `Product`, `Organization`, `BreadcrumbList` — ajudam a IA a entender entidades.
- **Autoridade e atribuição:** autor, data de publicação/atualização, fontes. IA prioriza conteúdo confiável e datado.
- **`llms.txt`** na raiz quando fizer sentido (guia o que a IA deve considerar) e política explícita de crawlers de IA no `robots.txt` (permitir/bloquear conscientemente).
- **Respostas autocontidas:** cada página responde bem a uma intenção, sem exigir navegação para fazer sentido.

## AIO — AI Optimization (conteúdo/dados consumíveis por IA)
Quando o próprio produto expõe dados/recursos a agentes ou IA interna:
- **APIs limpas e documentadas**, dados normalizados e semânticos (alinha com [nomenclatura](guardiao-nomenclatura-semantica.md) e [modelagem](guardiao-modelagem-dados.md)).
- **Estrutura previsível** (IDs estáveis, paginação, tipos claros) para consumo programático.
- **Privacidade primeiro:** o que é exposto a IA respeita [LGPD](guardiao-lgpd-privacidade.md) e não vaza PII; bloquear indexação/treinamento de áreas sensíveis.
- **Controle de exposição:** decidir explicitamente o que pode/não pode ser consumido por IA externa.

> SEO/GEO se aplicam a **conteúdo público**; em sistemas 100% internos (ERP atrás de login) prevalece a regra de `noindex` + bloqueio de crawlers de IA. AIO pode existir mesmo em produto interno (IA assistindo o usuário).

---

## Impacto em outros guardiões
- **Guardião de Acessibilidade:** HTML semântico e hierarquia de headings servem a SEO, a leitores de tela e a leitura por IA simultaneamente.
- **Guardião de Performance:** Core Web Vitals são métrica comum de SEO e de UX.
- **Protocolo de Decisão de Arquitetura:** SSR/SSG é pré-requisito de SEO e GEO.
- **Guardião de LGPD:** AIO não pode expor PII; crawlers de IA controlados conscientemente.
- **Guardião de Boas Práticas Proativas:** é o eixo "SEO/GEO/AIO" do catálogo.
