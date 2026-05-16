# Fase 08 — Mapeamento de Riscos

## Autonomia: 🟡 Resumo

O OML identifica riscos e gera uma lista breve. Não para. Pouco texto — listas curtas.
Se encontrar risco de segurança do paciente ou cálculo financeiro/clínico, eleva para 🔴 automaticamente.

## Objetivo
Identificar riscos técnicos, operacionais e de negócio da migração da tela.

## Ações obrigatórias
- [ ] Identificar riscos de perda de regra
- [ ] Identificar riscos de banco
- [ ] Identificar riscos de integração
- [ ] Identificar riscos de permissão
- [ ] Classificar severidade
- [ ] Registrar em `memoria/riscos.md` (lista breve, sem relatórios longos)

## Formato da lista de riscos

```
Riscos encontrados (tela [NOME]):
- 🔴 [Alto] Cálculo de dosagem — pode afetar segurança do paciente
- 🟡 [Médio] API externa sem fallback
- 🟢 [Baixo] Campo sem máscara de formatação
```

## Elevação automática para 🔴

Se qualquer risco envolver:
- Segurança do paciente
- Cálculo financeiro ou clínico
- Violação de LGPD
- Perda potencial de dados

→ O OML **para imediatamente** e avisa o dev.

## Próximo passo
Fase 09 — Protótipo Visual (🟢 segue automaticamente)
