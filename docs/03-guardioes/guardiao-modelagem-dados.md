# Guardião de Modelagem de Dados

## Missão
Garantir que, em projetos novos (construção/híbrido), o schema do banco nasça bem projetado — em vez de herdado de um legado. É o equivalente greenfield do [guardião de qualidade de dados](guardiao-qualidade-dados.md), que trata da conciliação de bases legadas na migração.

## Regra
Em modo construção, o schema é projetado do zero com integridade na origem: chaves, constraints, índices e auditoria fazem parte do design, não são adicionados depois.

## Quando ativo
Quando o perfil indicar `modo: construcao` ou ao construir features inéditas em `modo: hibrido` (ver [política de modos de projeto](../00-visao-geral/politica-modos-projeto.md)). Em `modo: migracao`, prevalece o guardião de qualidade de dados (preservar o banco legado).

---

## Diretrizes obrigatórias

### Estrutura
- Normalização adequada (evitar duplicação; desnormalizar só com justificativa de performance documentada)
- Chave primária explícita em toda tabela; chaves estrangeiras com integridade referencial declarada
- Nomes de tabelas e colunas claros e consistentes (ver [guardião de nomenclatura semântica](guardiao-nomenclatura-semantica.md))
- Tipos de dado corretos (não usar `string` para datas/números/dinheiro; usar tipos monetários/decimais para valores)

### Integridade na escrita
- Constraints no banco (`NOT NULL`, `UNIQUE`, `CHECK`) além da validação na aplicação
- Validação server-side sempre (ver [guardião de segurança](guardiao-seguranca.md))
- Enums/estados com valores controlados (evitar campos multiuso e status ambíguos)

### Rastreabilidade e ciclo de vida
- `created_at` / `updated_at` em entidades relevantes
- **Soft delete** quando houver obrigação legal/auditoria de manter histórico (alinhar com [LGPD](guardiao-lgpd-privacidade.md) — retenção × direito ao esquecimento)
- Auditoria de operações críticas (ver [guardião de observabilidade](guardiao-observabilidade.md))

### Performance desde o design
- Índices nas colunas de busca, filtro e junção mais frequentes (ver [guardião de performance](guardiao-performance.md))
- Pensar paginação e volume de dados na modelagem, não depois

### Migrations e dados de exemplo
- Toda mudança de schema via migration versionada (nunca alteração manual)
- Migrations reversíveis (`down`) sempre que possível
- Factories/seeders com dados sintéticos para desenvolvimento e testes (em greenfield não há dados do legado)

---

## Impacto em outros guardiões
- **Guardião de Qualidade de Dados:** complementar — aquele cuida de base legada (migração), este de schema novo (construção)
- **Guardião de LGPD:** classificação de PII por entidade influencia retenção e soft delete
- **Guardião de Performance:** índices e volume são decididos já na modelagem
- **Guardião de Boas Práticas Proativas:** este guardião é o eixo "Modelagem de dados" do catálogo
