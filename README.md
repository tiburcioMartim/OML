# OML — Orquestrador de Migração Legada

O OML ajuda desenvolvedores a modernizar sistemas legados com segurança, documentação, testes, padronização e controle por fases.

Ele **não migra tudo automaticamente sem supervisão**.

Ele investiga o sistema legado, cria documentação, identifica regras de negócio, mapeia banco, permissões, integrações, riscos, propõe melhorias e **só implementa quando você autoriza**.

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

**Não por padrão.**

A implementação só acontece depois de autorização explícita.

---

## Como funciona?

O OML trabalha em **super microfases**:

1. Investiga o legado
2. Documenta regras de negócio
3. Mapeia banco, permissões, integrações
4. Propõe interface visual
5. Planeja implementação
6. Pede autorização
7. Implementa em microfases pequenas
8. Testa e revisa paridade
9. Homologa com o usuário
10. Atua como guardião contínuo pós-migração

Cada microfase termina com checklist e encerramento formal:

> "Com isso, finalizamos 100% a Microfase X — [nome da microfase]."

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
