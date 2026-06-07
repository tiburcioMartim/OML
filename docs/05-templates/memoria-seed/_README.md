# Seed da Memória (esqueleto canônico)

Esta pasta é o **esqueleto vazio** de `memoria/` que o motor do OML carrega. É **parte do Motor** (versionada, igual em todo projeto) — **não** contém dado de projeto.

## Para que serve

- **Bootstrap (projeto novo):** ao ativar o OML num clone recém-baixado, `memoria/` não existe (é ignorada pelo git). O passo *seed-if-missing* de `/migracao-ativar` copia este esqueleto para `../../../memoria/`.
- **Atualização (projeto antigo):** `/oml-atualizar` usa este seed para **criar apenas o que falta** em `memoria/` — pastas/arquivos novos introduzidos por uma versão mais recente. **Nunca sobrescreve** arquivo existente.

## Regra de ouro

> O seed só **cria o que falta**. Arquivo de memória que já existe no projeto é **dado** — intocável. Ver [`docs/00-visao-geral/politica-versionamento-atualizacao.md`](../../00-visao-geral/politica-versionamento-atualizacao.md).

## Conteúdo

Espelha a estrutura mínima de `memoria/`: inventários, decisões, histórico, backlog, riscos, pendências, scaffolds, mapa hierárquico e os `_README.md` de `gates/` e `regras-negocio/`. Arquivos preenchidos em runtime por comandos próprios (ex.: `atlas-regras-negocio.md`, `plugins-disponiveis.md`, ledgers `regras-negocio/{slug}.md`, marcadores `gates/gate-*.md`) **não** entram no seed — nascem do uso.
