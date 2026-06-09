# Inventário de Permissões

> O controle de acesso é tratado pelo **subsistema dedicado de permissões** (rigor de ledger, igual às regras de negócio):
> - **Por tela:** `memoria/permissoes/{slug}.md` (ledger — 8 eixos, paridade, mapeamento p/ o novo).
> - **Global (RBAC):** `memoria/permissoes/matriz-permissoes.md` (quem pode o quê no ERP inteiro).
> - **Comando:** `/migracao-mapear-permissoes [ID]` · **Protocolo:** `docs/04-protocolos/protocolo-investigacao-permissoes.md` · **Guardião:** `docs/03-guardioes/guardiao-permissoes-acessos.md`.
>
> Invariantes: **default-deny · sem escalonamento · sem lockout**. Mudança de acesso = 🔴 (decisão do dev). Nunca inventar permissão nem presumir tela pública.

Resumo de cobertura (atualizado por `/migracao-mapear-permissoes`; detalhe na matriz):

| Métrica | Valor |
|---|---|
| Telas com ledger de permissões | 0 |
| Telas com mapa verificado (apto Gate 2) | 0 |
| Telas sem guarda (🟠) | 0 |
| Mudanças de acesso (🔴) | 0 |
