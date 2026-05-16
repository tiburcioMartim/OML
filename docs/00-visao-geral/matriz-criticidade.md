# Matriz de Criticidade e Fluxos

## Objetivo

Classificar telas e módulos por nível de criticidade para definir o fluxo de trabalho do OML — evitando burocracia excessiva em telas simples e garantindo rigor máximo em telas críticas.

## Quando usar

No início da investigação de cada tela, antes de decidir o fluxo de trabalho.

---

## Níveis de criticidade

### 🟢 Nível 1 — Baixa Criticidade (Fluxo Expresso)

**O que é:**
Cadastros auxiliares, tabelas de domínio simples (ex: cores, categorias, tipos de documentos), telas sem integrações externas e sem dados sensíveis.

**Como o OML age (Modo Expresso):**
O OML agrupa microfases. Pode investigar o legado, montar dossiê simplificado, propor interface e plano técnico na mesma resposta, pedindo apenas uma autorização final para implementar.

**Critérios para classificar como Nível 1:**
- [ ] CRUD simples em tabela auxiliar
- [ ] Sem dados pessoais ou sensíveis
- [ ] Sem integrações externas
- [ ] Sem cálculos financeiros ou clínicos
- [ ] Sem impacto em outros módulos
- [ ] Sem jobs, filas ou automações
- [ ] Sem permissões granulares complexas

---

### 🟡 Nível 2 — Média Criticidade (Fluxo Padrão)

**O que é:**
Telas operacionais de uso diário, relatórios gerenciais, cadastros de produtos ou fornecedores. Tem impacto operacional, mas se der um erro, o sistema não para.

**Como o OML age (Modo Padrão):**
Segue o checklist normal. Uma aprovação para dossiê/design, e outra para implementar.

**Critérios para classificar como Nível 2:**
- [ ] Tela de uso operacional frequente
- [ ] Pode ter filtros, relatórios ou exportações
- [ ] Pode ter permissões moderadas
- [ ] Pode ter escritas no banco
- [ ] Sem impacto assistencial direto
- [ ] Sem integrações financeiras críticas

---

### 🔴 Nível 3 — Alta Criticidade (Fluxo Estrito)

**O que é:**
Prontuário eletrônico, faturamento, controle de estoque crítico, agendamento médico, gestão de permissões/perfis, telas com CPF/dados sensíveis e integrações com bancos/laboratórios.

**Como o OML age (Modo Cirúrgico):**
Cada microfase exige checklist separado. Proibido agrupar dossiê com plano técnico. Exige plano de Disaster Recovery, modo sombra, conciliação pós-migração e testes extensivos.

**Critérios para classificar como Nível 3:**
- [ ] Dados pessoais ou sensíveis (CPF, dados de saúde)
- [ ] Cálculos financeiros
- [ ] Integrações com sistemas externos
- [ ] Impacto assistencial ou clínico
- [ ] Gestão de permissões
- [ ] Faturamento, cobranças ou emissão fiscal
- [ ] Agendamento ou atendimento
- [ ] Jobs ou filas críticas
- [ ] Histórico médico

---

## Classificação operacional por módulo

| Módulo | Classificação sugerida |
|---|---|
| Prontuário | 🔴 Crítico assistencial |
| Agendamento | 🔴 Crítico operacional |
| Faturamento | 🔴 Crítico financeiro |
| Permissões/Perfis | 🔴 Crítico de segurança |
| Estoque | 🟡 Operacional moderado |
| Relatórios gerenciais | 🟡 Moderado |
| Cadastro de pacientes | 🔴 Crítico (dados sensíveis) |
| Cadastro de fornecedores | 🟡 Moderado |
| Configurações de cores | 🟢 Baixo impacto |
| Tipos de documentos | 🟢 Baixo impacto |
| Tema visual | 🟢 Baixo impacto |

---

## Exemplo de interação

### Tela simples (Fluxo Expresso)

```
Você: /migracao-analisar-tela /configuracoes/cores-etiquetas

OML: Análise rápida concluída. Esta tela lida apenas com um CRUD simples
em uma tabela auxiliar sem integrações.

Classificação: 🟢 Nível 1 (Baixa Criticidade).
Ativando Fluxo Expresso.

Abaixo segue o Dossiê, o Protótipo e o Plano de Implementação.
Deseja autorizar a implementação do pacote completo?
```

### Tela crítica (Fluxo Estrito)

```
Você: /migracao-analisar-tela /faturamento/fechar-convenio

OML: Atenção: Esta tela afeta dados financeiros, possui integrações
via API com convênios e escrita pesada no banco.

Classificação: 🔴 Nível 3 (Alta Criticidade).
Ativando Fluxo Estrito.

Para garantir segurança, não gerarei plano de implementação agora.
Aqui está apenas o Dossiê Funcional focado nas regras de negócio
financeiras. Leia atentamente.

Confirma que este dossiê cobriu todas as regras antes de eu
pensar na arquitetura técnica?
```

---

## Regra de ouro

**Se houver dúvida sobre a classificação, classifique como Alta Criticidade (🔴 Nível 3).**

É melhor ser rigoroso demais do que perder uma regra crítica.

---

## Guardião responsável

Guardião de Criticidade e Triagem

Este guardião deve ser consultado no início de cada análise de tela para definir o fluxo adequado.
