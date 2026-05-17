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

- Dark mode e light mode **não são opcionais** — são nativos do sistema desde o primeiro componente.
- **Estratégia Tailwind:** Utilizar `darkMode: 'class'`. O controle do tema é feito adicionando/removendo a classe `.dark` no elemento raiz (`<html>`).
- **Mapeamento Exaustivo:** Todo novo componente criado **deve** possuir as classes `dark:` mapeadas e emparelhadas com as cores do tema claro (Ex: `bg-white dark:bg-surface-900`, `text-surface-900 dark:text-white`).
- **Sincronização com o SO:** Detectar nativamente a preferência do usuário via `window.matchMedia('(prefers-color-scheme: dark)')` como padrão inicial.
- **Prevenção de FOUC (Flash of Unstyled Content):** É obrigatório a injeção de um script inline mínimo diretamente no `<head>` do arquivo base (ex: `app.blade.php`). Este script deve ler o `localStorage` e aplicar a classe `.dark` *antes* da renderização da página.
- A troca de tema deve ser instantânea, sem flashes ou quebras visuais.
## Página de Acompanhamento da Migração

- O novo sistema deve incluir uma **página dedicada** para acompanhar o andamento da migração
- A página deve exibir: progresso geral, lista de telas com status, filtros, histórico de atividades
- Os dados devem ser alimentados automaticamente pelo `memoria/backlog-telas.yaml`
- A página deve estar acessível pelo menu do sistema (não escondida)

