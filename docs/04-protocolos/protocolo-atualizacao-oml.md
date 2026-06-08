# Protocolo de Atualização do OML

## Por quê

O motor do OML evolui rápido. Projetos que clonaram o OML há semanas ficam sem os guardiões, protocolos e correções novos. Este protocolo traz o motor novo para um projeto antigo **sem encostar no estado dele** (memória, decisões, histórico, regras de negócio). Ver a base conceitual em [`politica-versionamento-atualizacao.md`](../00-visao-geral/politica-versionamento-atualizacao.md).

> **Atualizar ≠ Sincronizar.** `/oml-atualizar` troca o **motor** (o agente). [`/migracao-sincronizar`](../01-comandos/migracao-sincronizar.md) reconcilia a **memória** com o código real. São coisas diferentes e independentes.

## Pré-requisitos

- O OML do projeto é um **clone git** com `origin` apontando para o repositório oficial. Confirmar com `git -C <oml> remote -v`.
- Se não for um clone git (foi copiado à mão), usar o **Modo cópia** (fim deste documento).

---

## O algoritmo (não-destrutivo por construção)

> Todos os comandos rodam **dentro do diretório do OML** do projeto (`diretorio_oml`), nunca no legado nem no novo sistema.

### Passo 0 — Diagnóstico

1. Ler a versão local em `VERSION` (se não existir, tratar como pré-1.0.0 / "legado sem versão").
2. `git fetch origin` e ler a versão remota: `git show origin/<branch>:VERSION`.
3. Se iguais → informar "já está na última versão (X.Y.Z)" e **encerrar** (salvo `--forcar`).
4. Mostrar o delta do [`CHANGELOG.md`](../../CHANGELOG.md) entre as duas versões.
5. Detectar **se `memoria/` ainda é rastreada**: `git ls-files memoria`. Saída não-vazia = projeto pré-separação (precisa destravar).

### Passo 1 — Backup (sempre, antes de qualquer escrita)

1. Copiar `memoria/` para `memoria/.backup-<AAAA-MM-DD-HHMM>/` (a data vem do `git log -1 --format=%cd` ou é informada pelo dev — **não** inventar timestamp).
2. Se houver alterações não commitadas no motor, registrá-las (`git stash` rotulado, ou avisar o dev).
3. Confirmar ao dev: "Backup da memória em `memoria/.backup-...`. Posso prosseguir? (sim/não)".

### Passo 2 — Destravar `memoria/` (só se ainda rastreada)

Executar **antes** do pull, para que o pull nunca toque nos dados:

```
git rm -r --cached memoria        # remove do índice; MANTÉM os arquivos no disco
```

- Garantir que `.gitignore` contém `memoria/` (acrescentar se faltar).
- Commit: `chore(oml): destravar memoria/ do versionamento (dados do projeto)`.

> `--cached` é a peça-chave: tira do controle de versão **sem apagar** o conteúdo.

### Passo 3 — Trazer o motor novo

```
git pull --no-rebase origin <branch>
```

- Como `memoria/` agora está ignorada nos dois lados, **não há conflito de memória**.
- Conflito só pode surgir se o projeto **editou arquivos do motor** localmente (raro e desencorajado). Nesse caso: resolver preservando a intenção do dev e registrar em `decisoes.md`.
- Se o `pull` falhar por divergência de histórico, cair para o **Modo cópia**.

### Passo 4 — seed-if-missing (memória aditiva)

Para cada item em `docs/05-templates/memoria-seed/`:

- Se **não existe** o correspondente em `memoria/` → copiar (cria estrutura nova).
- Se **já existe** → **não tocar** (é dado do projeto).

### Passo 5 — Migrações estruturais

Para cada entrada de `migracoes[]` em [`oml.manifesto.json`](../../oml.manifesto.json) com `versao` maior que a versão local anterior:

- Aplicar os `passos` descritos — **sempre aditivos** (criar/renomear/mover esqueleto), nunca apagar dado.
- Renomeação de arquivo de memória: copiar conteúdo do antigo para o novo nome e **preservar** o antigo até o dev confirmar.

### Passo 6 — Registrar e relatar

1. Carimbar a nova versão (o `pull` já trouxe o `VERSION` novo; confirmar).
2. Acrescentar linha em `memoria/decisoes.md`: data, "Atualização do OML X.Y.Z → A.B.C", contexto, responsável.
3. Acrescentar linha em `memoria/historico-migracao.md` (ação "Atualização do OML").
4. Emitir **relatório final**:
   - versão antiga → nova;
   - resumo do CHANGELOG aplicado;
   - novidades de memória criadas pelo seed;
   - **ações humanas** requeridas (ex.: limpar `.claude/settings.json`, configurar `settings.local.json`, revisar migração manual);
   - lembrete: backup em `memoria/.backup-...` (apagar quando o dev validar);
   - se o dev usa comandos **globais**, lembrar de re-rodar o instalador para refletir comandos novos (`scripts/instalar-comandos-globais.ps1` no Windows; `scripts/instalar-comandos-globais.sh` no Linux/macOS).

---

## Regras

- **Estado é sagrado.** Nenhum passo escreve em `memoria/` exceto: criar o que falta (seed) e acrescentar as duas linhas de log. Nunca sobrescrever, nunca apagar.
- **Backup primeiro.** Não há atualização sem backup de `memoria/`.
- **Ordem fixa.** Destravar memória → commitar → pull. Inverter a ordem arrisca os dados.
- **Sem timestamp inventado.** Datas vêm do git ou do dev (ver [`politica-anti-alucinacao.md`](../00-visao-geral/politica-anti-alucinacao.md)).
- **`.claude/settings.json` é estado** — não sobrescrever. Permissões específicas de máquina pertencem a `.claude/settings.local.json` (ignorado).
- **Parar em risco.** Se algo ameaçar dados (conflito amplo, histórico irreconciliável), **parar e perguntar** ao dev — nunca "resolver" apagando.

---

## Modo cópia (clone sem git ou histórico irreconciliável)

Quando `git pull` não é viável:

1. Backup de `memoria/` (Passo 1).
2. Baixar o motor novo num diretório temporário (`git clone --depth 1` do oficial, ou ZIP).
3. Copiar **apenas os caminhos de `motor`** do `oml.manifesto.json` por cima do clone do projeto (`docs/`, docs de raiz, `VERSION`, `oml.manifesto.json`, `.gitignore`). **Não** copiar `memoria/`, `.claude/settings.json`, `aprimoramento/`.
4. Seguir do Passo 4 (seed-if-missing) em diante.

---

## Checklist

- [ ] Versão local × remota comparadas; delta do CHANGELOG mostrado
- [ ] Backup de `memoria/` feito antes de qualquer escrita
- [ ] `memoria/` destravada e commitada **antes** do pull (se estava rastreada)
- [ ] Motor atualizado (pull ou cópia) sem tocar em estado
- [ ] seed-if-missing aplicado (só criou o que faltava)
- [ ] Migrações estruturais aditivas aplicadas
- [ ] Registrado em `decisoes.md` e `historico-migracao.md`; `VERSION` novo confirmado
- [ ] Relatório final com ações humanas pendentes

## Frase obrigatória de encerramento

"OML atualizado: [versão antiga] → [versão nova]. Estado preservado (backup em `memoria/.backup-...`). Ações humanas: [N]."

## Relacionado

- [`/oml-atualizar`](../01-comandos/oml-atualizar.md) · [`politica-versionamento-atualizacao.md`](../00-visao-geral/politica-versionamento-atualizacao.md) · [`oml.manifesto.json`](../../oml.manifesto.json) · [`/migracao-sincronizar`](../01-comandos/migracao-sincronizar.md)
