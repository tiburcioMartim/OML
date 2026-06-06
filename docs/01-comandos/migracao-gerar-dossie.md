# /migracao-gerar-dossie

## Objetivo

Gerar o dossiê funcional completo de uma tela, cobrindo todos os 21 domínios obrigatórios.

## Quando usar

Após `/migracao-analisar-tela`, para documentar completamente a tela.

## Validação obrigatória de pré-requisitos (Gate de completude — auto-resolvível)

O ledger `memoria/regras-negocio/{slug}.md` precisa existir **e estar finalizado** (Definição de Pronto da Extração).

- **Gate de completude (🔄):** se o ledger faltar ou não estiver finalizado, **não abortar** — disparar `/migracao-extrair-regras [ID]` (investigar e completar a extração), e **só então** gerar o dossiê. Registrar em resumo breve o que precisou completar.
- **Gate humano (👤):** se o Gate 1 (Design System) não estiver aprovado, **abortar** (nenhuma tela avança sem layout aprovado).
- Auto-resolução **não inventa**: itens 🟠/❌/💀 viram pendência/decisão do dev, não bloqueiam o restante.

Ver `docs/04-protocolos/protocolo-gates-validacao.md`.

## Entradas esperadas

ID da tela. Exemplo: `/migracao-gerar-dossie TELA-0001`

## Ações obrigatórias

- [ ] Preencher todos os 21 blocos do dossiê (ver template)
- [ ] Identificação, objetivo funcional, fluxo operacional
- [ ] Campos, ações, banco de dados
- [ ] Espelhar as regras do ledger `regras-negocio/{slug}.md` (tipo, origem citada, status) — não recriar
- [ ] Permissões por ação
- [ ] Integrações com falhas possíveis
- [ ] LGPD, acessibilidade, design
- [ ] Responsividade, feedbacks, auditoria
- [ ] Observabilidade, performance
- [ ] Disaster recovery, continuidade operacional
- [ ] Testes planejados
- [ ] Riscos e dúvidas
- [ ] Marcar campos incertos como A INVESTIGAR

## Ações proibidas

- [ ] Não inventar regras de negócio
- [ ] Não implementar código
- [ ] Não preencher com suposições sem marcar

## Arquivos que atualiza

- Cria arquivo de dossiê na pasta do módulo
- `memoria/backlog-telas.yaml` (status → `dossie_concluido`)

## Checklist de conclusão

- [ ] 21 blocos preenchidos ou justificados
- [ ] Regras de negócio com origem
- [ ] Incertezas marcadas
- [ ] Dossiê salvo

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% o Dossiê Funcional da tela [NOME]."

## Próximo passo

`/migracao-propor-interface [ID]`
