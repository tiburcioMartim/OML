# Fluxo de Construção (Greenfield)

Mapa de quais fases se aplicam quando `modo: construcao` (ou na parte inédita de `modo: hibrido`). Governado por `docs/00-visao-geral/politica-modos-projeto.md` — **fonte autoritativa do modo**. Em `modo: migracao`, este arquivo é ignorado e a esteira de 00→19 permanece idêntica.

## Princípio
Em construção não há legado para descobrir, investigar ou espelhar. A fonte de verdade é **decisão do dev + boas práticas + perfil** (`memoria/decisoes.md`). As fases que **leem o legado** são puladas; as que **constroem** permanecem; a validação final troca de **paridade** para **critérios de aceite**.

## Tabela de fases por modo

| Fase | Nome | Migração | Construção |
|---|---|---|---|
| 00 | Preparação e Governança | ✅ | ✅ |
| 01 | Mapeamento Geral do Legado | ✅ | ⏭️ pula (sem legado) |
| 02 | Descoberta de Telas | ✅ | 🔄 **substitui** por `/construir-capturar-requisitos` |
| 03 | Mapa Hierárquico | ✅ | 🔄 substitui (backlog de features planejadas) |
| 04 | Página Visual Base — **GATE 1** | ✅ | ✅ (identidade visual nova) |
| 04.5 | Extração de Regras de Negócio | ✅ (do legado) | 🟩 regras inéditas (origem = decisão do dev), mesmo ledger |
| 05 | Investigação da Tela | ✅ | ⏭️ pula (sem legado) |
| 06 | Dossiê Funcional | ✅ | ✅ (dossiê de feature, vindo da captura de requisitos) |
| 07 | Mapeamento Técnico | ✅ | ✅ |
| 08 | Mapeamento de Riscos | ✅ | ✅ |
| 09 | Protótipo Visual | ✅ | ✅ |
| 10 | Plano de Implementação | ✅ | ✅ (Models **novos**, ver fase) |
| 11 | Planejamento de Testes | ✅ | ✅ |
| 12 | Autorização de Implementação | ✅ | ✅ |
| 13 | Implementação em Microfase | ✅ | ✅ (Models **novos**, ver fase) |
| 14 | Revisão de Paridade | ✅ | 🔄 **substitui** por revisão de critérios de aceite |
| 15 | Homologação Operacional — **GATE 2** | ✅ | ✅ |
| 16 | Rollout Controlado | ✅ | ✅ |
| 17 | Conciliação Pós-Migração | ✅ | ⏭️ pula (nada a conciliar com o legado) |
| 18 | Encerramento de Tela/Módulo | ✅ | ✅ |
| 19 | Guardião Contínuo | ✅ | ✅ |

Legenda: ✅ aplica · ⏭️ pula · 🔄 substitui · 🟩 origem greenfield no mesmo artefato.

## O que NÃO muda
Os 2 Gates, o motor de autonomia (🟢/🟡/🔴), microfases, matriz de criticidade, políticas anti-alucinação/autorização/preservação de contexto e o Guardião Contínuo são **agnósticos de modo** (ver `politica-modos-projeto.md` › "O que NÃO muda em nenhum modo").

## Híbrido
Por tela/feature: domínio migrado segue a coluna **Migração**; feature inédita segue a coluna **Construção**. Ambos no mesmo backlog e no mesmo ledger de regras.

## Relacionado
- `docs/00-visao-geral/politica-modos-projeto.md`
- `docs/00-visao-geral/politica-autonomia.md` (classificação de fases por nível)
- `docs/01-comandos/construir-capturar-requisitos.md`
- `docs/00-visao-geral/regra-mae.md` e `definicao-de-pronto.md` (parametrizados por modo)
