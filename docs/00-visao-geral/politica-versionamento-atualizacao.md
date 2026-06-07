# Política de Versionamento e Atualização

## Objetivo

Permitir que **projetos que já usam o OML recebam as melhorias do agente sem perder seus dados** — histórico, decisões, inventários, regras de negócio, backlog, gates e pendências. O OML evolui rápido; esta política garante que evoluir o **motor** nunca destrua o **estado** de um projeto.

## Quando usar

- Sempre que for atualizar um clone do OML já em uso (`/oml-atualizar`).
- Ao decidir onde um arquivo novo deve morar (motor, estado ou local).
- Na ativação, para o passo *seed-if-missing*.

---

## O conceito central: Motor × Estado

O OML é distribuído como um **clone git por projeto** (diretório irmão do sistema). Dentro desse clone convivem dois ciclos de vida que **nunca** devem se misturar:

| Camada | O que é | Exemplos | Na atualização |
|---|---|---|---|
| **Motor** | O agente em si. Igual em todo projeto. | `docs/`, `README.md`, `CHANGELOG.md`, `historico-aprimoramento.md`, `VERSION`, `oml.manifesto.json` | **Sobrescrevível** — recebe as melhorias |
| **Estado** | Dado único do projeto, preenchido em runtime. | `memoria/` (decisões, histórico, inventários, regras de negócio, gates, pendências), `.claude/settings.json` | **Intocável** — nunca sobrescrito nem apagado |
| **Local** | Específico da máquina; fora do git. | `.claude/settings.local.json`, `aprimoramento/` | **Ignorado** — nem versionado nem tocado |

> A fonte da verdade dessa divisão é **[`oml.manifesto.json`](../../oml.manifesto.json)** na raiz — legível por máquina e consumida pelos comandos. Esta política é a explicação humana dele.

### Por que o conflito existia

Antes desta política, `memoria/` era **rastreada no git** como seeds (templates vazios). Num projeto vivo, esses mesmos arquivos guardam os dados reais. Como motor e estado estavam na **mesma árvore versionada**, qualquer `git pull` para trazer o motor novo colidia com o `memoria/` do projeto. A correção: **`memoria/` saiu do versionamento** (`git rm -r --cached memoria` + `.gitignore`), e o esqueleto vazio passou a viver no motor, em [`docs/05-templates/memoria-seed/`](../05-templates/memoria-seed/).

---

## Garantias da atualização (invioláveis)

1. **Não-destrutiva.** A atualização só escreve em caminhos do **motor**. Nenhum arquivo de **estado** é sobrescrito ou apagado — jamais.
2. **Backup antes de tudo.** Antes de qualquer alteração, `/oml-atualizar` faz cópia de segurança de `memoria/`.
3. **Aditiva na memória.** Estrutura nova de memória (pasta/arquivo introduzido por uma versão posterior) é **criada só se faltar** (*seed-if-missing*); o que já existe é dado e fica intocado.
4. **Ordem segura.** Em projeto cujo `memoria/` ainda é rastreado, o destravamento (`git rm --cached` + `.gitignore` + commit) acontece **antes** do `pull`, para que o `pull` jamais encoste nos dados.
5. **Rastreável.** Toda atualização é registrada em `memoria/decisoes.md` e `memoria/historico-migracao.md`, e a versão local é carimbada no `VERSION`.

---

## Versão

- A versão do OML vive em **`VERSION`** (na raiz) e segue [SemVer](https://semver.org/lang/pt-BR/): `MAIOR.MENOR.CORRECAO`.
  - **MAIOR** — mudança que exige migração manual de estado (rara).
  - **MENOR** — capacidade nova retrocompatível (o caso comum: guardião, fase, protocolo, comando).
  - **CORRECAO** — ajuste de redação/erro sem mudança de comportamento.
- O delta entre versões é descrito no [`CHANGELOG.md`](../../CHANGELOG.md).
- Recomenda-se **tag git** por release (`git tag v1.0.0`), para o `/oml-atualizar` comparar versões com precisão.

---

## seed-if-missing

O esqueleto vazio de `memoria/` é parte do motor, em [`docs/05-templates/memoria-seed/`](../05-templates/memoria-seed/). Dois momentos o usam:

- **`/migracao-ativar`** (bootstrap): num clone novo, `memoria/` não existe (é ignorada). A ativação copia o esqueleto para criar a memória inicial.
- **`/oml-atualizar`** (evolução): cria apenas pastas/arquivos novos que o projeto ainda não tem.

> Regra única: **cria o que falta, nunca toca no que existe.**

---

## Onde colocar um arquivo novo (decisão para quem evolui o OML)

| O arquivo é… | Vai para… | Entra no git? |
|---|---|---|
| Regra/doc/protocolo/comando do agente | `docs/...` (motor) | Sim |
| Esqueleto novo de memória | `docs/05-templates/memoria-seed/...` (motor) | Sim |
| Dado preenchido em runtime | `memoria/...` (estado) | **Não** (ignorado) |
| Permissão/credencial específica da máquina | `.claude/settings.local.json` (local) | **Não** (ignorado) |

> **Nunca** versione dado de projeto no motor. Se um arquivo de `memoria/` precisa de estrutura nova, mude o **seed** — não o dado.

---

## Checklist

- [ ] `memoria/` fora do versionamento (`git ls-files memoria` vazio) e no `.gitignore`
- [ ] Esqueleto vazio presente em `docs/05-templates/memoria-seed/`
- [ ] `VERSION` e `oml.manifesto.json` na raiz e coerentes
- [ ] Permissões específicas de máquina em `.claude/settings.local.json` (não no `settings.json` versionado)
- [ ] Atualização registrada em `memoria/decisoes.md` e `historico-migracao.md`

## Relacionado

- **Comando:** [`/oml-atualizar`](../01-comandos/oml-atualizar.md)
- **Protocolo:** [`protocolo-atualizacao-oml.md`](../04-protocolos/protocolo-atualizacao-oml.md)
- **Manifesto:** [`oml.manifesto.json`](../../oml.manifesto.json)
- **Seed:** [`docs/05-templates/memoria-seed/`](../05-templates/memoria-seed/)
- **Ativação (seed-if-missing):** [`/migracao-ativar`](../01-comandos/migracao-ativar.md)
- **Guardião de Evolução do Agente:** [`guardiao-evolucao-agente.md`](../03-guardioes/guardiao-evolucao-agente.md)
