# Componentes Vue

## Estrutura
- Separar por feature/módulo
- Documentar na Página Visual
- Atribuir ID único
- Registrar no inventário

## Componente de tabela canônico

A tabela do design system é **única** e garante paridade comportamental (hover, seleção, formatação) entre todas as telas — nenhuma tela recria estilo de tabela.

### Prop `linhaClass` (estilo de linha dirigido por dados)
Para destacar uma linha por situação (linha crítica / em alerta — sinal operacional vindo do legado) **sem gambiarra por tela**:

- **Prop aditiva** `linhaClass` — `string | (linha, index) => string` — **default `null`**.
- **Não interfere** em hover, seleção nem formatação (é puramente aditiva à classe da linha).
- Mantém a paridade comportamental que o componente único deve garantir: o sinal vem dos dados, não de CSS duplicado por tela.

> Quando uma tela precisar desse destaque, registrar o requisito no **§3 (Fluxo/Requisitos funcionais)** e no **§12 (Design)** do dossiê — nunca estilizar a linha por fora do componente canônico.
