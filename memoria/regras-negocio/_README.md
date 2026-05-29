# Ledger de Regras de Negócio

Esta pasta é a **fonte da verdade** das regras de negócio do projeto. Um arquivo por tela/módulo: `{slug}.md`, no formato de `docs/05-templates/ledger-regras-negocio.template.md`.

- **Gerado por:** `/migracao-extrair-regras [ID]` (Fase 04.5).
- **Consumido por:** dossiê (Fase 06, com **gate duro** — não gera sem o ledger), implementação (Fases 10–13) e paridade (Fase 14).
- **Persistência:** os ledgers **sobrevivem ao fim da migração** — continuam consultáveis como documentação viva das regras.

## Cada regra tem

- **Tipo:** validação · cálculo · fluxo · permissão · side-effect · temporal · integração · mensagem · default · quirk
- **Origem:** citação direta (`arquivo:linha`, query SQL, URL ou validação humana) — obrigatória
- **Status:** ✅ Confirmada · 🟡 Hipótese · 🟠 Possível bug (perguntar ao dev) · 🔴 Bug intencional do legado
- **Modo:** 🟦 Legado · 🟩 Greenfield (inédita) · 🟪 Híbrido (adaptada)

Detalhes: `docs/03-guardioes/guardiao-regras-negocio.md` e `docs/04-protocolos/protocolo-extracao-regras.md`.

## Greenfield / híbrido (projetos que não são migração pura)

Features novas e regras adaptadas usam o **mesmo ledger, mesmo formato**. Muda só o modo:
- 🟩 **Greenfield** → origem = decisão do dev em `../decisoes.md` (+ tela análoga de referência, se houver).
- 🟪 **Híbrido** → regra do legado alterada; a mudança é registrada em `../decisoes.md`.

Não há fork "OML-criação": tudo converge para esta pasta.

## Convivência multi-app

> Regra plena (fonte única): `docs/03-guardioes/guardiao-regras-negocio.md` → "Convivência multi-app". Abaixo, o uso operacional nesta pasta.

Quando o projeto tem 2+ apps que conversam por API (admin + portal, mobile + web, microserviços):

1. **A regra mora no app que escreve** — o **dono / fonte da verdade** (em geral o admin).
2. Apps que apenas **leem** referenciam a regra (coluna "App dono" do ledger) — **nunca duplicam a implementação**.
3. **Divergência de comportamento entre apps é proibida.** Detectou divergência → pendência prioritária em `../pendencias.md`.

| Regra | App dono (escreve) | Apps que leem | Ledger |
|---|---|---|---|
| _ex:_ RN-cobranca-03 | admin | portal, mobile | `cobranca.md` |
