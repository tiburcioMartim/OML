# Protocolo de Sincronização de Memória

## Por quê

A memória do OML (`memoria/`) desatualiza: o agente passa a operar com dados obsoletos sobre telas migradas, componentes e decisões. **Nunca operar com memória defasada.** Esta sincronização é obrigatória no início de cada sessão (`/migracao-ativar`) e disponível sob demanda (`/migracao-sincronizar`).

## Fontes de verdade (código real)

| Sinal no código | Atualiza em `memoria/` |
|---|---|
| Controllers + rotas existentes | `backlog-telas.yaml`, `historico-migracao.md` |
| Pages Inertia / views renderizadas | `historico-migracao.md` (tela implementada) |
| `menu.js` / definição de menu | `backlog-telas.yaml` (telas ativas × pendentes) |
| Components reais | `inventario-componentes.md` |
| Policies / gates / middleware | `inventario-permissoes.md` |
| Clients / chamadas externas | `inventario-integracoes.md` |
| Models + schema vivo | `inventario-banco.md`, `scaffolds-suspeitos.md` |

## Passos

1. **Resolver diretórios** pelo perfil (`diretorio_legado`, `diretorio_novo`).
2. **Varrer o novo** (Controllers, Models, Pages, Components, rotas, menu) e o **legado** (o suficiente para confirmar origem das telas).
3. **Comparar** com `backlog-telas.yaml`:
   - Tela no código mas não no backlog → adicionar e investigar origem.
   - Tela no backlog marcada pendente mas já implementada no código → atualizar `historico-migracao.md` para migrada/homologada (conforme marcadores reais).
   - Tela no backlog sem correspondência no código → manter pendente.
4. **Reconciliar inventários** (componentes, permissões, integrações, banco) com o que de fato existe.
5. **Rodar a varredura de Models** (`protocolo-varredura-models.md`) → `scaffolds-suspeitos.md`; órfãos viram pendência prioritária.
6. **Carimbar** data e responsável da sincronização.
7. **Avisar o dev** (lista breve) se a divergência for grande — sem hard-stop, salvo risco de segurança/financeiro.

## Regras

- Divergência **nunca** é resolvida por exclusão silenciosa de memória — vira pendência em `memoria/pendencias.md`.
- O código é a fonte da verdade sobre **o que existe**; o ledger de regras (`memoria/regras-negocio/`) é a fonte sobre **o que vale**.
- A sincronização **não** implementa nem altera nada — apenas reconcilia a memória.
