# Banco Legado — Regras Laravel

## Princípio
O Laravel deve se adaptar ao banco legado, não o contrário.

## Models
- `protected $table` — nome real da tabela legada
- `protected $primaryKey` — chave primária real
- `public $incrementing` — se auto-increment
- `public $timestamps` — se usa created_at/updated_at
- `protected $connection` — se banco diferente
