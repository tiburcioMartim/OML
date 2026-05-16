# Relatório de Aprimoramento do Agente

<!-- Registrar melhorias sugeridas para o OML -->

| Data | Problema | Classificação | Sugestão | Prioridade |
|---|---|---|---|---|
| 2026-05-16 | OML não oferecia opção de uso com Docker | Ambiente | Apresentar opções (local, Docker, a definir) com prós/contras e perguntar preferência do dev | Média |
| 2026-05-16 | OML não aproveitava o .env do legado para alinhar configurações | Configuração | Pedir autorização para analisar o .env do legado, mapear variáveis automaticamente e sugerir .env.example | Alta |
| 2026-05-16 | OML não coletava dados do dev (nome, email, repo) durante o fluxo | Rastreabilidade | Perguntar nome, email e URL do repositório no início da configuração do projeto | Alta |
| 2026-05-16 | OML não buscava logomarcas do legado e arriscava usar logos aleatórias | Design | Buscar logos locais e URLs externas (R2, S3, CDN) no legado, documentar e usar nos protótipos — nunca inventar | Alta |
| 2026-05-16 | OML fazia perguntas técnicas que devs novatos não saberiam responder | Princípio | OML deve pedir autorização, investigar sozinho, sugerir opções concretas e perguntar a preferência — nunca esperar conhecimento técnico do dev | Crítica |
| 2026-05-16 | OML não definia biblioteca de ícones e não orientava o dev sobre opções | Design | Sugerir bibliotecas de ícones compatíveis com a stack (ex: Heroicons/Lucide para Vue 3), apresentar prós/contras e registrar a escolha no perfil | Alta |
| 2026-05-16 | OML parava em toda fase pedindo autorização, esgotando o dev | Autonomia | Reestruturar para 2 Gates (Design System + Homologação), fluxo autônomo no meio. 3 níveis: 🟢 Autônomo, 🟡 Resumo, 🔴 Crítico | Crítica |
| 2026-05-16 | Gate 1 (Design System) não exigia TODOS os componentes de uma vez | Design | Obrigar construção de absolutamente todos os componentes (menus, sidebar, topbar, botões, inputs, tabelas, modais, etc.) antes de prosseguir | Crítica |
| 2026-05-16 | Riscos geravam relatórios longos que cansavam o dev | Autonomia | Riscos devem ser uma lista breve, pouco texto, sem parar. Só eleva para 🔴 se for segurança do paciente ou financeiro | Alta |
| 2026-05-16 | OML se desviava do fluxo de migração quando o dev pedia tarefas fora do escopo | Disciplina | OML nunca se desvia do fluxo. Pedidos fora do escopo vão para `memoria/pendencias.md`. Fase por fase, sem pular | Crítica |
| 2026-05-16 | Menu era criado manualmente e não refletia o progresso da migração | Design | Menu gerado a partir do backlog: telas pendentes com texto claro (disabled), telas migradas com texto escuro e rota (ativo). Menu na página de Design System | Crítica |
