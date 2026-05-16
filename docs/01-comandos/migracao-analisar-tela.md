# /migracao-analisar-tela

## Objetivo

Investigar uma tela específica do sistema legado em profundidade.

## Quando usar

Na Fase 05, para cada tela do backlog que será migrada.

## Entradas esperadas

ID da tela ou URL legado. Exemplo: `/migracao-analisar-tela TELA-0001`

## Ações obrigatórias

- [ ] Classificar criticidade (🟢 Baixa, 🟡 Média, 🔴 Alta)
- [ ] Definir fluxo (Expresso, Padrão ou Estrito)
- [ ] Identificar objetivo funcional da tela
- [ ] Identificar campos exibidos e editáveis
- [ ] Identificar botões e ações
- [ ] Identificar filtros e listagens
- [ ] Identificar modais e fluxos alternativos
- [ ] Identificar tabelas do banco envolvidas
- [ ] Identificar permissões necessárias
- [ ] Identificar integrações
- [ ] Identificar regras de negócio
- [ ] Identificar dados sensíveis (LGPD)
- [ ] Registrar dúvidas e incertezas
- [ ] Atualizar status da tela no backlog

## Ações proibidas

- [ ] Não implementar nada
- [ ] Não alterar banco
- [ ] Não inventar regras que não foram encontradas

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status da tela)

## Checklist de conclusão

- [ ] Criticidade classificada
- [ ] Fluxo definido
- [ ] Análise inicial concluída
- [ ] Dúvidas registradas

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a análise inicial da tela [NOME]. Criticidade: [NÍVEL]."

## Próximo passo

`/migracao-gerar-dossie [ID]`
