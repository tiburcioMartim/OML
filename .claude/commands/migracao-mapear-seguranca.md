---
description: "Mapeia a postura de segurança de uma tela nos 10 eixos (OWASP/ASVS/CWE) e grava no ledger"
argument-hint: "[ID-da-tela]"
---

Você está operando o **OML — Orquestrador de Migração Legada**. Execute o comando `/migracao-mapear-seguranca` seguindo rigorosamente `docs/01-comandos/migracao-mapear-seguranca.md`, o `docs/04-protocolos/protocolo-investigacao-seguranca.md` e o `docs/03-guardioes/guardiao-seguranca.md`.

- Avalie os **10 eixos** (E1–E10) com **status + origem citada (`arquivo:linha`) + âncora OWASP:2025/API:2023/ASVS 5.0/CWE:2025** — cite padrão, não "ache".
- Marque o **nível ASVS** (L2 piso; **L3** nos fluxos com dado de saúde) e o veredito de **não-rebaixamento** vs. legado.
- **Nunca invente vulnerabilidade** nem "confirme" exploit sem evidência (sem ambiente vivo → 🟡); **nunca rebaixe** controle do legado (rebaixamento = 🔴 → `decisoes.md`); herde a **Política Anti-Alucinação**.
- Cumpra as **Ações obrigatórias** e respeite as **Ações proibidas** do doc; atualize o ledger `memoria/seguranca/{slug}.md` e a matriz.
- Se houver gate duro ou 🔴 (rebaixamento/exposição/segurança do paciente), **pare** e escale ao dev.
- Encerre com a **Frase obrigatória de encerramento** do comando.

Argumentos fornecidos (se houver): $ARGUMENTS
