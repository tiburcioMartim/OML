# /construir-capturar-requisitos

## Objetivo

Capturar os requisitos de uma feature inédita (modo construção/híbrido) e produzir a **fonte de verdade funcional** dela — substituindo, no greenfield, a esteira de descoberta e investigação do legado.

## Quando usar

Em projetos com `modo: construcao` ou `modo: hibrido`, após `/migracao-configurar-projeto`, para cada feature nova a construir. É o equivalente greenfield de `/migracao-descobrir-telas` + `/migracao-analisar-tela` + `/migracao-gerar-dossie`.

## Entradas esperadas

A intenção do dev sobre a feature: o que ela faz, para quem, regras de negócio, dados envolvidos, critérios de aceite. O OML conduz com perguntas concretas e opções — nunca exige conhecimento técnico avançado do dev (ver [filosofia](../00-visao-geral/filosofia.md), princípio 10).

## Pré-condição (gate)

- [ ] O perfil do projeto deve ter `modo: construcao` ou `modo: hibrido`. Se for `modo: migracao`, **abortar** e orientar o uso de `/migracao-analisar-tela`.

## Ações obrigatórias

### Levantamento da feature
- [ ] Capturar objetivo da feature e usuários/personas envolvidas
- [ ] Capturar fluxo principal e fluxos alternativos (em linguagem do dev)
- [ ] Listar dados/entidades envolvidos e classificar PII/sensíveis (ver [guardião LGPD](../03-guardioes/guardiao-lgpd-privacidade.md))
- [ ] Definir critérios de aceite verificáveis (substituem a paridade do legado)
- [ ] Classificar a criticidade da feature (ver [matriz de criticidade](../00-visao-geral/matriz-criticidade.md))

### Regras de negócio (fonte de verdade)
- [ ] Registrar cada regra inédita no ledger `memoria/regras-negocio/{slug}.md` com `origem: decisão do dev (decisoes.md)`
- [ ] Referenciar telas/features análogas quando existirem (especialmente em modo híbrido)
- [ ] Marcar hipóteses como 🟡 e confirmar com o dev antes de implementar

### Boas práticas (catálogo)
- [ ] Anexar o [Catálogo de Boas Práticas](../03-guardioes/guardiao-boas-praticas-proativas.md) à feature, a partir do template `docs/05-templates/catalogo-boas-praticas.template.md`
- [ ] Garantir que o Design System (Fase 04 / Gate 1) já está aprovado antes de prototipar

### Dossiê de feature
- [ ] Gerar o dossiê de feature (mesmo papel do dossiê de tela, com origem em requisitos)
- [ ] Registrar decisões em `memoria/decisoes.md`

## Ações proibidas

- [ ] Não inventar regras de negócio — toda regra vem de decisão explícita do dev
- [ ] Não implementar código nesta etapa
- [ ] Não pular a captura de critérios de aceite (sem eles não há como validar o "pronto")

## Arquivos que atualiza

- `memoria/regras-negocio/{slug}.md`
- `memoria/decisoes.md`
- Dossiê de feature (na estrutura de memória/documentação do projeto)

## Checklist de conclusão

- [ ] Modo do projeto validado (construção ou híbrido)
- [ ] Objetivo, fluxos e personas capturados
- [ ] Dados classificados (PII/sensíveis)
- [ ] Critérios de aceite definidos
- [ ] Regras inéditas no ledger com `origem: decisão do dev`
- [ ] Catálogo de Boas Práticas anexado à feature
- [ ] Dossiê de feature gerado
- [ ] Decisões registradas

## Frase obrigatória de encerramento

"Requisitos capturados. Fonte de verdade da feature registrada. Próximo passo: `/migracao-propor-interface`."

## Próximo passo

`/migracao-propor-interface` (comando compartilhado entre os modos, usando o Design System já aprovado no Gate 1)
