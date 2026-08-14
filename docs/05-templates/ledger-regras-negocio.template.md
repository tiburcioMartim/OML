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
| **Extração finalizada** | ☐ Não · ✅ Sim (AAAA-MM-DD) — só marca ✅ quando cumprir a *Definição de Pronto da Extração* abaixo |
| Última atualização | AAAA-MM-DD |
| Responsável | |

---

## Definição de Pronto da Extração

<!--
  A unidade só é "extração finalizada" (e some da fila de extração) quando TODOS os itens abaixo são verdadeiros.
  Enquanto não estiver finalizada, o OML volta a esta unidade até concluir — a meta é cobrir 100% do projeto.
  Lacuna investigável NÃO bloqueia: o OML investiga, preenche e retoma (gate auto-resolvível, ver protocolo de gates).
  Só o que depende do dev (🟠 / ❌ / 💀 / decisão) fica como pendência aberta.
-->

- [ ] **Estado funcional** definido com evidência (✔️/⚠️/❌/💀)
- [ ] **Todas as regras** com tipo, origem citada (`arquivo:linha`) e status
- [ ] **Todo input** com linhagem completa (origem + cadeia de transformações até a exibição/persistência)
- [ ] **Todas as queries** catalogadas (o que faz, tabelas, escreve?, quirk?)
- [ ] **Fluxograma** desenhado; **diagrama de sequência** quando houver side-effects/integrações
- [ ] **Quirks** (🟠) e estados ❌/💀 **encaminhados ao dev** (pendência/decisão registrada)
- [ ] Sem 🟡 Hipótese que seja investigável e ainda não investigada

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

## Mapa de inputs e linhagem de dados (profunda)

<!--
  Para CADA campo/input da unidade: de onde o dado vem, COMO é transformado até chegar na tela/persistência, e qual query o alimenta.
  "Só se migra o que se entende" — input sem linhagem rastreada = 🟡 Hipótese, vira pendência de investigação.
  A linhagem é DOCUMENTADA para consulta futura: uma vez rastreada, não se investiga de novo.
-->

| Input / Campo | Como popula | Origem do dado | Query / fonte | **Cadeia de transformações (origem → … → exibição/persistência)** | Filtros / dependências | Obs / quirk |
|---|---|---|---|---|---|---|
| ex: `select cliente` | carrega no load | `tab_clientes.nome` | `Q-01` | `tab_clientes.nome` → `ucwords()` → option label | `where ativo=1` ord. nome | — |
| ex: `valor_total` | calculado no submit | derivado | RN-{slug}-02 | `SUM(itens.preco_cents)` → `/100` → `number_format(2)` → `R$` | depende de `itens[]` | divide por 100 → ver RN |

Origem do dado ∈ { tabela.coluna · query · endpoint · sessão/usuário · request · hardcode · cálculo · arquivo/storage }.

> **Cadeia de transformações = bem profunda.** Registrar cada passo (função/formatação/conversão/máscara/arredondamento) entre a origem e o que o usuário vê ou o que é gravado. É aqui que quirks de cálculo (dividir por 100, arredondamento, fuso, encoding) aparecem — cada um vira regra com status.

---

## Queries

<!-- Cada SQL relevante que a unidade executa. Marcar quirk (GROUP BY sem ORDER BY, JOIN sem índice, etc.). -->

| ID | O que faz | Tabelas | Escreve? | Origem (arquivo:linha) | Quirk? |
|---|---|---|---|---|---|
| Q-01 | lista clientes ativos | `tab_clientes` | não | `app/.../Repo.php:31` | — |
| Q-02 | soma itens do pedido | `tab_itens` | não | `app/.../Repo.php:54` | 🟠 GROUP BY sem ORDER BY |

---

## Fluxo das regras (diagramas)

<!--
  Quanto mais bem desenhado e informado, melhor. Dois diagramas, fonte do Atlas:
  1) FLUXOGRAMA do comportamento (entradas → validações → cálculos → decisões → saída), nós rotulados com RN-{slug}-NN.
  2) DIAGRAMA DE SEQUÊNCIA quando houver side-effects/integrações (quem chama quem, em que ordem, o que falha).
  Use os IDs das regras nos rótulos para rastreabilidade. Marcar ramos de erro e quirks.
-->

### Fluxograma (lógica)
```mermaid
flowchart TD
    A([Entrada: ponto de entrada]) --> B{RN-{slug}-01 validação}
    B -- inválido --> E[/mensagem de erro RN-{slug}-08/]
    B -- válido --> C[RN-{slug}-02 cálculo total]
    C --> D{RN-{slug}-03 competência aberta?}
    D -- não --> H[bloqueia + mensagem]
    D -- sim --> F[[side-effect: emite NF RN-{slug}-05]]
    F --> G[(persiste)]
```

### Sequência (side-effects / integrações) — preencher se houver
```mermaid
sequenceDiagram
    actor U as Usuário
    participant T as Tela/Controller
    participant DB as Banco
    participant Q as Fila/Job
    participant X as Integração externa
    U->>T: submit
    T->>DB: grava (Q-03)
    T->>Q: enfileira RN-{slug}-05
    Q->>X: chama API
    X-->>Q: ok / falha (registrar RN-{slug}-06)
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

## 🧠 Ligações (cérebro)

<!--
  O que faz este ledger virar nó do grafo do cérebro (ver docs/04-protocolos/protocolo-cerebro-obsidian.md).
  Emitir [[wikilinks]] para o que se conecta — SÓ para o que EXISTE (política anti-alucinação).
  Um [[link]] pendente só é aceitável como marcador consciente de algo a criar, nunca como fato.
-->

- **Sistema dono:** [[cerebro/sistemas/{slug-do-sistema}]]
- **Unidades relacionadas:** [[regras-negocio/{outro-slug}]] (dependências, telas que consomem/alimentam)
- **Domínios que atravessa:** [[cerebro/dominios/{slug}]] (ex.: LGPD, uma integração, uma frente)

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
