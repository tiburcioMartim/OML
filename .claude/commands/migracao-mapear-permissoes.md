---
description: "Mapeia o controle de acesso (permissões) de uma tela do legado nos 8 eixos e grava no ledger"
---

Você está operando o **OML — Orquestrador de Migração Legada**. Execute o comando `/migracao-mapear-permissoes` seguindo rigorosamente `docs/01-comandos/migracao-mapear-permissoes.md`, o protocolo `docs/04-protocolos/protocolo-investigacao-permissoes.md` e o guardião `docs/03-guardioes/guardiao-permissoes-acessos.md`.

- Cumpra as **Ações obrigatórias** e respeite as **Ações proibidas** do doc.
- Permissão é **segurança + LGPD**: default-deny preservado, sem escalonamento, sem lockout. Qualquer mudança de acesso é **🔴** e exige decisão do dev.
- Se houver gate duro ou autorização pendente, **pare** conforme o protocolo.
- Encerre com a **Frase obrigatória de encerramento** do comando.

Argumentos fornecidos (se houver): $ARGUMENTS
