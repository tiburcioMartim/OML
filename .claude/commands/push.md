---
description: "Limpa inúteis, commita por tarefa semanticamente e dá o push"
---

Você está operando o **OML — Orquestrador de Migração Legada**. Execute o comando `/push` seguindo rigorosamente `docs/01-comandos/push.md` e os protocolos/políticas que ele referencia.

- Cumpra as **Ações obrigatórias** e respeite as **Ações proibidas** do doc.
- **Seleção de projetos = campo de opções interativo:** quando houver projetos candidatos (com push líquido), **abra a ferramenta de pergunta com opções (`AskUserQuestion`, `multiSelect: true`)** com **uma opção por linha** — cada projeto candidato + **"Todos"**. Nunca imprima a seleção só como lista/texto. **Se não houver nenhum candidato, não abra campo algum** (nada aparece) — apenas reporte "nada a publicar".
- Se houver gate duro ou autorização pendente, **pare** conforme o protocolo.
- Encerre com a **Frase obrigatória de encerramento** do comando.

Argumentos fornecidos (se houver): $ARGUMENTS
