# Matriz de Segurança — visão global

<!--
  Espelho agregado dos ledgers memoria/seguranca/{slug}.md. Gerada/atualizada por /migracao-mapear-seguranca.
  Vive em memoria/seguranca/matriz-seguranca.md. NUNCA inventa achado — só reflete os ledgers (origem citada lá).
  É a postura de segurança do ERP inteiro: base de auditoria e de priorização de correção.
-->

## Como ler

- Cada célula tem origem no ledger da tela; aqui só se **agrega**.
- **Achado aberto = risco vivo** até ser corrigido/decidido. 🔴 têm prioridade sobre 🟠 sobre 🟡.
- Nível ASVS: **L2** é o piso; telas com dado de saúde exigem **L3**.

## Telas mapeadas

| Tela / slug | Modo | Nível ASVS | Análise verificada | 🔴 | 🟠 | 🟡 |
|---|---|---|---|---|---|---|
| ex.: `prescricao` | 🟦 | L3 | ✅ 2026-07-17 | 1 | 0 | 2 |

## Achados por eixo (agregado)

| Eixo | OWASP:2025 | 🔴 | 🟠 | 🟡 | Telas afetadas |
|---|---|---|---|---|---|
| E1 Acesso/Autz | A01 | 0 | 0 | 0 | — |
| E2 Auth/Sessão | A07 | 0 | 0 | 0 | — |
| E3 Injeção | A05 | 0 | 0 | 0 | — |
| E4 Validação/Regra | A06 | 0 | 0 | 0 | — |
| E5 Cripto/LGPD | A04 | 0 | 0 | 0 | — |
| E6 Config/Exposição | A02 | 0 | 0 | 0 | — |
| E7 API/Externo | A01(SSRF)/API | 0 | 0 | 0 | — |
| E8 Integridade/Supply | A03/A08 | 0 | 0 | 0 | — |
| E9 Log/Auditoria | A09 | 0 | 0 | 0 | — |
| E10 Erros/Exceções | A10 | 0 | 0 | 0 | — |

## Achados críticos abertos (🔴) e rebaixamentos

<!-- Consolida os 🔴 dos ledgers que aguardam correção/decisão. 🔴 → decisoes.md; 🟠 → pendencias.md. -->

| ID | Tela | Achado | Eixo | Âncora | Destino |
|---|---|---|---|---|---|
| — | — | — | — | — | — |

## Dado de saúde — cobertura de proteção (LGPD art. 11)

| Tela | Dado sensível | Cifrado repouso | Cifrado trânsito | Minimizado | Trilha de acesso |
|---|---|---|---|---|---|
| ex.: `prescricao` | medicação/dose | ☐ | ☐ | ☐ | ☐ |

## Cobertura

| Métrica | Valor |
|---|---|
| Telas com ledger de segurança | 0 |
| Telas com análise **verificada** (apto Gate 2) | 0 |
| Telas com dado de saúde em **L3** | 0 |
| Achados 🔴 abertos | 0 |
| Achados 🟠 abertos | 0 |
| Última atualização | AAAA-MM-DD |
