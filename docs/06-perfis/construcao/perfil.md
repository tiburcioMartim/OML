# Perfil de Construção (Greenfield)

Perfil-base para projetos **novos, sem legado de origem** (`modo: construcao`) e para a parte inédita de projetos `modo: hibrido`. Combina com um perfil de stack (ex.: `laravel`, `vue`, `inertia`) — este perfil define a **moldura de modo**, o de stack define a tecnologia.

> Governado por `docs/00-visao-geral/politica-modos-projeto.md`. Em `modo: migracao` este perfil não se aplica.

## Fonte de verdade
Não há legado. A verdade funcional vem de **decisão do dev + boas práticas + perfil**, registrada em `memoria/decisoes.md` e capturada por `docs/01-comandos/construir-capturar-requisitos.md`. O mesmo rigor anti-alucinação do legado se aplica: o OML **nunca constrói da imaginação**.

## Esteira
Segue `docs/02-fases/fluxo-construcao.md` (pula 01/05/17; substitui 02/03/14; mantém os 2 Gates).

## Guardião-orquestrador
`docs/03-guardioes/guardiao-boas-praticas-proativas.md` — nenhuma feature é pronta sem passar pelo catálogo. As boas práticas são fundacionais ("de berço"), não refatoração posterior.

## Inclui (lido como "padrões a aplicar")
- Regra-mãe (itens 1-5 na coluna **Construção** — ver `docs/00-visao-geral/regra-mae.md`)
- Definição de Pronto por **critérios de aceite** (não paridade) — `docs/00-visao-geral/definicao-de-pronto.md`
- Política de super microfases, anti-alucinação, autorização e preservação de contexto
- Guardião de **modelagem de dados** (schema novo bem projetado), em vez do guardião de qualidade de dados (base legada)
- Catálogo de boas práticas proativas e todos os guardiões temáticos (LGPD, segurança, performance, nomenclatura, a11y, dark/light, SEO, etc.)

## Validação final
Critérios de aceite + Catálogo de Boas Práticas (Gate 2 — Homologação). Sem legado a espelhar.

## O que NÃO usar
- Comandos/fases de descoberta e investigação do legado (`/migracao-descobrir-telas`, Fases 01/05, conciliação)
- `diretorio_legado` (opcional/ausente — ver `docs/00-visao-geral/politica-estrutura-workspace.md`)
- Importação de `.env` do legado e logomarca herdada (identidade visual é nova)
