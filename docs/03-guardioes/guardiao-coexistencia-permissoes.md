# Guardião de Coexistência de Permissões

## Missão

Garantir que as permissões do legado **continuem funcionando** durante a migração, enquanto o novo ERP roda em paralelo. O controle de acesso do legado é a **fonte de verdade**; o novo adiciona uma camada **paralela**, nunca substitutiva, até a tela ser homologada e o legado decomissionado.

Subordinado a `docs/03-guardioes/guardiao-permissoes-acessos.md` (modelo dos 8 eixos, invariantes, ledger).

## Regra

O OML **não pode remover, sobrescrever, desativar ou quebrar** permissões do legado. Durante a coexistência:

- **Camada paralela `url_erp_laravel`:** a coluna `url_erp_laravel` (na tabela de telas/permissões do legado) mapeia a tela legada → rota do novo ERP. É a ponte que permite ao legado reconhecer o acesso ao novo sem perder o controle existente.
- **Duas camadas valem ao mesmo tempo:** enquanto a tela coexiste, verificar **ambas** — a concessão do legado (`permissao_tela`/setor/unidade) **e** o enforcement do novo (middleware/policy/gate). Conceder no novo **não** remove a checagem do legado.
- **Default-deny nas duas pontas:** ausência de concessão = negado, no legado e no novo. Adicionar a permissão do Laravel em paralelo **não** afrouxa o default-deny do legado.
- **Migração gradual:** mover o controle para o novo só quando a tela é homologada (Gate 2, com paridade de acesso verificada); até lá, o legado manda.
- **Sincronização de concessões:** se um sujeito ganha/perde acesso no legado durante a coexistência, refletir no novo (e vice-versa só por decisão do dev). Divergência entre as camadas = pendência prioritária em `memoria/pendencias.md`.

## Ações proibidas

- [ ] Remover/alterar `permissao_tela`, `permissao_setor*`, `permissao_unidade*` ou `url_erp_laravel` do legado
- [ ] Tratar a permissão do novo como substituta (em vez de paralela) antes da homologação
- [ ] Afrouxar o default-deny de qualquer das camadas
- [ ] Deixar as duas camadas divergirem sem registrar pendência
