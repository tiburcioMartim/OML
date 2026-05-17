# Fase 00 — Preparação e Governança

## Autonomia: 🟡 Resumo

O OML executa toda a preparação e apresenta um resumo ao final para o dev confirmar.

## Objetivo

Criar as regras, padrões, limites e documentos essenciais antes de qualquer migração.

## Quando usar

No início absoluto do projeto. Antes de investigar qualquer tela.

## Entradas esperadas

Acesso ao responsável pelo projeto para responder perguntas sobre stack, banco, design, segurança e ambientes.

## Ações obrigatórias

- [ ] **Validar estrutura de workspace** (ver `docs/00-visao-geral/politica-estrutura-workspace.md`)
  - OML, legado e novo sistema devem ser diretórios irmãos
  - Se o OML estiver dentro do legado, propor correção ao dev
  - Perguntar ao dev o nome do diretório do novo sistema e criá-lo como irmão
- [ ] Registrar responsável pela migração (nome + email)
- [ ] Registrar URL do repositório do sistema migrado
- [ ] Definir perfil do projeto
- [ ] Definir stack alvo
- [ ] Definir idioma do código
- [ ] Definir política de banco legado
- [ ] Definir política de segurança
- [ ] Definir política LGPD
- [ ] Definir política de acessibilidade
- [ ] Definir direção visual (entrevista de design — 30 perguntas)
- [ ] Definir padrão de arquitetura
- [ ] Definir padrão de nomenclatura
- [ ] Definir padrão de testes
- [ ] Definir padrão de lint/formatter
- [ ] Definir política de integrações
- [ ] Definir política de auditoria
- [ ] Definir política de observabilidade
- [ ] Definir política de backup/restore
- [ ] Definir política de disaster recovery
- [ ] Definir política de rollback
- [ ] Definir política de feature flags
- [ ] Definir política de documentação
- [ ] Definir política de containerização (apresentar opções Docker vs. local ao dev, com prós/contras)
- [ ] Analisar arquivo `.env` do legado (pedir autorização), mapear variáveis automaticamente e sugerir `.env.example` para o novo projeto
- [ ] Documentar ambientes reais do projeto
- [ ] Criar templates oficiais

## Ações proibidas

- [ ] Não implementar código
- [ ] Não criar telas
- [ ] Não alterar banco
- [ ] Não assumir respostas sem perguntar

## Arquivos que devem ser atualizados

- `docs/06-perfis/[perfil]/perfil.md`
- `memoria/decisoes.md`

## Checklist de conclusão

- [ ] **Estrutura de workspace validada (diretórios irmãos)**
- [ ] Responsável e repositório registrados
- [ ] Perfil do projeto criado
- [ ] Stack definida
- [ ] Todas as políticas documentadas
- [ ] Direção visual definida
- [ ] Ambiente de execução definido (Docker, local ou a definir)
- [ ] Variáveis do `.env` legado mapeadas e `.env.example` sugerido
- [ ] Ambientes documentados
- [ ] Templates revisados

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a Fase 00 — Preparação e Governança."

## Próximo passo

Fase 01 — Mapeamento Geral do Legado (🟢 segue automaticamente)
