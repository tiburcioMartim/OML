# /migracao-analisar-tela

## Objetivo

Investigar **o que existe** numa tela do legado — estrutura técnica (campos, ações, tabelas, permissões, integrações, dependências). As **regras** ("o que vale") já foram destiladas na Fase 04.5 e vivem no ledger `memoria/regras-negocio/{slug}.md`.

## Quando usar

Na Fase 05, para cada tela do backlog, **após** `/migracao-extrair-regras [ID]` (Fase 04.5).

## Validação obrigatória de pré-requisitos (Gate duro)

> ⛔ **Se o Gate 1 (Fase 04 — Design System) não tiver sido aprovado, ABORTAR**: nenhuma tela é investigada para migração antes do layout aprovado. Ver `docs/04-protocolos/protocolo-gates-validacao.md`.

## Entradas esperadas

ID da tela ou URL legado. Exemplo: `/migracao-analisar-tela TELA-0001`

## Ações obrigatórias

- [ ] Classificar criticidade (🟢 Baixa, 🟡 Média, 🔴 Alta)
- [ ] Definir fluxo (Expresso, Padrão ou Estrito)
- [ ] Identificar objetivo funcional da tela
- [ ] Identificar campos exibidos e editáveis
- [ ] Identificar botões e ações
- [ ] Identificar filtros e listagens
- [ ] Identificar modais e fluxos alternativos
- [ ] Identificar tabelas do banco envolvidas
- [ ] Identificar permissões necessárias
- [ ] Identificar integrações
- [ ] Identificar arquivos e dependências envolvidos
- [ ] Cruzar achados com o ledger de regras (Fase 04.5) — confirmar/atualizar origem e status; **não recriar regra aqui**
- [ ] Identificar dados sensíveis (LGPD)
- [ ] Registrar dúvidas e incertezas
- [ ] Atualizar status da tela no backlog

## Ações proibidas

- [ ] Não implementar nada
- [ ] Não alterar banco
- [ ] Não inventar regras que não foram encontradas

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status da tela)

## Checklist de conclusão

- [ ] Criticidade classificada
- [ ] Fluxo definido
- [ ] Análise inicial concluída
- [ ] Dúvidas registradas

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a análise inicial da tela [NOME]. Criticidade: [NÍVEL]."

## Próximo passo

`/migracao-gerar-dossie [ID]`
