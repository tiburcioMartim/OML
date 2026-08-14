---
tipo: indice
titulo: "🧠 Cérebro dos Sistemas"
atualizado: {AAAA-MM-DD}
---

# 🧠 Cérebro dos Sistemas — a porta

Mapa vivo dos sistemas do workspace: o que cada um faz, de onde lê, e onde mora o conhecimento
sobre eles. É um **vault do Obsidian** aberto na raiz do workspace — enxerga, no mesmo grafo,
os documentos de todos os projetos e a `memoria/` de cada OML.

> [!info] Como isto funciona
> Ver [[COMO-USAR]]. Regra do link: tudo se conecta por `[[wikilink]]` — é o link que forma o grafo.

## Os sistemas (um MOC para cada)

<!-- Uma linha por sistema. Seed a partir de sistema.template.md em cerebro/sistemas/<slug>.md -->

| Sistema | O que é | Repo | MOC |
|---|---|---|---|
| {Nome} | {uma frase} | `{repo}/` | [[{slug}]] |

## Cortes que atravessam sistemas (domínios)

<!-- Assuntos que não moram num sistema só: LGPD, uma frente de migração, uma integração. -->

- [[{dominio-slug}]] — {uma frase}

## Camadas de memória (de onde o conhecimento vem)

1. **Memória do Claude** — `cerebro/memoria-claude/` (se houver symlink) — memória de trabalho.
2. **Memória do OML** — `<projeto>/OML/memoria/` — a fonte da verdade (ledgers, inventários).
3. **Docs dos projetos** — `<projeto>/docs/` e estudos na raiz.

## Dashboards

[[dashboards]] — painéis a partir do frontmatter (exige o plugin Dataview; ver [[COMO-USAR]]).
