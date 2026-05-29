# Guardião de Convivência Legado/Novo

## Missão
Definir fonte oficial por módulo, evitar edição duplicada, sincronização, liberar por perfil/setor, desativar tela legada.

## Regra
Enquanto legado e novo coexistirem, deve haver regra explícita sobre qual sistema manda em cada processo.

## Convivência multi-app (2+ apps que conversam por API)

Quando o projeto novo tem 2+ apps (admin + portal, mobile + web, microserviços), a mesma regra implementada em dois lugares diverge. A convenção mora no ledger de regras (`docs/03-guardioes/guardiao-regras-negocio.md` → "Convivência multi-app" e `memoria/regras-negocio/_README.md`):

- A regra **mora no app que escreve** (dono / fonte da verdade); apps que só **leem** referenciam, **não duplicam**.
- **Divergência de comportamento entre apps é proibida** → pendência prioritária em `memoria/pendencias.md`.
