# Protocolo — Cérebro Obsidian (grafo de conhecimento dos sistemas)

## Objetivo

Manter um **cérebro navegável** — um vault do Obsidian — sobre todos os sistemas do workspace,
que **agrega** o conhecimento que o OML já produz (ledgers, inventários, decisões, dossiês) em
vez de duplicá-lo, e que qualquer humano abre no Obsidian e o Claude lê/escreve como arquivos.

Não é um sistema paralelo: é a **camada de visão** por cima da `memoria/` de cada projeto. O
que dá vida ao grafo é a **ligação por `[[wikilink]]`** — o OML passa a emitir esses links, e o
Obsidian desenha o mapa.

## Princípios

1. **O vault é a raiz do workspace.** O Obsidian abre a pasta que é irmã dos projetos (a que
   contém `<projeto>/OML/`, `<projeto>/docs/`, etc.). Assim um único grafo cruza todos os
   sistemas — o Obsidian só liga `[[wikilinks]]` entre notas **dentro** do vault.
2. **Não copiar; ligar.** As `memoria/` continuam morando em cada projeto (versionadas com o
   código daquele projeto). O cérebro as referencia de onde estão. Duplicar conteúdo é proibido
   (mesma regra do guardião de regras multi-app: a fonte é única, os outros referenciam).
3. **Camada curada = `cerebro/` na raiz.** MOCs (Map of Content) por sistema e por domínio,
   mantidos à mão + costurados pelo OML. É a porta de entrada (`cerebro/INDEX.md`).
4. **Frontmatter padronizado** (`tipo:`, `sistema:`, `status:`, `atualizado:`) para o Dataview
   montar dashboards sem trabalho manual.
5. **Sobrevive à migração.** Igual aos ledgers: o cérebro é documentação viva permanente.

## Estrutura no workspace

```
<workspace>/                     ← raiz do vault (Obsidian abre aqui)
├── .obsidian/                     config do vault (excludes: node_modules, vendor, .git, storage)
├── cerebro/                       camada CURADA
│   ├── INDEX.md                     a porta (seed a partir de INDEX.template.md)
│   ├── COMO-USAR.md
│   ├── dashboards.md                Dataview sobre o frontmatter
│   ├── sistemas/<slug>.md           1 MOC por sistema (seed a partir de sistema.template.md)
│   ├── dominios/<slug>.md           cortes que atravessam sistemas (LGPD, uma frente, etc.)
│   └── memoria-claude/  (opcional)  symlink para a memória do Claude, se houver — só navegação
└── <projeto>/OML/memoria/         os NEURÔNIOS (ledgers, inventários) — ficam onde estão
```

## Como o OML costura o grafo (a fiação)

- **Na ativação** (`/migracao-ativar`): se existir `cerebro/INDEX.md` na raiz do workspace,
  carregá-lo como índice do conhecimento; se **não** existir, seed-if-missing a partir de
  `docs/05-templates/cerebro/` (nunca sobrescrever um `cerebro/` já existente — é dado do dev).
- **Na sincronização** (`/migracao-sincronizar`): ao reconciliar a `memoria/`, garantir que as
  unidades novas (ledgers, dossiês) tenham entrada linkável e atualizar o MOC do sistema
  correspondente em `cerebro/sistemas/`. Divergência vira pendência, nunca exclusão silenciosa.
- **Ao gerar ledger/dossiê**: emitir `[[wikilinks]]` para as unidades relacionadas e para o
  sistema dono (ver a seção "🧠 Ligações" no template de ledger). É o link que forma o grafo.

## Regras (o que respeitar)

- **Anti-alucinação:** só linkar `[[nota]]` que **existe**. Link para arquivo inexistente é
  proibido — ver `docs/00-visao-geral/politica-anti-alucinacao.md`. (Um `[[wikilink]]` pendente
  é aceitável apenas como marcador consciente de algo a criar, nunca como fato.)
- **LGPD:** o cérebro é sobre estrutura e regra, não sobre pessoas. Não trazer para as notas
  valores de dado pessoal — só nomes de coluna/objeto e agregados.
- **Não versionar por engano:** se a raiz do workspace não é um repositório git, `cerebro/` e
  `.obsidian/` são arquivos locais. A *mecânica* (este protocolo + os templates) vive no motor
  do OML e é versionada aqui.

## Acesso pelo Claude — sem MCP

Rodando localmente, o Claude lê/escreve as notas com as ferramentas de arquivo (Read/Write/Edit/
Grep). **Não é preciso servidor MCP do Obsidian.** Um MCP só entra se um Claude *remoto* (nuvem)
precisar alcançar o vault — fora do fluxo local do OML.

## Ver também

- `docs/04-protocolos/protocolo-sincronizacao-memoria.md`
- `docs/03-guardioes/guardiao-regras-negocio.md` (fonte única / não duplicar)
- `docs/00-visao-geral/politica-anti-alucinacao.md`
- `docs/05-templates/cerebro/` (os seeds)
