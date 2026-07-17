# Atas de Debate Adversário

Esta pasta guarda as **Atas** dos debates do `/adversario` — o rastro durável de toda decisão que passou pelo advogado do diabo. Um arquivo por debate: `{AAAA-MM-DD}-{slug}.md`.

- **Gerada por:** `/adversario` (ver `docs/01-comandos/adversario.md` e `docs/04-protocolos/protocolo-adversario.md`).
- **Sempre persistida:** inclusive nos debates genéricos (código, texto, migração) — não só decisões de arquitetura. É a rastreabilidade da Regra-Mãe #21 e a matéria-prima do laço de aprendizado.
- **Append-only:** a Ata registra o que aconteceu; não se reescreve o passado. Um novo debate = uma nova Ata.
- **Ponteiro:** quando o debate fecha uma decisão de tela/arquitetura, gravar uma linha em `../decisoes.md` com a data e o link para a Ata.

## Cada Ata contém

- **Alvo** e **critérios de sucesso** declarados.
- **Por rodada:** objeções (severidade 🔴/🟡/🔵/⚠️ + origem citada), veredito **justificado** do Juiz, e o que mudou na proposta.
- **Veredito final:** **CONVERGIDO** (2 secas consecutivas) ou **ESGOTADO** (teto de rodadas quentes, com 🔴/⚠️ pendentes marcados).
- **Proposta convergida** (ou melhor estado, se ESGOTADO).
- **Tipos de objeção** para o laço de aprendizado (validação, permissão, LGPD, custo, …).

## Laço de aprendizado

Quando um **tipo de objeção recorre** (≥ 3 debates), promovê-lo a item de checklist/guardião e registrar em `historico-aprimoramento.md` — para que futuras propostas já o antecipem. Ver `docs/03-guardioes/guardiao-evolucao-agente.md`.
