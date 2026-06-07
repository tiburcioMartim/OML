# Gates (marcadores de aprovação)

Marcadores de aprovação humana dos Gates 🔴. O OML **cria** o arquivo quando o dev dá o "sim" explícito, e os comandos de gate duro **checam a existência** antes de prosseguir (ver `docs/04-protocolos/protocolo-gates-validacao.md`).

| Arquivo | Significa | Criado quando |
|---|---|---|
| `gate-1-design-system.md` | Gate 1 (Fase 04 — Design System) aprovado | Dev aprova o layout/Design System |
| `gate-2-homologacao-{slug}.md` | Gate 2 (Fase 15 — Homologação) da tela aprovado | Dev homologa a tela `{slug}` |

Cada marcador registra: data, responsável e um resumo do que foi aprovado.

> Gate duro ≠ aviso. Sem o marcador, o comando da fase posterior **aborta** apontando o passo que falta.
