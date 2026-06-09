# /migracao-homologar

## Objetivo

Registrar a homologação da tela pelo usuário final.

## Quando usar

Após a paridade ser aprovada e o usuário testar a tela nova.

## Validação obrigatória de pré-requisitos (Gate duro 🔴 — humano)

> ⛔ **Paridade de acesso (permissões).** Se o ledger `memoria/permissoes/{slug}.md` **não existir** ou o **mapa de acesso não estiver verificado** (Definição de Pronto do `docs/04-protocolos/protocolo-investigacao-permissoes.md` não cumprida), **ABORTAR**:
> "Gate 2 bloqueado: a paridade de permissões da tela [NOME] não está verificada. Rode `/migracao-mapear-permissoes [ID]` e confirme: default-deny preservado, mesmos sujeitos/escopos do legado, sem escalonamento e sem lockout. Mudança de acesso intencional exige decisão do dev em `decisoes.md`."

Permissão é **segurança + LGPD** — não se homologa tela com controle de acesso por verificar. Ver `docs/03-guardioes/guardiao-permissoes-acessos.md` e `docs/04-protocolos/protocolo-gates-validacao.md`.

## Entradas esperadas

ID da tela e confirmação do usuário.

## Ações obrigatórias

- [ ] **Confirmar a paridade de acesso** (gate acima): ledger de permissões verificado, sem 🔴 de mudança de acesso pendente de decisão
- [ ] Solicitar que o usuário teste a tela
- [ ] Registrar feedback do usuário
- [ ] Registrar pendências apontadas
- [ ] Registrar aceite ou rejeição
- [ ] Capturar evidências (prints da tela nova)

## Ações proibidas

- [ ] Não auto-homologar sem teste do usuário

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status → `homologada`)
- `memoria/historico-migracao.md`

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a Homologação da tela [NOME]."

## Próximo passo

Rollout controlado ou `/migracao-proxima-tela`
