# Protocolo do Adversário (Debate Adversário)

## Objetivo

Submeter uma proposta, decisão ou artefato do OML a um **debate adversário autônomo** — um agente independente cujo mandato é **refutar por padrão** — e convergir para o **melhor resultado possível** antes de comitar. É o mecanismo de "advogado do diabo" do OML: em vez de o OML validar a própria ideia (autovalidação), uma voz separada tenta derrubá-la, e uma síntese independente decide o que procede.

## Quando usar

O gatilho é a **criticidade**, não o hábito (ver `docs/00-visao-geral/matriz-criticidade.md` e `docs/03-guardioes/guardiao-criticidade-triagem.md`). **Obrigatório** em:

- Decisões de **arquitetura/design** (`docs/04-protocolos/protocolo-decisao-arquitetura.md`).
- Itens de **criticidade alta** (💀/❌ na matriz): segurança do paciente, cálculo financeiro/clínico, permissões, dado sensível, migração de banco.
- Mudanças **irreversíveis** ou de difícil rollback.
- Sempre que o dev pedir explicitamente uma "crítica dura".

**Recomendado** (não obrigatório) antes de comitar código não trivial e ao revisar dossiê, regras extraídas, paridade ou textos/prompts de peso.

## Quando NÃO usar

O debate custa no mínimo **2 subagentes por rodada** — usá-lo no barato é desperdício (viola `docs/03-guardioes/guardiao-custos-complexidade.md`). **Pule** o Adversário quando:

- [ ] A mudança é **trivial, reversível ou cosmética** (rename, ajuste de texto, CSS isolado).
- [ ] É **hotfix time-critical** — o custo do debate atrasa a correção de um incidente ativo.
- [ ] O **custo do debate supera o risco** da decisão (baixa criticidade + fácil rollback).
- [ ] O artefato já passou por debate e **nada material mudou** desde então.

Na dúvida entre usar e pular, triar pela criticidade — não debater "por garantia".

---

## Os 3 papéis

O debate tem três papéis, e a independência entre eles é o que faz o mecanismo funcionar (sem ela vira teatro).

| Papel | Quem | Mandato |
|---|---|---|
| **Proponente** | OML / loop principal | Declara a **proposta**, o **racional** e os **critérios de sucesso explícitos**. Monta o **pacote de evidência neutro** (ver abaixo). Revisa a proposta a cada rodada. |
| **Adversário** | Subagente independente (Agent tool), **contexto isolado** | **Refutar por padrão**: "está errado até prova em contrário". Recebe a proposta + critérios + pacote de evidência — **nunca** o racional do proponente como verdade. Produz objeções concretas, acionáveis, com evidência. Pode **exigir fonte faltante**. |
| **Juiz (síntese)** | Subagente independente (Agent tool), **contexto isolado** | Para cada objeção decide **procede / improcede / parcial**, com **justificativa explícita**. Produz a **proposta revisada**. Nunca é o mesmo contexto do proponente. |

**Regra de independência:** o Adversário e o Juiz rodam como subagentes separados, cada um com seu próprio contexto. O Adversário recebe a proposta como **hipótese a derrubar**, não como fato.

---

## Pacote de evidência (anti-autovalidação)

O ponto mais frágil de um debate é **quem controla a evidência**. Se o Proponente entrega ao Adversário só o que favorece a proposta, o crítico é desarmado silenciosamente. Por isso:

- [ ] O Proponente monta um **pacote de evidência neutro**: aponta **onde** estão as fontes (código, tela do legado, docs, queries), sem curar a favor da tese.
- [ ] O Adversário pode declarar **`PRECISO DE FONTE: <o quê>`**. O Proponente é **obrigado** a fornecer a fonte ou a marcar como **lacuna de evidência** — que **bloqueia** (ver severidade).
- [ ] O rebaixamento a 🔵 por "sem origem" vale **só** para objeção genuinamente **infundada/alucinada** — **nunca** para uma objeção que não pôde citar origem porque a fonte foi **retida ou está indisponível**. Essa vira **lacuna de evidência**, não estilo.

---

## Severidade das objeções

- 🔴 **Crítica** — viola a Regra-Mãe, um guardião duro, corretude, segurança, ou perde regra do legado. **Bloqueia** a convergência até resolver ou virar decisão do dev.
- 🟡 **Menor** — melhoria real de qualidade, custo ou manutenção; não quebra nada. Endereçar ou justificar.
- 🔵 **Estilo/opinião** — preferência sem evidência de dano. **Não bloqueia**.
- ⚠️ **Lacuna de evidência** — objeção plausível que o Adversário **não pôde fundamentar porque a fonte foi retida/indisponível**. **Bloqueia** como 🔴 até o Proponente fornecer a fonte (aí vira 🔴/🟡/🔵 conforme o que a fonte revelar) ou assumir a lacuna como risco registrado.

**Evidência é obrigatória** para 🔴/🟡. Marcas do OML valem para o Adversário: `A INVESTIGAR` e `HIPÓTESE NÃO VALIDADA` (ver `politica-anti-alucinacao.md`). Melhor **uma objeção sólida** que cinco fracas — é **proibido inventar objeção para preencher cota**.

---

## O loop de convergência

```
Rodada N:
  1. Proponente declara/atualiza proposta + critérios + pacote de evidência.
  2. Adversário (subagente) tenta derrubá-la → objeções (severidade + evidência; pode exigir fonte).
  3. Juiz (subagente) julga cada objeção com justificativa → proposta revisada.
  4. Convergiu? → entrega. Senão → Rodada N+1 com a proposta revisada.
```

**Três estados terminais distintos** — o resultado nomeia qual foi (nunca confundir):

- **CONVERGIDO** — a única saída que pode ser chamada de "aprovado". Chega-se por **uma de duas vias** (aprendido em teste real: um adversário competente quase nunca "seca" de todo — sempre há um 🟡 de precisão fina —, então convergência não pode ser "zero objeção", tem de ser "zero **bloqueio**"):
  - **(a) Seca dupla** — duas rodadas consecutivas sem nenhuma objeção nova ≥ 🟡 (ou ⚠️) procedente; **ou**
  - **(b) Retornos decrescentes declarados pelo Juiz** — a rodada não produziu **nenhum 🔴 nem ⚠️ novo**, e o Juiz avalia **com justificativa** que as 🟡 restantes são **polimento não-bloqueante** (o núcleo não tem buraco estrutural). As 🟡 remanescentes vão para a Ata como **melhorias opcionais**, não pendências. Um 🔴/⚠️ em aberto **proíbe** esta via.
- **ESGOTADO** — bateu o teto de rodadas ainda com objeções procedentes abertas. Entrega o **melhor estado** + a lista de 🔴/⚠️ pendentes marcadas como **não resolvidas**. **Nunca** rotular como convergido.
- **BLOQUEADO** — uma objeção **⚠️ lacuna de evidência** procedente retém um **fato-raiz indisponível**, e a decisão não pode ser fechada sem ele. Não é ESGOTADO (não faltaram rodadas — faltou **fato**): o debate para **na rodada em que o ⚠️ sobrevive** e **escala ao dev** com as perguntas exatas. A proposta fica **condicional** (ramificada pelos fatos faltantes), nunca fechada. Distingue-se do 🔴 por trade-off: aqui não há escolha de valor a fazer — há um dado a obter.

**Orçamento (recalibrado):** o teto conta **só rodadas quentes** — rodadas que produzem ≥1 objeção procedente. **Rodadas secas não consomem orçamento.** Default: **3 rodadas quentes**. Assim as "2 secas consecutivas" são sempre alcançáveis (a rodada 1 é obrigatoriamente quente pelos guarda-corpos; o mecanismo não "converge por truncamento").

**Backstop absoluto (teto duro):** independentemente de quentes e secas, o debate **nunca passa de 5 rodadas totais**. Atingido esse teto sem convergir, encerra como **ESGOTADO** (ou **BLOQUEADO**, se houver ⚠️ aberto) — impede oscilação quente/seca indefinida, já que rodadas secas por si não consomem o orçamento de quentes.

**Anti-loop (relaxado):** o Adversário só pode reapresentar uma objeção já julgada improcedente se trouxer **evidência nova OU argumento materialmente mais forte** — não a mesma alegação repetida. O Juiz descarta reincidência sem reforço real.

---

## Prestação de contas do Juiz

O Adversário estressa a proposta; ninguém estressa o Juiz por padrão — então o Juiz presta contas:

- [ ] **Justificativa explícita por veredito** (uma linha por objeção, no mínimo).
- [ ] Um veredito **improcedente sobre um 🔴** pode ser **apelado**: reabertura com argumento mais forte (via anti-loop relaxado), **ou** — em decisão de alta criticidade — um **2º juiz independente** opcional, **ou** escalar ao dev. O contra-adversário **não** é obrigatório por padrão (evita custo e regresso infinito).

---

## Lentes por alvo

O Adversário carrega, como checklist, os guardiões/protocolos do alvo. Não são exaustivos — são o piso.

| Alvo | Lentes obrigatórias |
|---|---|
| **Arquitetura/design** | `protocolo-decisao-arquitetura.md`, `guardiao-custos-complexidade.md`, `guardiao-manutenibilidade.md`, Regra-Mãe #6 |
| **Código/implementação** | `guardiao-testes.md`, `guardiao-seguranca.md`, `guardiao-performance.md`, `guardiao-reuso-componentes.md`, `guardiao-manutenibilidade.md`; skill `/code-review` quando disponível |
| **Migração OML** | Regra-Mãe #1-5, `protocolo-revisao-paridade.md`, `protocolo-extracao-regras.md`, `protocolo-investigacao-permissoes.md`, `politica-anti-alucinacao.md` |
| **Textos/docs/prompts** | Clareza, lacunas, ambiguidade, testabilidade da instrução, contradição com docs existentes do motor |

---

## Guarda-corpos (anti-teatro)

- [ ] A **rodada 1 deve** produzir ≥1 objeção real — nunca um "parece bom" genérico.
- [ ] O Adversário **não vê** o racional do proponente como autoridade — só a proposta, os critérios e o pacote de evidência **neutro**.
- [ ] O Juiz **não é** o mesmo contexto do proponente (senão vira autovalidação).
- [ ] Objeção 🔵 (estilo) **nunca** bloqueia; **lacuna de evidência** (⚠️) **sempre** bloqueia.
- [ ] **Proibido inventar objeção** para preencher cota — herda a anti-alucinação.
- [ ] O Proponente **não cura** a evidência a favor da tese.

---

## Orquestração

- **Padrão (qualquer sessão):** o Proponente (loop principal) dispara o Adversário e o Juiz como **subagentes** (Agent tool), uma chamada por papel por rodada.
- **Profundo (sob pedido explícito):** para alto risco, pode rodar como **Workflow** — leque de múltiplos adversários com **lentes distintas** + juiz por rodada, com `loop-until-dry`. Só quando o dev pedir (opt-in de orquestração multi-agente).

### Regra de execução — isolamento por papel (dura)

Aprendida em teste real: um subagente genérico tende a **assumir os três papéis sozinho** — propor, criticar *e* se julgar dentro do mesmo contexto — o que anula a independência e vira autovalidação. Para impedir:

- [ ] **Um subagente por papel por rodada** — Adversário é uma chamada Agent; Juiz é **outra**, em contexto separado. Nunca o mesmo contexto para dois papéis.
- [ ] **O Adversário só objeta** — proibido propor solução, reescrever a proposta, simular rodadas ou julgar as próprias objeções.
- [ ] **O Juiz só julga e sintetiza** — proibido inventar objeção nova.
- [ ] **Teto de objeções por rodada** no prompt do Adversário (ex.: 6), **sem cota mínima** — evita varredura interminável (~19 min de descontrole vs ~1 min por papel quando escopado).
- [ ] Cada subagente retorna **só o artefato do seu papel**.

---

## Integração ao fluxo

O Adversário **não é um comando órfão** — o fluxo o dispara por processo, condicionado à criticidade (não é gate duro universal, para respeitar "Quando NÃO usar"):

- **Decisão de arquitetura** (`protocolo-decisao-arquitetura.md`) → debate **obrigatório** antes de gravar a decisão em `decisoes.md`.
- **`/migracao-autorizar-implementacao`** (Fase 12) → debate **obrigatório** para telas de **criticidade alta**; recomendado nas demais.
- **`/migracao-revisar-paridade`** (Fase 14) → debate **recomendado** para telas de criticidade alta.
- **Definição de Pronto** (`docs/00-visao-geral/definicao-de-pronto.md`) → item condicional: "debate adversário realizado quando aplicável (alta criticidade/arquitetura)".

---

## Laço de aprendizado (o OML aprende)

Uma objeção que se repete entre debates é um **buraco no Proponente**, não um acaso — e tem que virar regra, senão o OML repete o mesmo erro. Fecha o laço:

- [ ] Toda objeção **procedente** entra na **Ata** (`memoria/atas/`) com seu tipo (validação, permissão, LGPD, custo, …).
- [ ] Quando um **tipo de objeção recorre** (≥ 3 debates), ele é **promovido** a item de checklist/guardião e registrado em `historico-aprimoramento.md` (fonte única do aprimoramento) — para que **futuras propostas já o antecipem**.
- [ ] Conecta com `/migracao-gerar-relatorio-aprimoramento` e `docs/03-guardioes/guardiao-evolucao-agente.md`.

---

## Nível de autonomia

🟢 **Autônomo** (ver `docs/00-visao-geral/politica-autonomia.md`): roda as rodadas sozinho e entrega o **resultado + a Ata**, sem parar o dev. **Eleva para 🔴 Crítico** e para em dois casos, com razões diferentes:

- **Trade-off** — um 🔴 sobrevive e a resolução exige uma **escolha de valor que é do dev** (ex.: conflito entre dois itens da Regra-Mãe). Apresenta a decisão de forma concisa.
- **BLOQUEADO por fato faltante** — um **⚠️** sobrevive: falta um **dado**, não uma decisão. Para e faz ao dev as **perguntas exatas** que destravam a arquitetura/decisão (nunca presume o fato).

---

## Saída obrigatória

1. **Proposta convergida** (ou melhor estado, se ESGOTADO).
2. **Ata do Debate persistida** em `memoria/atas/{AAAA-MM-DD}-{slug}.md` (append-only, sobrevive à sessão) — **sempre**, inclusive debate genérico. Contém, por rodada: objeções (severidade + origem), veredito **justificado** do Juiz, o que mudou; e o **veredito final** (CONVERGIDO / ESGOTADO).
3. **Ponteiro em `memoria/decisoes.md`** quando o debate fecha uma decisão de tela/arquitetura (linha com data + link para a Ata).

## Checklist do protocolo

- [ ] Triado por criticidade (não debater trivial/reversível)
- [ ] Critérios de sucesso e **pacote de evidência neutro** declarados antes da rodada 1
- [ ] Adversário e Juiz rodaram em contexto isolado (um por papel por rodada)
- [ ] Toda objeção sobrevivente tem origem citada; lacunas de evidência tratadas como bloqueio
- [ ] Vereditos do Juiz **justificados**
- [ ] Resultado nomeado corretamente: **CONVERGIDO** (2 secas **ou** retornos decrescentes sem 🔴/⚠️) · **ESGOTADO** (teto com 🔴 aberto) · **BLOQUEADO** (⚠️ fato do dev)
- [ ] **Ata persistida** em `memoria/atas/`; ponteiro em `decisoes.md` quando aplicável
- [ ] Objeções recorrentes encaminhadas ao laço de aprendizado

## Relacionado

- [Regra-Mãe](../00-visao-geral/regra-mae.md)
- [Política Anti-Alucinação](../00-visao-geral/politica-anti-alucinacao.md)
- [Política de Autonomia](../00-visao-geral/politica-autonomia.md)
- [Matriz de Criticidade](../00-visao-geral/matriz-criticidade.md)
- [Definição de Pronto](../00-visao-geral/definicao-de-pronto.md)
- [Protocolo de Decisão de Arquitetura](protocolo-decisao-arquitetura.md)
- [Protocolo de Revisão de Paridade](protocolo-revisao-paridade.md)
- [Protocolo de Gates de Validação](protocolo-gates-validacao.md)
- [Guardião de Evolução do Agente](../03-guardioes/guardiao-evolucao-agente.md)
