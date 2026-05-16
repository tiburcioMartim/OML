# /migracao-ativar

## Objetivo

Iniciar o OML no projeto e carregar todas as regras, guardiões e políticas.

## Quando usar

No início da migração ou quando quiser retomar o fluxo principal.

## Entradas esperadas

Nenhuma. O comando detecta automaticamente o estado do projeto.

## Ações obrigatórias

- [ ] Carregar regras permanentes do OML
- [ ] Identificar perfil do projeto (se existir)
- [ ] Verificar documentos existentes na pasta `docs/`
- [ ] Verificar estado da memória em `memoria/`
- [ ] Mostrar status geral do projeto
- [ ] Indicar o próximo passo recomendado

## Ações proibidas

- [ ] Não implementar código
- [ ] Não alterar banco
- [ ] Não remover permissões
- [ ] Não criar arquivos sem necessidade

## Arquivos que atualiza

Nenhum. Apenas leitura.

## Checklist de conclusão

- [ ] Regras carregadas
- [ ] Perfil identificado
- [ ] Status exibido
- [ ] Próximo passo indicado

## Frase obrigatória de encerramento

"OML ativado. Próximo passo: [comando sugerido]."

## Próximo passo

- Se projeto novo: `/migracao-configurar-projeto`
- Se projeto já configurado: `/migracao-status`
