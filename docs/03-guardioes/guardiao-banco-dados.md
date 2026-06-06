# Guardião do Banco de Dados

## Missão
Preservar o banco legado. Mapear tabelas, colunas, chaves, relacionamentos, queries, escritas, exclusões e inconsistências. Garantir que o sistema novo **se adapte** ao banco — e não o contrário.

## Regra-mãe
O sistema novo deve se adaptar ao banco legado. O banco legado **não é alterado** sem autorização — **mas a régua é sobre QUEM dispara a escrita e se o dado é real ou de teste, não sobre o verbo SQL.** Confundir "CRUD legítimo do usuário" com "escrita destrutiva do agente" faz o OML hesitar ou se auto-bloquear ao migrar telas de gestão cujo propósito é justamente o usuário editar/excluir.

---

## Os 3 sujeitos da escrita (a régua real)

A pergunta nunca é "o SQL apaga/altera dado?". É **quem dispara** e **sobre qual dado**:

### 1. CRUD do USUÁRIO na UI migrada — ✅ permitido e esperado
Editar/Excluir/Salvar disparados pelo **usuário final** na tela migrada, com confirmação, **fiéis ao legado**. É o propósito do sistema: o usuário faz a gestão dos dados dele.
- O OML **não hesita** em implementar Editar/Excluir só porque "mexe no banco".
- Mantém a confirmação e as validações do legado (ver `guardiao-regras-negocio.md`).
- Permissões e auditoria seguem `guardiao-permissoes-acessos.md` e `guardiao-auditoria.md`.

### 2. Escrita destrutiva do AGENTE — ⛔ proibida → sinalizar ao dev
Escrita/alteração/exclusão **automática, silenciosa ou como side-effect oculto** do agente sobre **dado real**.
- Nunca executar. **Sinalizar ao dev** e registrar em `memoria/pendencias.md`.
- Inclui "limpezas", "correções de dados", migrações de dados em massa, backfills — tudo é decisão do dev.

### 3. Dado FAKE de teste controlado — ✅ autorizado (escopo controlado)
Dado sintético criado pelo agente para **validar um fluxo end-to-end**, **removido em seguida**.
- Valida validação/cálculo/fluxo sem esperar o Gate 2, em escopo controlado.
- **Nunca** sobre dado de produção. Segue `guardiao-dados-teste.md`.

> Resumo: **usuário escrevendo dado real = ok · agente escrevendo dado real = proibido · agente escrevendo dado fake descartável = ok.**

---

## DDL (mudança de estrutura)
- Só **CREATE aditivo e semântico** (nova tabela/coluna que não quebra o legado).
- `down()` **no-op** em tabela legada (nunca dropar/alterar estrutura legada no rollback).
- Qualquer DDL não-aditivo sobre estrutura legada → **decisão do dev** em `memoria/decisoes.md`.

## Toda mudança vs. legado é registrada
Qualquer divergência de comportamento ou estrutura em relação ao legado vai para `memoria/decisoes.md` — nunca é silenciosa.

---

## Modo: greenfield / híbrido
Governado por `docs/00-visao-geral/politica-modos-projeto.md`. Em construção não há banco legado a preservar: a régua dos 3 sujeitos continua valendo para o **agente × dado real do ambiente** (sujeito 2 e 3 idênticos; sujeito 1 = CRUD do usuário na feature nova). A modelagem segue `guardiao-modelagem-dados.md`.

## Ações proibidas
- [ ] Hesitar/auto-bloquear ao implementar CRUD legítimo disparado pelo usuário
- [ ] Escrever/alterar/excluir dado real de forma automática ou silenciosa (sujeito 2)
- [ ] Deixar dado fake de teste no banco após validar (sujeito 3 sem limpeza)
- [ ] DDL destrutivo sobre estrutura legada sem decisão registrada
- [ ] Mudar comportamento vs. legado sem registro em `memoria/decisoes.md`
