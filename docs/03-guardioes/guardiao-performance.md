# Guardião de Performance

## Missão
Queries pesadas, paginação, cache, N+1, relatórios grandes, exportações, filas, limites de timeout, índices, teste de carga.

## Regra
Nenhuma tela com dados volumosos deve carregar tudo sem paginação, filtro ou estratégia de performance.

## Leitura por modo
- **Migração:** medir o comportamento do legado e **não regredir**; telas lentas do legado são oportunidade de melhoria (regra-mãe item 6), registrada em `memoria/decisoes.md`.
- **Construção:** performance no design **de berço** — índices e paginação decididos na modelagem, não depois.

## Padrões a aplicar (de berço)
- [ ] Paginação + filtros em toda listagem volumosa (nunca carregar tudo)
- [ ] Prevenção de N+1 (eager loading / consultas planejadas)
- [ ] Índices nas colunas de busca/filtro/junção (alinhar com [modelagem de dados](guardiao-modelagem-dados.md))
- [ ] Cache em dados caros e estáveis, com invalidação clara
- [ ] Filas para trabalho pesado/assíncrono (relatórios, exports, e-mail)
- [ ] Limites de timeout e de tamanho de payload
- [ ] Exportações grandes em streaming/lote, não em memória
- [ ] Performance budget por tela (tempo-alvo) nas features Estritas
- [ ] Teste de carga quando o volume esperado for alto

> É o eixo "Performance" do [catálogo de boas práticas proativas](guardiao-boas-praticas-proativas.md).
