# /migracao-sincronizar

## Objetivo

Varrer o código real do projeto (legado e novo) e sincronizar **todos** os arquivos de `memoria/` com o estado de fato, para que o OML nunca opere com memória defasada.

## Quando usar

Automaticamente dentro de `/migracao-ativar`, **antes de qualquer trabalho**. Também pode ser rodado a qualquer momento para reconciliar memória e código.

## Entradas esperadas

Nenhuma. Detecta os diretórios pelo perfil do projeto (`diretorio_legado`, `diretorio_novo`).

## Ações obrigatórias

- [ ] Varrer o projeto **novo**: `app/Http/Controllers`, `app/Models`, Pages Inertia (`resources/js/Pages`), Components (`resources/js/Components`), rotas (`routes/`) e o menu (`menu.js`/equivalente)
- [ ] Varrer o **legado** o suficiente para confirmar telas/origem
- [ ] Comparar o encontrado com `memoria/backlog-telas.yaml` (esperado × real)
- [ ] Atualizar `memoria/historico-migracao.md` com as telas **já implementadas** detectadas no código (rota + página existentes → migrada/homologada conforme marcadores)
- [ ] Reconciliar os demais arquivos de `memoria/`: `inventario-componentes.md` (componentes reais), `inventario-permissoes.md`, `inventario-integracoes.md`, `inventario-banco.md`, `decisoes.md`, `pendencias.md`, `riscos.md`
- [ ] Rodar a varredura de Models (`docs/04-protocolos/protocolo-varredura-models.md`) → `memoria/scaffolds-suspeitos.md`
- [ ] Registrar carimbo de data e responsável da sincronização
- [ ] Se a divergência entre memória e código for grande, **avisar o dev** com lista breve antes de prosseguir

## Ações proibidas

- [ ] Não implementar código
- [ ] Não alterar banco
- [ ] Não apagar registros de memória sem evidência — divergência vira pendência, não exclusão silenciosa

## Arquivos que atualiza

- `memoria/historico-migracao.md`
- `memoria/backlog-telas.yaml`
- `memoria/inventario-componentes.md`, `inventario-permissoes.md`, `inventario-integracoes.md`, `inventario-banco.md`
- `memoria/scaffolds-suspeitos.md`
- `memoria/pendencias.md` (divergências e órfãos)

## Checklist de conclusão

- [ ] Código novo e legado varridos
- [ ] `historico-migracao.md` reflete as telas reais
- [ ] Inventários reconciliados
- [ ] Scaffolds suspeitos atualizados
- [ ] Divergências registradas / dev avisado

## Frase obrigatória de encerramento

"Memória sincronizada com o código em [DATA]. Divergências: [N] (registradas em pendências)."

## Próximo passo

`/migracao-status` ou retomar o fluxo na fase indicada.
