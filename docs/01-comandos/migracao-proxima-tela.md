# /migracao-proxima-tela

## Objetivo

Avançar para a próxima tela do backlog, seguindo a prioridade definida.

## Quando usar

Após concluir uma tela (homologada ou migrada).

## Entradas esperadas

Nenhuma. O OML seleciona automaticamente com base no backlog.

## Ações obrigatórias

- [ ] Ler `memoria/backlog-telas.yaml`
- [ ] Identificar próxima tela com status `nao_iniciada`
- [ ] Considerar prioridade e criticidade
- [ ] Iniciar análise da tela selecionada

## Ações proibidas

- [ ] Não pular telas bloqueadas sem justificativa

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status da próxima tela → `em_investigacao`)

## Frase obrigatória de encerramento

"Próxima tela selecionada: [NOME] ([ID]). Iniciando investigação."

## Próximo passo

`/migracao-analisar-tela [ID]`
