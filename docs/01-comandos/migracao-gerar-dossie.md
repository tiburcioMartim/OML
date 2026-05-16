# /migracao-gerar-dossie

## Objetivo

Gerar o dossiê funcional completo de uma tela, cobrindo todos os 21 domínios obrigatórios.

## Quando usar

Após `/migracao-analisar-tela`, para documentar completamente a tela.

## Entradas esperadas

ID da tela. Exemplo: `/migracao-gerar-dossie TELA-0001`

## Ações obrigatórias

- [ ] Preencher todos os 21 blocos do dossiê (ver template)
- [ ] Identificação, objetivo funcional, fluxo operacional
- [ ] Campos, ações, banco de dados
- [ ] Regras de negócio com origem e evidência
- [ ] Permissões por ação
- [ ] Integrações com falhas possíveis
- [ ] LGPD, acessibilidade, design
- [ ] Responsividade, feedbacks, auditoria
- [ ] Observabilidade, performance
- [ ] Disaster recovery, continuidade operacional
- [ ] Testes planejados
- [ ] Riscos e dúvidas
- [ ] Marcar campos incertos como A INVESTIGAR

## Ações proibidas

- [ ] Não inventar regras de negócio
- [ ] Não implementar código
- [ ] Não preencher com suposições sem marcar

## Arquivos que atualiza

- Cria arquivo de dossiê na pasta do módulo
- `memoria/backlog-telas.yaml` (status → `dossie_concluido`)

## Checklist de conclusão

- [ ] 21 blocos preenchidos ou justificados
- [ ] Regras de negócio com origem
- [ ] Incertezas marcadas
- [ ] Dossiê salvo

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% o Dossiê Funcional da tela [NOME]."

## Próximo passo

`/migracao-propor-interface [ID]`
