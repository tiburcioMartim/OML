# OML — Orquestrador de Migração Legada

O OML ajuda desenvolvedores a modernizar sistemas legados com segurança, documentação, testes, padronização e controle por fases.

Ele investiga o sistema legado, cria documentação, identifica regras de negócio, mapeia banco, permissões, integrações, riscos, propõe melhorias e **trabalha de forma autônoma**, parando somente em **2 pontos de aprovação** (Gates).

---

## Para que serve?

Serve para migrar sistemas antigos para uma estrutura moderna sem perder regras de negócio, permissões, integrações, dados, segurança e padrões visuais.

---

## Como começar

1. Instale ou copie o OML no seu projeto.
2. Inicie com:

```
/migracao-ativar
```

3. Informe uma URL inicial ou peça para o OML descobrir as telas automaticamente.
4. O OML conduzirá a migração por etapas.
5. Você validará decisões e autorizará avanços quando necessário.

---

## Ele codifica sozinho?

**Sim, após o Design System ser aprovado.**

O OML trabalha de forma autônoma e cadenciada. Ele só para em 2 momentos:
- **Gate 1 (Design System):** Você aprova o layout e componentes antes da primeira tela.
- **Gate 2 (Homologação):** Você testa e aprova cada tela migrada.

---

## Como funciona?

O OML trabalha com **autonomia inteligente** e **2 Gates de aprovação**:

1. 🟢 Investiga o legado (autônomo)
2. 🟢 Documenta regras de negócio (autônomo)
3. 🟢 Mapeia banco, permissões, integrações (autônomo)
4. 🔴 **GATE 1 — Você aprova o Design System e layout completo**
5. 🟢 Investiga, planeja e implementa cada tela (autônomo corrido)
6. 🔴 **GATE 2 — Você testa e aprova a tela migrada**
7. 🟢 Próxima tela (repete 5-6)
8. 🟢 Guardião contínuo pós-migração

---

## Comandos principais

| Comando | Descrição |
|---|---|
| `/migracao-ativar` | Inicia o OML no projeto |
| `/migracao-descobrir-telas` | Descobre automaticamente as telas do legado |
| `/migracao-analisar-tela` | Analisa uma tela específica |
| `/migracao-gerar-dossie` | Gera dossiê funcional da tela |
| `/migracao-propor-interface` | Propõe protótipo visual |
| `/migracao-planejar-implementacao` | Cria plano técnico |
| `/migracao-autorizar-implementacao` | Autoriza a codificação |
| `/migracao-revisar-paridade` | Compara legado x novo |
| `/migracao-homologar` | Homologa com o usuário |
| `/migracao-auditar-padroes` | Audita padrões pós-migração |
| `/migracao-status` | Mostra o status atual |
| `/migracao-proxima-tela` | Avança para a próxima tela |

Para documentação completa de cada comando, consulte [docs/01-comandos/](docs/01-comandos/).

---

## Estrutura do projeto

```
docs/
  00-visao-geral/     → Filosofia, regras, políticas
  01-comandos/         → Documentação de cada comando
  02-fases/            → Protocolos de cada fase da migração
  03-guardioes/        → Regras por domínio técnico
  04-protocolos/       → Procedimentos operacionais
  05-templates/        → Modelos reutilizáveis
  06-perfis/           → Perfis por stack e projeto
memoria/               → Memória operacional do agente
```

---

## Idioma

Todo o OML opera em **português do Brasil**:
- Documentação, comandos, templates, relatórios, guardiões, fases, status, exemplos e instruções.

---

## Licença

MIT — consulte [LICENSE](LICENSE).

---

## Contribuição

Consulte [CONTRIBUTING.md](CONTRIBUTING.md) para saber como contribuir.
