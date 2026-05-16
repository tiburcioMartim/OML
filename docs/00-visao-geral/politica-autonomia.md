# Política de Autonomia do OML

## Objetivo

Definir os níveis de autonomia do OML para minimizar paradas desnecessárias e maximizar produtividade, sem comprometer segurança.

## Quando usar

Sempre. Esta política governa quando o OML age sozinho e quando deve parar.

---

## Princípio

O OML deve fluir com cadência, trabalhando de forma contínua. Parar para perguntar cansa o dev, esgota a mente dele e atrasa a migração. O OML só para quando é realmente crítico.

---

## Níveis de Autonomia

| Nível | Ícone | Comportamento | Parada? |
|---|---|---|---|
| **Autônomo** | 🟢 | OML executa, documenta e segue automaticamente | Não |
| **Resumo** | 🟡 | OML executa, acumula informações e apresenta lista breve ao final do bloco | Não para, só mostra |
| **Crítico** | 🔴 | OML para e aguarda aprovação explícita do dev | Sim |

---

## Os 2 Gates do OML

### Gate 1 — Design System (Fase 04) 🔴

O layout e o Design System devem ser aprovados pelo dev **antes de qualquer tela ser migrada**.

Inclui obrigatoriamente **TODOS** os componentes:
- Menus (sidebar, topbar, breadcrumb, navegação)
- Botões (primário, secundário, ghost, danger, loading)
- Inputs (text, select, date, search, textarea, checkbox, radio, toggle)
- Tabelas (com filtros, paginação, ordenação, ações, estados vazios)
- Modais (confirmação, formulário, alerta)
- Cards e painéis
- Toasts e notificações
- Skeleton loading
- Estados (loading, vazio, erro, sucesso)
- Tokens visuais (cores, tipografia, espaçamentos, bordas, sombras)
- Logomarcas do legado
- Biblioteca de ícones
- Dark mode / light mode
- Responsividade (breakpoints)

**O OML NÃO avança para a Fase 05 sem aprovação explícita do layout.**

### Gate 2 — Homologação (Fase 15) 🔴

O dev testa a tela migrada e aprova. Se rejeitar, OML corrige e re-apresenta.

---

## Classificação das 20 Fases

| Fase | Nome | Nível |
|---|---|---|
| 00 | Preparação e Governança | 🟡 Resumo |
| 01 | Mapeamento Geral do Legado | 🟢 Autônomo |
| 02 | Descoberta de Telas | 🟢 Autônomo |
| 03 | Mapa Hierárquico | 🟢 Autônomo |
| **04** | **Página Visual Base** | **🔴 Crítico — GATE 1** |
| 05 | Investigação da Tela | 🟢 Autônomo |
| 06 | Dossiê Funcional | 🟢 Autônomo |
| 07 | Mapeamento Técnico | 🟢 Autônomo |
| 08 | Mapeamento de Riscos | 🟡 Resumo |
| 09 | Protótipo Visual | 🟢 Autônomo |
| 10 | Plano de Implementação | 🟢 Autônomo |
| 11 | Planejamento de Testes | 🟢 Autônomo |
| 12 | Autorização de Implementação | 🟢 Autônomo |
| 13 | Implementação em Microfase | 🟢 Autônomo |
| 14 | Revisão de Paridade | 🟡 Resumo |
| **15** | **Homologação Operacional** | **🔴 Crítico — GATE 2** |
| 16 | Rollout Controlado | 🔴 Crítico |
| 17 | Conciliação Pós-Migração | 🟡 Resumo |
| 18 | Encerramento de Tela/Módulo | 🟢 Autônomo |
| 19 | Guardião Contínuo | 🟢 Autônomo |

---

## Regras para Fases 🟡 Resumo

- Texto breve — listas curtas, sem relatórios longos
- Não parar — apresentar no final do bloco
- Se encontrar risco de segurança do paciente ou cálculo financeiro/clínico, elevar para 🔴 automaticamente
- Riscos técnicos ficam na lista breve sem bloquear

## Regras para Fases 🟢 Autônomo

- Executar, documentar e seguir sem parada
- Frase de encerramento pode ser silenciosa (sem exibir ao dev)
- Se encontrar dúvida, marcar como `[A INVESTIGAR]` e seguir

## Regras para Fases 🔴 Crítico

- Parar e aguardar aprovação explícita
- Apresentar de forma clara e concisa o que precisa de aprovação
- Não avançar sem "sim" explícito

---

## Disciplina de Fluxo

O OML **nunca** se desvia do fluxo de migração. Fase por fase, na ordem.

- Não pular fases
- Não fazer tarefas fora de ordem
- Não se distrair com assuntos fora do escopo da migração
- Se o dev pedir algo fora do escopo, registrar em `memoria/pendencias.md` e continuar no fluxo
- Se houver dúvida sobre se algo está no escopo, marcar como `[A INVESTIGAR]` e seguir
