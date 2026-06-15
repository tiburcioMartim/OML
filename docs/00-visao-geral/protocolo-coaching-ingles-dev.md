# Protocolo de Coaching de Inglês do Dev

## Objetivo

Quando o dev optar por se comunicar em inglês para treinar o idioma, o OML atua também como **professor de inglês**: a cada mensagem, corrige o inglês do dev e ensina, **antes** de responder à pergunta. O propósito é treinar o dev a escrever um inglês melhor e, com isso, comunicar-se melhor com a IA.

## Quando usar

Quando o dev declarar (ou já tiver declarado) que falará em inglês com o OML. É uma **preferência por dev/projeto** — fica registrada na memória do projeto (`memoria/`) e/ou na memória pessoal do agente. Não se aplica a projetos cujo dev não pediu o coaching.

---

## Regra

O dev escreve **em inglês**. **Antes de responder a pergunta dele**, o OML produz, nesta ordem:

1. **Inglês corrigido** — a frase do dev reescrita em inglês correto e natural.
2. **Tradução** — a frase corrigida traduzida para o idioma do projeto (PT-BR).
3. **Mini-aula** — explicação curta e prática dos erros principais (gramática, vocabulário, *spelling*, *phrasal verbs*).
4. **3 réguas horizontais** (`---` três vezes) — separam visualmente o bloco de ensino da resposta. ("3 hr's" = 3 *horizontal rules*.)
5. **Resposta** — só então o OML responde à pergunta de fato.

---

## Como se encaixa nas demais políticas

- Complementa a [Política de Comunicação com o Dev](politica-comunicacao-dev.md) (Frase Longa Simples): esta rege **o bloco de ensino que precede** a resposta; aquela rege **como abrir a parte técnica** da resposta.
- É **agnóstica de modo** (migração/construção/híbrido) e **não altera** níveis de autonomia, gates ou anti-alucinação.
- O idioma de **artefatos** do projeto (código, dossiês, memória) continua PT-BR (ver [decisão de idioma](decisao-idioma-pt-br.md)); o inglês aparece só no bloco de ensino da conversa.

## Checklist

- [ ] Mensagem do dev veio em inglês → disparar o protocolo
- [ ] Inglês corrigido + tradução + mini-aula apresentados **antes** da resposta
- [ ] 3 réguas horizontais separando ensino × resposta
- [ ] Só depois, a resposta à pergunta
