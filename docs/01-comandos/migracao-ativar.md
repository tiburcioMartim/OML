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
  - **Se não houver legado irmão, não tratar como erro** — é candidato a Construção (Cenário 4 da política de workspace)
- [ ] **Detectar/confirmar o modo do projeto** (ver `docs/00-visao-geral/politica-modos-projeto.md`)
  - Se o perfil já tiver `modo`, usá-lo
  - Se não houver legado e não houver perfil, perguntar: construção, migração ou híbrido
- [ ] Carregar regras permanentes do OML
- [ ] Identificar perfil do projeto (se existir)
- [ ] Verificar documentos existentes na pasta `docs/`
- [ ] Verificar estado da memória em `memoria/`
- [ ] **Sincronizar a memória com o código real, ANTES de qualquer trabalho** (ver `docs/04-protocolos/protocolo-sincronizacao-memoria.md`): varrer Controllers, Models, Pages, Components e `menu.js` do projeto novo (e do legado, se houver) e reconciliar `memoria/` — incl. `historico-migracao.md`. Nunca operar com memória defasada.
- [ ] **Varrer Models e validar `$table` contra `Schema::hasTable()`** (ver `docs/04-protocolos/protocolo-varredura-models.md`): emitir `memoria/scaffolds-suspeitos.md`; Models órfãos viram pendência prioritária antes de qualquer tela.
- [ ] Mostrar status geral do projeto (incl. divergências de memória e scaffolds suspeitos)
- [ ] Indicar o próximo passo recomendado

## Ações proibidas

- [ ] Não implementar código
- [ ] Não alterar banco
- [ ] Não remover permissões
- [ ] Não criar arquivos sem necessidade

## Arquivos que atualiza

- `memoria/decisoes.md` (se houver correção de estrutura de workspace)

## Checklist de conclusão

- [ ] Estrutura de workspace validada (diretórios irmãos; legado opcional em construção)
- [ ] Modo do projeto detectado/confirmado (migração, construção ou híbrido)
- [ ] Regras carregadas
- [ ] Perfil identificado
- [ ] Memória sincronizada com o código real (sem dados defasados)
- [ ] Models varridos e `scaffolds-suspeitos.md` atualizado
- [ ] Status exibido
- [ ] Próximo passo indicado

## Frase obrigatória de encerramento

"OML ativado. Próximo passo: [comando sugerido]."

## Próximo passo

- Se projeto novo: `/migracao-configurar-projeto`
- Se projeto já configurado: `/migracao-status`
