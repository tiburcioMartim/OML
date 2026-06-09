# Protocolo de Revisão de Paridade

Comparar **campos, ações, regras, permissões, cálculos, integrações e relatórios** entre legado e novo. Classificar divergências (✅ paridade · 🟡 divergência menor · 🔴 divergência crítica) e encaminhar.

## Permissões — dimensão obrigatória e dura

A paridade de **controle de acesso** é verificada contra o ledger `memoria/permissoes/{slug}.md` (ver `docs/04-protocolos/protocolo-investigacao-permissoes.md` e `docs/03-guardioes/guardiao-permissoes-acessos.md`). Para a tela passar, confirmar **com evidência**:

- [ ] **Default-deny preservado** — o que o legado negava por omissão, o novo nega por omissão.
- [ ] **Mesmos sujeitos** — quem tinha acesso no legado tem no novo (sem **lockout**); quem não tinha continua sem (sem **escalonamento**).
- [ ] **Escopos íntegros** — setor / unidade (multi-tenant, **sem vazamento entre unidades**) / nível replicados.
- [ ] **Ações/CRUD** condicionadas como no legado (botão some/desabilita via `usePermissions`).
- [ ] **Negação correta** — `flash.error` claro, **nunca 404 cru**; trilha de auditoria mantida.

Qualquer divergência de acesso vs. legado é **🔴** → decisão do dev em `memoria/decisoes.md`. Sem o ledger verificado, a tela **não passa no Gate 2** (`/migracao-homologar` aborta — `docs/04-protocolos/protocolo-gates-validacao.md`).
