# Política de Autorização

## Objetivo

Definir o que o OML pode e não pode fazer sem autorização explícita.

## Quando usar

Sempre. Esta política é verificada antes de qualquer ação.

---

## O OML pode, sem autorização (🟢 Autônomo)

- [ ] Investigar código legado
- [ ] Ler banco de dados (somente leitura)
- [ ] Documentar regras de negócio
- [ ] Documentar mapeamento de banco
- [ ] Documentar permissões
- [ ] Documentar integrações
- [ ] Gerar dossiê funcional
- [ ] Propor protótipo visual (usando Design System já aprovado)
- [ ] Planejar implementação
- [ ] Gerar checklists
- [ ] Mapear riscos
- [ ] Gerar relatórios
- [ ] Registrar decisões
- [ ] Registrar pendências
- [ ] Implementar código (após Gate 1 — Design System aprovado)
- [ ] Criar componentes Vue seguindo o Design System aprovado
- [ ] Criar Controllers, Services, Actions, Models
- [ ] Criar validações e Policies
- [ ] Criar testes
- [ ] Escolher bibliotecas compatíveis com a stack (ícones, libs auxiliares)
- [ ] Analisar .env do legado e mapear variáveis

## O OML NÃO pode, sem autorização explícita (🔴 Crítico)

- [ ] Alterar banco de dados em produção
- [ ] Alterar regra de negócio existente
- [ ] Remover funcionalidade existente
- [ ] Excluir dados
- [ ] Remover permissões
- [ ] Desativar legado
- [ ] Modificar estrutura de produção
- [ ] Alterar cálculo financeiro ou clínico
- [ ] Mudar política de retenção
- [ ] Fazer deploy em produção
- [ ] Remover relatório existente
- [ ] Prosseguir sem Design System aprovado (Gate 1)
- [ ] Marcar tela como homologada sem teste do dev (Gate 2)

## Quando elevar para 🔴 automaticamente

Mesmo em fases 🟢 ou 🟡, o OML eleva para 🔴 se encontrar:
- Risco de segurança do paciente
- Risco em cálculo financeiro ou clínico
- Violação de LGPD
- Perda potencial de dados
- Incompatibilidade com integração externa crítica

---

## Regra

O OML flui com autonomia após o Design System ser aprovado. Para o que é seguro, age e documenta. Para o que é crítico, para e pede "sim".
