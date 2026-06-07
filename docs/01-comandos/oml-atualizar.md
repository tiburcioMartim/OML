# /oml-atualizar

## Objetivo

Atualizar o **motor** do OML de um projeto que já está em uso, trazendo guardiões, fases, protocolos e correções novos **sem perder o estado do projeto** (memória, decisões, histórico, regras de negócio, backlog, gates, pendências).

## Quando usar

- Quando o OML evoluiu e você quer que um projeto antigo receba as melhorias.
- Periodicamente, para manter o agente em dia.
- **Não confundir** com [`/migracao-sincronizar`](migracao-sincronizar.md) (que reconcilia a memória com o código) nem com `/migracao-ativar` (que carrega o agente na sessão).

## Entradas esperadas

Nenhuma obrigatória. Flags opcionais:
- `--forcar` — reaplica o motor mesmo se a versão já for a última.
- `--seco` (dry-run) — só mostra o que mudaria (versões, CHANGELOG, novidades de memória), sem escrever nada.

## Ações obrigatórias

Segue integralmente o [`protocolo-atualizacao-oml.md`](../04-protocolos/protocolo-atualizacao-oml.md):

- [ ] Comparar `VERSION` local × remota (`git fetch` + `git show origin/<branch>:VERSION`) e mostrar o delta do CHANGELOG
- [ ] **Backup de `memoria/`** antes de qualquer escrita
- [ ] Se `memoria/` ainda for rastreada (`git ls-files memoria` não-vazio): `git rm -r --cached memoria`, garantir `memoria/` no `.gitignore` e commitar — **antes** do pull
- [ ] Trazer o motor (`git pull` ou Modo cópia) **sem tocar no estado**
- [ ] **seed-if-missing** a partir de `docs/05-templates/memoria-seed/` (cria só o que falta)
- [ ] Aplicar migrações estruturais aditivas de `oml.manifesto.json`
- [ ] Registrar em `memoria/decisoes.md` e `memoria/historico-migracao.md`; confirmar `VERSION` novo
- [ ] Emitir relatório final com **ações humanas** pendentes

## Ações proibidas

- [ ] **Nunca** sobrescrever ou apagar arquivo de `memoria/` (estado é sagrado)
- [ ] **Nunca** dar `pull` antes de destravar `memoria/` quando ela ainda está rastreada
- [ ] **Nunca** prosseguir sem backup
- [ ] Não sobrescrever `.claude/settings.json` (é estado/local)
- [ ] Não inventar datas — vêm do git ou do dev

## Arquivos que atualiza

- Todo o **motor** (`docs/`, docs de raiz, `VERSION`, `oml.manifesto.json`, `.gitignore`) — via pull/cópia
- `memoria/` **apenas** para: criar estrutura faltante (seed) e acrescentar log em `decisoes.md` e `historico-migracao.md`
- `.gitignore` (se faltava `memoria/`)

## Checklist de conclusão

- [ ] Backup de `memoria/` criado
- [ ] `memoria/` destravada (se preciso) e commitada antes do pull
- [ ] Motor atualizado sem tocar no estado
- [ ] seed-if-missing aplicado (só criou o que faltava)
- [ ] Atualização registrada; `VERSION` novo confirmado
- [ ] Relatório final entregue

## Exemplo

```
Dev: /oml-atualizar
OML: "Versão local 1.0.0 → remota 1.3.0. Novidades: [resumo do CHANGELOG].
      Backup da memória em memoria/.backup-2026-06-07-1530. Prosseguir? (sim/não)"
Dev: "sim"
OML: (destrava memoria se preciso → pull → seed-if-missing → registra)
OML: "OML atualizado: 1.0.0 → 1.3.0. Estado preservado. Ações humanas: 1
      (limpar caminhos absolutos de .claude/settings.json)."
```

## Frase obrigatória de encerramento

"OML atualizado: [versão antiga] → [versão nova]. Estado preservado (backup em `memoria/.backup-...`). Ações humanas: [N]."

## Próximo passo

`/migracao-ativar` (recarrega o agente já atualizado e roda o seed-if-missing/sincronização) e, em seguida, `/migracao-status`.
