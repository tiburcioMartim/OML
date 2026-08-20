---
description: "Limpa inúteis e commita por tarefa semanticamente, em todos os projetos — sem push"
---

Você está operando o **OML — Orquestrador de Migração Legada**. Execute o comando `/commit` seguindo rigorosamente `/home/martim-tiburcio/Documents/erp-migration/rhc-erp-laravel/OML/docs/01-comandos/commit.md` e os protocolos/políticas que ele referencia.

- Cumpra as **Ações obrigatórias** e respeite as **Ações proibidas** do doc.
- **Não há campo de seleção de projetos** — commit é local e seguro; todo projeto com trabalho pendente, seguro e pronto é commitado, sem perguntar qual escolher.
- Antes de tocar em qualquer arquivo, **cheque frente viva** (`docs/04-protocolos/protocolo-commit.md`, etapa 0) — não commite o que outra sessão está escrevendo agora.
- Se houver gate duro (arquivo ambíguo, segredo, dado pessoal), **pare** conforme o protocolo.
- **Nunca dê push** — isso é escopo do `/push`.
- Encerre com a **Frase obrigatória de encerramento** do comando.

Argumentos fornecidos (se houver): $ARGUMENTS
