# Ledger de Regras de Negócio — {SLUG}

<!--
  Fonte da verdade das regras de negócio desta tela/módulo.
  Gerado por /migracao-extrair-regras na Fase 04.5. Vive em memoria/regras-negocio/{slug}.md.
  Sobrevive ao fim da migração — é consultável para sempre.

  REGRAS DE PREENCHIMENTO (ver docs/04-protocolos/protocolo-extracao-regras.md):
  - Toda regra precisa de TIPO, ORIGEM (citação arquivo:linha) e STATUS explícito.
  - Nunca inventar regra (ver politica-anti-alucinacao). Sem evidência → 🟡 Hipótese.
  - Diferenciar bug × intenção é decisão do dev, nunca silenciosa do agente.
  - Toda mudança vs. legado vira registro em memoria/decisoes.md (coluna "Decisão").
-->

## Identificação

| Campo | Valor |
|---|---|
| Slug | {slug} |
| Tela/Módulo | |
| ID no backlog | TELA-XXXX |
| App dono (multi-app) | — (preencher se houver 2+ apps; ver "Convivência multi-app") |
| Última atualização | AAAA-MM-DD |
| Responsável | |

---

## Legenda

**Tipo** (o que a regra é):
`validação` · `cálculo` · `fluxo` · `permissão` · `side-effect` · `temporal` · `integração` · `mensagem` · `default` · `quirk`

**Status** (quanto se confia nela):
- ✅ **Confirmada** — observada no código/banco com evidência citada e/ou validada pelo dev
- 🟡 **Hipótese** — inferida, ainda não validada (ver `HIPÓTESE NÃO VALIDADA` na política anti-alucinação)
- 🟠 **Possível bug — perguntar ao dev** — comportamento estranho do legado; pode ser erro. **NÃO reproduzir nem corrigir sozinho.**
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
