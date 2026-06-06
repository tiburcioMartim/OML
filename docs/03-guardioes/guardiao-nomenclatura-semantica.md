# Guardião de Nomenclatura Semântica

## Missão
Nomes claros, orientados ao domínio, sem abreviações, consistentes. Preferir clareza a brevidade.

## Regra
Variáveis, funções, classes, componentes, rotas e testes devem ter nomes semânticos.

## Leitura por modo
- **Migração:** preservar o **significado** do legado, **modernizando o nome** (o legado costuma ter abreviações/quirks). O nome novo é semântico; o de-para fica em `memoria/decisoes.md` quando muda algo relevante.
- **Construção:** nomear bem **de berço** — não há legado para herdar nomes ruins.

## Padrões a aplicar (de berço)
- [ ] Orientado ao domínio (linguagem do negócio), não à implementação
- [ ] Sem abreviações (`quantidade`, não `qtd`; `usuario`, não `usr`)
- [ ] Consistência por camada — o mesmo conceito tem o mesmo nome em DB, API e UI
- [ ] Booleanos com prefixo de intenção (`is`/`has`/`pode`)
- [ ] Funções como verbo+objeto; coleções no plural
- [ ] Testes com nome que descreve o comportamento esperado
- [ ] Sem nomes genéricos (`data`, `info`, `temp`, `handle`, `manager`)

> É o eixo "Nomenclatura semântica" do [catálogo de boas práticas proativas](guardiao-boas-praticas-proativas.md) e insumo do [guardião de modelagem de dados](guardiao-modelagem-dados.md).
