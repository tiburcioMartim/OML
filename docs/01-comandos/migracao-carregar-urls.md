# /migracao-carregar-urls

## Objetivo

Adicionar manualmente URLs ao backlog de telas.

## Quando usar

Quando o responsável quiser informar URLs que conhece, complementando a descoberta automática.

## Entradas esperadas

Lista de URLs do sistema legado.

## Ações obrigatórias

- [ ] Receber lista de URLs
- [ ] Validar formato das URLs
- [ ] Verificar duplicidade com URLs já existentes no backlog
- [ ] Adicionar ao `memoria/backlog-telas.yaml`
- [ ] Marcar status como `nao_iniciada`
- [ ] Marcar criticidade como `a_investigar`

## Ações proibidas

- [ ] Não implementar nada
- [ ] Não alterar banco
- [ ] Não considerar URL como autorização de implementação

## Arquivos que atualiza

- `memoria/backlog-telas.yaml`

## Checklist de conclusão

- [ ] URLs adicionadas ao backlog
- [ ] Duplicidades verificadas
- [ ] Status e criticidade definidos

## Frase obrigatória de encerramento

"URLs carregadas com sucesso. Total de telas no backlog: [N]."

## Próximo passo

`/migracao-gerar-mapa-hierarquico` ou `/migracao-analisar-tela [ID]`
