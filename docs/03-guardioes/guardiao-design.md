# Guardião de Design

## Missão
Criar Página Visual, definir tokens, documentar componentes, garantir IDs únicos, impedir decisões visuais isoladas.

## Regra
Todo componente novo deve ser documentado na Página Visual antes de virar padrão.

## Regras adicionais

- Logomarcas devem ser extraídas do legado (arquivos locais ou URLs R2/S3/CDN). Nunca inventar, gerar ou usar placeholders de logo
- Se não encontrar logomarcas no legado, perguntar ao dev antes de prosseguir
- Toda logomarca utilizada deve estar registrada em `memoria/inventario-logomarcas.md`
- A biblioteca de ícones deve ser sugerida pelo OML com base na stack do projeto — apresentar opções compatíveis e deixar o dev escolher
- Todos os ícones do projeto devem vir da biblioteca escolhida — nunca misturar fontes de ícones diferentes
- Registrar a biblioteca escolhida no perfil do projeto

## Componentes flutuantes e de apoio obrigatórios

Estes componentes devem existir desde a criação da Página Visual Base e estar presentes em **TODAS** as páginas do sistema:

- **Menu de Acessibilidade Fixo (Topbar):** A Topbar deve incluir um botão (ex: ícone ♿) provendo acesso com 1 clique a um dropdown de troca de tema (Claro, Escuro, Sistema) gerenciado globalmente.
- **Botão de Acessibilidade (widget flutuante):** posição fixa, abre painel com alto contraste, ajuste de fonte, redução de movimento. Deve ser facilmente visível e acessível por teclado.
- **Botão Rolar para Cima (Scroll to Top):** aparece após scroll, executa scroll suave, acessível por teclado.
- **Toggle Dark/Light Mode:** nativo do sistema, respeita `prefers-color-scheme`, persiste escolha do usuário, transição suave sem flash.

## Tema nativo (Dark/Light Mode)

Dark e light são nativos do sistema desde o primeiro componente e derivam dos tokens centralizados (nunca cores hardcoded). A especificação completa é mantida em fonte única: ver [guardião de tema dark/light](guardiao-tema-dark-light.md).

## Página de Acompanhamento do Andamento

- O novo sistema deve incluir uma **página dedicada** para acompanhar o andamento (obrigatória em todos os modos)
- Conteúdo por modo: **Migração** → telas migradas vs. pendentes; **Construção** → features construídas vs. planejadas; **Híbrido** → ambas, separadas por origem
- A página deve exibir: progresso geral, lista de itens com status, filtros, histórico de atividades
- Os dados devem ser alimentados automaticamente pelo `memoria/backlog-telas.yaml`
- A página deve estar acessível pelo menu do sistema (não escondida)

