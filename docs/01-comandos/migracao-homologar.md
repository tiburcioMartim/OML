# /migracao-homologar

## Objetivo

Registrar a homologação da tela pelo usuário final.

## Quando usar

Após a paridade ser aprovada e o usuário testar a tela nova.

## Entradas esperadas

ID da tela e confirmação do usuário.

## Ações obrigatórias

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
