# memoria/seguranca/ — Ledger de Postura de Segurança

Fonte da verdade da **segurança** do sistema, por tela/endpoint. Espelha o rigor de `memoria/permissoes/` e `memoria/regras-negocio/` — segurança é cidadão de 1ª classe.

- **Um arquivo por tela:** `{slug}.md` (formato `docs/05-templates/ledger-seguranca.template.md`).
- **Matriz global:** `matriz-seguranca.md` (`docs/05-templates/matriz-seguranca.template.md`).
- **Gerado por:** `/migracao-mapear-seguranca [ID]` (Fases 05 e 08).
- **Protocolo:** `docs/04-protocolos/protocolo-investigacao-seguranca.md`.
- **Guardião:** `docs/03-guardioes/guardiao-seguranca.md`.

## Ancoragem (o agente cita, não acha)

OWASP Top 10 **2025** · OWASP API Security Top 10 **2023** · OWASP ASVS **5.0** (L2 piso, **L3** dado de saúde) · CWE Top 25 **2025**. Catálogo completo no protocolo.

## Invariantes (nunca violar)

1. **Não rebaixar** — nunca enfraquecer um controle que o legado tem (Regra-Mãe #7).
2. **Secure-by-design** — greenfield nasce com authn/authz + validação server-side + threat model.
3. **Validação no servidor** — sempre.
4. **Fail-safe** — erro/exceção nega, não libera.
5. **Segredo/dado sensível** — nunca no ledger nem em log.

Rebaixamento vs. legado, exposição de dado de saúde, ou risco à segurança do paciente = **🔴 Crítico** → decisão do dev em `memoria/decisoes.md`. Nunca inventar vulnerabilidade nem "confirmar" exploit sem evidência (sem ambiente vivo → 🟡).

## Gate

`/migracao-homologar` (Gate 2) **aborta** em tela de **alta criticidade** (dado de saúde, cálculo clínico/financeiro) se o ledger não existir ou o veredito de segurança não estiver verificado (ver `docs/04-protocolos/protocolo-gates-validacao.md`).

## Adversário

O threat model / ledger é alvo natural do `/adversario` (`docs/04-protocolos/protocolo-adversario.md`) — recomendado estressá-lo em alta criticidade.
