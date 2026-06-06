# Guardião de LGPD e Privacidade

## Missão
Inventariar dados pessoais e sensíveis, definir base legal, finalidade, minimização, retenção, anonimização, exportação e logs de acesso.

## Regra
Privacidade por design e por padrão em toda tela, tabela, relatório, exportação, log e integração.

## Leitura por modo
- **Migração:** mapear a PII que **já existe** no legado (telas, tabelas, relatórios, integrações) e garantir que o novo não exponha mais do que o necessário.
- **Construção:** privacy by design **de berço** — a classificação de dados acontece na modelagem, antes da primeira tabela.

## Padrões a aplicar (de berço)
- [ ] Inventário de PII por entidade/campo, com classificação (comum × sensível)
- [ ] Base legal e finalidade declaradas por dado coletado
- [ ] Minimização — não coletar nem exibir dado sem finalidade
- [ ] Retenção definida + estratégia de anonimização/right-to-erasure (alinhar soft delete com [modelagem de dados](guardiao-modelagem-dados.md))
- [ ] Logs de **acesso** a dados sensíveis (quem viu o quê)
- [ ] Exportação de dados do titular prevista
- [ ] PII mascarada em logs, telas de listagem e exports quando não essencial
- [ ] Consentimento registrado quando a base legal for consentimento

## Governança e direitos do titular
- [ ] **Direitos do titular** operacionalizados: acesso, correção, exclusão, portabilidade, revogação de consentimento — com fluxo/tela, não só "previsto"
- [ ] **Banner de cookies/consentimento** quando houver rastreamento, com opt-in granular (não pré-marcado) e registro da escolha
- [ ] **RIPD/DPIA** (Relatório de Impacto) para tratamentos de alto risco (dados sensíveis em escala, decisão automatizada)
- [ ] **Plano de resposta a incidente** de dados (notificação a ANPD/titulares) — alinhar com [resposta a incidentes](guardiao-resposta-incidentes.md)
- [ ] **PII não exposta a IA** (treinamento/indexação) sem base legal — alinhar com [SEO/GEO/AIO](guardiao-seo.md)
- [ ] **Operadores/terceiros** (gateways, e-mail, analytics) sob contrato/DPA — itens que dependem do dev viram [pendência humana](guardiao-pendencias-humanas.md)

> É o eixo "Privacidade e dados pessoais" do [catálogo de boas práticas proativas](guardiao-boas-praticas-proativas.md). Coordena com [segurança](guardiao-seguranca.md), [auditoria](guardiao-auditoria.md), [resposta a incidentes](guardiao-resposta-incidentes.md) e [dados de teste](guardiao-dados-teste.md) (anonimização).
