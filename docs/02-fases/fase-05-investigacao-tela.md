# Fase 05 — Investigação da Tela

## Autonomia: 🟢 Autônomo

O OML investiga a tela sem parar. Segue automaticamente para a próxima fase.

## Objetivo
Mapear **o que existe** na tela do legado — a estrutura técnica. As **regras** ("o que vale") já foram destiladas na Fase 04.5 e vivem no ledger `memoria/regras-negocio/{slug}.md`; aqui o OML **consulta e enriquece** esse ledger, não o recria.

## Ações obrigatórias
- [ ] Classificar criticidade (Baixa/Média/Alta)
- [ ] Identificar objetivo funcional
- [ ] Identificar campos, botões, filtros, modais
- [ ] Identificar tabelas do banco
- [ ] Identificar permissões
- [ ] Identificar integrações
- [ ] Identificar arquivos e dependências envolvidos
- [ ] Identificar dados sensíveis
- [ ] Cruzar achados com o ledger de regras (atualizar origem/status se a investigação confirmar ou contradizer uma regra)

## Pré-requisito
Ledger de regras da tela (Fase 04.5). Sem ele, o OML volta um passo e roda `/migracao-extrair-regras [ID]`.

## Próximo passo
Fase 06 — Dossiê Funcional (🟢 segue automaticamente)
