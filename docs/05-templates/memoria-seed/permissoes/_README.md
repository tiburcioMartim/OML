# memoria/permissoes/ — Ledger de Controle de Acesso

Fonte da verdade do **controle de acesso** do legado, por tela/unidade. Espelha o rigor de `memoria/regras-negocio/` — permissão é cidadão de 1ª classe (segurança + LGPD).

- **Um arquivo por tela:** `{slug}.md` (formato `docs/05-templates/ledger-permissoes.template.md`).
- **Matriz global:** `matriz-permissoes.md` (RBAC agregado — `docs/05-templates/matriz-permissoes.template.md`).
- **Gerado por:** `/migracao-mapear-permissoes [ID]` (Fase 05).
- **Protocolo:** `docs/04-protocolos/protocolo-investigacao-permissoes.md`.
- **Guardião:** `docs/03-guardioes/guardiao-permissoes-acessos.md`.

## Invariantes (nunca violar)

1. **Default-deny** — ausência de concessão = negado, no legado **e** no novo.
2. **Sem escalonamento** — não conceder acesso que o sujeito não tinha.
3. **Sem lockout** — não remover acesso que o sujeito tinha.

Qualquer **mudança de acesso** vs. legado é **🔴 Crítico** → decisão do dev em `memoria/decisoes.md`. Nunca inventar permissão nem presumir tela pública (sem evidência → 🟡 Hipótese).

## Gate

`/migracao-homologar` (Gate 2) **aborta** se o ledger da tela não existir ou a **paridade de acesso** não estiver verificada (ver `docs/04-protocolos/protocolo-gates-validacao.md`).
