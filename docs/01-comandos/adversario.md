# /adversario

## Objetivo

Submeter uma proposta, decisão ou artefato do OML a um **debate adversário autônomo** e entregar o resultado convergido — o melhor possível — junto com a Ata do Debate persistida. Um agente independente refuta por padrão; uma síntese independente decide o que procede. Ver `docs/04-protocolos/protocolo-adversario.md`.

## Quando usar

Gatilho é a **criticidade** (não o hábito). **Obrigatório**: decisões de arquitetura, itens de alta criticidade (💀/❌), mudanças irreversíveis, ou quando o dev pede crítica dura. **Recomendado**: código não trivial, dossiê/regras/paridade, textos de peso.

## Quando NÃO usar

Mudança trivial/reversível/cosmética · hotfix time-critical · quando o custo do debate (2+ subagentes/rodada) supera o risco · artefato já debatido sem mudança material. Na dúvida, triar por criticidade — não debater "por garantia".

## Entradas esperadas

- **Alvo do debate** (texto livre): a proposta/decisão/artefato — ou ID da tela, caminho de arquivo, trecho.
- Opcional: `--rodadas=N` (rodadas **quentes**; default 3), `--alvo=arquitetura|codigo|migracao|texto`.

## Ações obrigatórias

- [ ] **Triar por criticidade** — se cair em "Quando NÃO usar", não debater
- [ ] Declarar **critérios de sucesso** + **pacote de evidência neutro** antes da rodada 1
- [ ] Rodar o **Adversário** como subagente independente (refuta por padrão; pode exigir fonte faltante)
- [ ] Rodar o **Juiz** como subagente independente, com **veredito justificado** por objeção
- [ ] Classificar objeções (🔴/🟡/🔵/⚠️ lacuna de evidência) com **origem citada**
- [ ] Contar só **rodadas quentes** no teto; nomear o estado terminal: **CONVERGIDO** (2 secas **ou** o Juiz declara retornos decrescentes sem 🔴/⚠️ aberto), **ESGOTADO** (teto com 🔴 aberto) ou **BLOQUEADO** (⚠️ retém fato do dev)
- [ ] **Persistir a Ata** em `memoria/atas/{data}-{slug}.md`; ponteiro em `decisoes.md` se for decisão de tela/arquitetura
- [ ] Encaminhar objeções recorrentes ao **laço de aprendizado** (`historico-aprimoramento.md`)

## Ações proibidas

- [ ] Não curar a evidência a favor da proposta (o Adversário recebe pacote neutro)
- [ ] Não deixar um único subagente jogar os três papéis (autovalidação)
- [ ] Não rebaixar a 🔵 uma objeção que ficou sem origem por **fonte retida** (isso é ⚠️ e bloqueia)
- [ ] Não rotular **ESGOTADO** como aprovado/convergido
- [ ] Não inventar objeção para cota; não deixar 🔵 bloquear
- [ ] Não reapresentar objeção improcedente sem evidência nova **ou** argumento mais forte

## Arquivos que atualiza

- `memoria/atas/{data}-{slug}.md` (a Ata — sempre)
- `memoria/decisoes.md` (ponteiro, quando fecha decisão de tela/arquitetura)
- `historico-aprimoramento.md` (quando um tipo de objeção recorre e vira regra)

## Checklist de conclusão

- [ ] Triado por criticidade
- [ ] Adversário e Juiz rodaram isolados; vereditos justificados
- [ ] Resultado nomeado: CONVERGIDO (2 secas) · ESGOTADO (teto) · BLOQUEADO (⚠️ fato do dev)
- [ ] Ata persistida em `memoria/atas/`

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% o Debate Adversário sobre [ALVO]. Resultado: [CONVERGIDO / CONVERGIDO COM RESSALVAS / ESGOTADO — 🔴 em aberto / BLOQUEADO — ⚠️ aguarda fato do dev], em [N] rodada(s) quente(s). Ata: `memoria/atas/[arquivo]`."

## Próximo passo

Aplicar a proposta convergida (implementar, comitar, ou registrar a decisão). Se ESGOTADO ou com 🔴/⚠️ que exija trade-off, decidir com o dev antes de avançar.
