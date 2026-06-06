# Ledger de Regras de Negócio — {SLUG}

<!--
  Fonte da verdade das regras de negócio desta UNIDADE legada (tela, endpoint, job, processamento ou relatório).
  Gerado por /migracao-extrair-regras na Fase 04.5. Vive em memoria/regras-negocio/{slug}.md.
  Sobrevive ao fim da migração — é consultável para sempre.

  REGRAS DE PREENCHIMENTO (ver docs/04-protocolos/protocolo-extracao-regras.md):
  - Só se migra o que se entende. Cada detalhe (input, query, side-effect) precisa de origem citada.
  - Toda regra precisa de TIPO, ORIGEM (citação arquivo:linha) e STATUS explícito.
  - Nunca inventar regra (ver politica-anti-alucinacao). Sem evidência → 🟡 Hipótese.
  - Diferenciar bug × intenção é decisão do dev, nunca silenciosa do agente.
  - Toda mudança vs. legado vira registro em memoria/decisoes.md (coluna "Decisão").
-->

## Identificação

| Campo | Valor |
|---|---|
| Slug | {slug} |
| Unidade | (nome) |
| **Tipo de unidade** | 🖥️ tela / 🔌 endpoint / ⚙️ job / 🧮 processamento / 📄 relatório |
| **Estado funcional** | ✔️ Funciona / ⚠️ Funciona com quirk / ❌ Quebrada / 💀 Código morto (ver Legenda) |
| ID no backlog | TELA-XXXX |
| Ponto de entrada | `URL / rota / comando / agendamento` (citar) |
| Uso real (Mapa de Uso) | (acessos no log / "sem instrumentação") |
| App dono (multi-app) | — (preencher se houver 2+ apps; ver "Convivência multi-app") |
| Última atualização | AAAA-MM-DD |
| Responsável | |

---

## Legenda

**Tipo de unidade** (o que é a coisa migrada):
🖥️ `tela` · 🔌 `endpoint`/API · ⚙️ `job`/cron · 🧮 `processamento`/batch · 📄 `relatório`

**Estado funcional** (veredito sobre a unidade INTEIRA — exige evidência, nunca suposição):
- ✔️ **Funciona** — comportamento correto e coerente, sem anomalias relevantes.
- ⚠️ **Funciona com quirk** — opera, mas contém comportamento estranho (ver tabela de quirks). Migrar exige decisão sobre cada quirk.
- ❌ **Quebrada** — erro reproduzível / não cumpre o propósito. **Citar a evidência do erro.** Migrar quebrada é **decisão do dev** (corrigir × replicar × descartar) → `decisoes.md`.
- 💀 **Código morto** — sem uso real (Mapa de Uso = 0) e/ou inalcançável. **Confirmar com o dev antes de descartar** — nunca presumir morto. Cruzar com `docs/03-guardioes/guardiao-mapa-uso-backlog.md`.

**Tipo de regra** (o que a regra é):
`validação` · `cálculo` · `fluxo` · `permissão` · `side-effect` · `temporal` · `integração` · `mensagem` · `default` · `quirk`

**Status da regra** (quanto se confia nela):
- ✅ **Confirmada** — observada no código/banco com evidência citada e/ou validada pelo dev
- 🟡 **Hipótese** — inferida, ainda não validada (ver `HIPÓTESE NÃO VALIDADA` na política anti-alucinação)
- 🟠 **Possível bug — perguntar ao dev** — comportamento estranho; pode ser erro. **NÃO reproduzir nem corrigir sozinho.**
- 🔴 **Bug intencional do legado** — o dev confirmou que o comportamento "errado" deve ser preservado

**Modo** (de onde a regra vem):
- 🟦 **Legado** — destilada do sistema antigo
- 🟩 **Greenfield** — inédita (feature nova); origem = decisão do dev em `decisoes.md` + tela análoga de referência
- 🟪 **Híbrido** — regra do legado adaptada/alterada na migração (mudança registrada em `decisoes.md`)

---

## Regras

| ID | Regra (objetiva) | Tipo | Modo | Origem (arquivo:linha / decisão) | Status | Decisão (ref. decisoes.md) |
|---|---|---|---|---|---|---|
| RN-{slug}-01 | | validação | 🟦 Legado | `app/Http/Requests/Foo.php:23` | 🟡 Hipótese | — |
| RN-{slug}-02 | | cálculo | 🟦 Legado | `app/Services/Bar.php:48` | 🟠 Possível bug | — |

<!-- Uma linha por regra. ID sequencial. Origem é CITAÇÃO DIRETA obrigatória (arquivo:linha, query SQL, URL ou "validação humana"). -->

---

## Mapa de inputs e linhagem de dados

<!--
  Para CADA campo/input da unidade: de onde o dado vem, como se comporta e qual query o alimenta.
  "Só se migra o que se entende" — input sem origem rastreada = 🟡 Hipótese, vira pendência de investigação.
-->

| Input / Campo | Como popula | Origem do dado | Query / fonte (citar) | Filtros / dependências | Obs / quirk |
|---|---|---|---|---|---|
| ex: `select cliente` | carrega no load | `tab_clientes.nome` | `Q-01` | `where ativo=1` ordenado por nome | — |
| ex: `valor_total` | calculado no submit | derivado | RN-{slug}-02 | depende de `itens[]` | divide por 100 → ver RN |

Origem do dado ∈ { tabela.coluna · query · endpoint · sessão/usuário · request · hardcode · cálculo · arquivo/storage }.

---

## Queries

<!-- Cada SQL relevante que a unidade executa. Marcar quirk (GROUP BY sem ORDER BY, JOIN sem índice, etc.). -->

| ID | O que faz | Tabelas | Escreve? | Origem (arquivo:linha) | Quirk? |
|---|---|---|---|---|---|
| Q-01 | lista clientes ativos | `tab_clientes` | não | `app/.../Repo.php:31` | — |
| Q-02 | soma itens do pedido | `tab_itens` | não | `app/.../Repo.php:54` | 🟠 GROUP BY sem ORDER BY |

---

## Fluxo das regras (diagrama)

<!--
  Fluxograma do comportamento da unidade: entradas → validações → cálculos → decisões → side-effects → saída.
  Fonte do Atlas de Fluxos de Regras (docs/05-templates/atlas-regras-negocio.template.md).
  Use os IDs das regras (RN-{slug}-NN) nos nós para rastreabilidade.
-->

```mermaid
flowchart TD
    A[Entrada: ponto de entrada] --> B{RN-{slug}-01 validação}
    B -- inválido --> E[mensagem de erro]
    B -- válido --> C[RN-{slug}-02 cálculo]
    C --> D{RN-{slug}-03 fluxo/decisão}
    D --> F[side-effect: e-mail/job]
    D --> G[Saída / persistência]
```

---

## Detalhamento (regras que exigem contexto)

### RN-{slug}-NN — [título curto]
- **Tipo:** [tipo]
- **Comportamento:** o que acontece, exatamente.
- **Origem:** `arquivo:linha` (trecho citado, se útil).
- **Status:** [status] — justificativa de 1 linha.
- **Multi-app:** App dono = [app]; apps que apenas leem = [lista] (referenciam, não duplicam).
- **Pendência/decisão:** se 🟠/🔴 ou 🟪/🟩 → link para `memoria/pendencias.md` ou `memoria/decisoes.md`.

---

## Convivência multi-app

<!-- Preencher SOMENTE se a regra é usada por 2+ apps. Regra (fonte única): docs/03-guardioes/guardiao-regras-negocio.md → "Convivência multi-app". Resumo: a regra mora no app que ESCREVE (dono); apps que só LEEM referenciam, não duplicam; divergência é proibida e vira pendência. -->

| Regra | App dono (escreve) | Apps que leem |
|---|---|---|
| RN-{slug}-NN | admin | portal, mobile |

---

## Quirks e bugs do legado (registro destacado)

<!-- Itens 🟠/🔴 reunidos aqui para visibilidade. Cada um deve ter destino: perguntar ao dev OU decisão registrada. -->

| ID | Comportamento | 🟠/🔴 | Encaminhamento |
|---|---|---|---|
| RN-{slug}-NN | ex: GROUP BY sem ORDER BY → linha indeterminada | 🟠 | Perguntar ao dev (pendencias.md) |
