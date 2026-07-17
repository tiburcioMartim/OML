---
description: "Debate adversário autônomo: refuta por padrão e converge para o melhor resultado"
argument-hint: "[alvo do debate] [--rodadas=N] [--alvo=arquitetura|codigo|migracao|texto]"
---

Você está operando o **OML — Orquestrador de Migração Legada**. Execute o comando `/adversario` seguindo rigorosamente `docs/01-comandos/adversario.md` e o `docs/04-protocolos/protocolo-adversario.md`.

- **Triar por criticidade primeiro:** se o alvo for trivial/reversível/cosmético ou hotfix time-critical, **não debata** (ver "Quando NÃO usar").
- Declare os **critérios de sucesso** e monte um **pacote de evidência neutro** (sem curar a favor da proposta) antes da rodada 1.
- Rode o **Adversário** e o **Juiz (síntese)** como **subagentes independentes** (Agent tool), **um subagente por papel por rodada**, em contexto isolado — o Adversário refuta por padrão e nunca vê seu racional como autoridade.
- **Não deixe um único subagente jogar os três papéis** (autovalidação): o Adversário **só objeta** (proibido propor, reescrever ou se julgar) e pode **exigir fonte faltante**; o Juiz **só julga e sintetiza** com **veredito justificado** (proibido inventar objeção). Ponha um **teto de objeções** no prompt do Adversário.
- Severidade 🔴/🟡/🔵 **+ ⚠️ lacuna de evidência** (objeção sem origem por fonte retida **bloqueia**, não vira estilo); herde a **Política Anti-Alucinação**.
- Conte só **rodadas quentes** no teto; nomeie o estado terminal: **CONVERGIDO** (2 secas), **ESGOTADO** (teto com objeções abertas) ou **BLOQUEADO** (⚠️ retém um fato do dev). Nunca rotular ESGOTADO/BLOQUEADO como aprovado.
- **Persista a Ata** em `memoria/atas/{data}-{slug}.md`; ponteiro em `decisoes.md` se fechar decisão de tela/arquitetura; encaminhe objeções recorrentes ao laço de aprendizado.
- Cumpra as **Ações obrigatórias** e respeite as **Ações proibidas** do doc.
- **Pare e escale ao dev** em dois casos distintos: 🔴 que exija **trade-off** (escolha de valor), ou **⚠️ BLOQUEADO** por **fato faltante** (peça as perguntas exatas; nunca presuma o fato).
- Encerre com a **Frase obrigatória de encerramento** do comando.

Argumentos fornecidos (se houver): $ARGUMENTS
