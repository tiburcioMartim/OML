# Protocolo de Decisão de Arquitetura (Projetos Novos)

## Objetivo
Escolher a **arquitetura de renderização e stack** de um projeto novo (ou de uma feature inédita) com base em critérios objetivos — principalmente a necessidade de **SEO/GEO/indexação** — em vez de aplicar Inertia por hábito. A decisão é registrada e vira fonte de verdade.

## Quando usar
- Modo **construção**, no início (após `/construir-capturar-requisitos`, antes da Fase 04).
- Modo **híbrido**, ao introduzir uma área pública nova em um projeto antes 100% interno.
- Sempre que a necessidade de indexação de uma parte do produto mudar.

> Apoia-se em `deep-research` quando disponível (ver [protocolo de plugins](protocolo-plugins-claude.md)).

---

## Pergunta-raiz: o conteúdo precisa ser lido por máquinas externas?

Indexação não é só Google. Hoje há **três consumidores**:
- **SEO** — buscadores tradicionais (Google/Bing) precisam do HTML pronto no primeiro byte.
- **GEO** (Generative Engine Optimization) — LLMs/assistentes que citam o conteúdo (ver [guardião de SEO/GEO/AIO](../03-guardioes/guardiao-seo.md)).
- **Compartilhamento social** — Open Graph exige HTML server-rendered.

Se **qualquer** dos três importa para uma rota, essa rota **precisa de HTML renderizado no servidor (SSR/SSG)**. Um SPA puro (JS renderiza no cliente) entrega HTML vazio ao crawler.

---

## Árvore de decisão

```
A página é pública e precisa ser indexada/citada/compartilhada (SEO/GEO/OG)?
│
├── NÃO  (ERP, dashboard, área atrás de login, back-office)
│        → SPA atrás de login. No ecossistema Laravel: LARAVEL + VUE + INERTIA.
│          (Sem SSR. Mais simples, sem Node em produção, DX excelente.)
│
└── SIM  (landing, marketing, blog, e-commerce, portal, catálogo público)
         → Precisa de HTML server-rendered. Escolher entre:
         │
         ├── Conteúdo majoritariamente estático / pouco interativo
         │     → SSG/Blade ou Laravel + Livewire/Folio, ou Inertia SSR leve.
         │
         ├── App rico + áreas públicas no MESMO produto Laravel
         │     → INERTIA + SSR (renderização Node no servidor) para as rotas públicas.
         │
         └── Front desacoplado / time de front dedicado / SEO crítico
               → NUXT (Vue) ou NEXT (React) desacoplado, Laravel como API.
```

---

## Matriz de escolha

| Critério | Inertia (SPA) | Inertia + SSR | Blade/Livewire | Nuxt/Next desacoplado |
|---|---|---|---|---|
| SEO/GEO/OG | ❌ fraco | ✅ bom | ✅ bom | ✅ ótimo |
| Complexidade operacional | 🟢 baixa | 🟡 média (Node) | 🟢 baixa | 🔴 alta (2 deploys) |
| Interatividade rica (SPA-like) | ✅ ótima | ✅ ótima | 🟡 média | ✅ ótima |
| Time-to-market | 🟢 rápido | 🟡 | 🟢 rápido | 🔴 mais lento |
| Reaproveita time Laravel | ✅ | ✅ | ✅ | 🟡 |
| Indicado para | ERP / back-office | App + páginas públicas | Sites/conteúdo | Produto público SEO-first |

> **Default do OML quando não há necessidade de SEO:** Laravel + Vue + Inertia. É o caso típico de ERP/sistema interno e o que os perfis `laravel`/`vue`/`inertia` já cobrem.

---

## Critérios que pesam além do SEO
- **Real-time / colaboração:** WebSockets (Reverb/Echo) influenciam mais a infra que a renderização.
- **Equipe:** time só-PHP → evitar Nuxt/Next desacoplado. Time com front dedicado → desacoplado vira viável.
- **Híbrido de fato:** é legítimo Inertia atrás de login **+** um conjunto de rotas públicas SSR/Blade no mesmo app. Registrar isso explicitamente.
- **Custo de Node em produção:** SSR adiciona um runtime Node a manter — alinhar com [Docker](protocolo-docker.md) e [Disaster Recovery](../03-guardioes/guardiao-recuperacao-desastre.md).

---

## Saída obrigatória
1. Decisão registrada em `memoria/decisoes.md` com **critério que pesou** (ex.: "rotas `/`, `/planos` precisam de SEO → Inertia SSR; resto atrás de login → SPA").
2. Campo de arquitetura gravado no **perfil do projeto** (`docs/06-perfis/[perfil]/perfil.md`).
3. Se SEO/GEO for relevante, ativar o [guardião de SEO/GEO/AIO](../03-guardioes/guardiao-seo.md); se 100% interno, apenas a regra de `noindex`.

## Checklist
- [ ] Pergunta-raiz respondida por rota/área (não para o produto inteiro às cegas)
- [ ] Arquitetura escolhida com critério explícito registrado em `decisoes.md`
- [ ] Perfil atualizado com a arquitetura
- [ ] Guardião de SEO/GEO/AIO ativado/dispensado conforme a decisão
- [ ] Custo operacional (Node/SSR, deploys) considerado junto com Docker/DR

## Relacionado
- [Guardião de SEO/GEO/AIO](../03-guardioes/guardiao-seo.md)
- [Protocolo de Plugins](protocolo-plugins-claude.md) (`deep-research`)
- Perfis: `docs/06-perfis/inertia/`, `docs/06-perfis/laravel/`, `docs/06-perfis/vue/`
