# /migracao-ativar

## Objetivo

Iniciar o OML no projeto e carregar todas as regras, guardiões e políticas.

## Quando usar

No início da migração ou quando quiser retomar o fluxo principal.

## Entradas esperadas

Nenhuma. O comando detecta automaticamente o estado do projeto.

## Ações obrigatórias

- [ ] **Validar estrutura de workspace** (ver `docs/00-visao-geral/politica-estrutura-workspace.md`)
  - Verificar se o OML é irmão do legado (não está aninhado dentro dele)
  - Se estiver no local errado, informar o dev e propor a correção (mover para o nível correto)
  - Se o diretório do novo sistema já existir, verificar se também é irmão
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

- `memoria/decisoes.md` (se houver correção de estrutura de workspace)

## Checklist de conclusão

- [ ] Estrutura de workspace validada (diretórios irmãos)
- [ ] Regras carregadas
- [ ] Perfil identificado
- [ ] Status exibido
- [ ] Próximo passo indicado

## Frase obrigatória de encerramento

"OML ativado. Próximo passo: [comando sugerido]."

## Próximo passo

- Se projeto novo: `/migracao-configurar-projeto`
- Se projeto já configurado: `/migracao-status`
