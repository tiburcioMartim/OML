# Comandos Oficiais do OML

## Objetivo

Listar e explicar todos os comandos disponíveis no OML.

## Quando usar

Sempre que precisar saber qual comando usar em determinada situação.

---

## Lista completa de comandos

| Comando | Quando usar | O que faz |
|---|---|---|
| `/migracao-ativar` | No início do projeto | Inicia o OML, detecta o modo, sincroniza memória e carrega regras |
| `/migracao-sincronizar` | Início de sessão / sob demanda | Varre o código real e sincroniza `memoria/` (telas, componentes, scaffolds) |
| `/migracao-configurar-projeto` | Após ativar | Define modo, perfil, stack e políticas |
| `/construir-capturar-requisitos` | Construção/Híbrido, por feature | Captura requisitos e gera a fonte de verdade da feature nova |
| `/migracao-descobrir-telas` | Migração/Híbrido — descoberta | Encontra telas do legado automaticamente |
| `/migracao-carregar-urls` | Complemento manual | Adiciona URLs manualmente |
| `/migracao-gerar-mapa-hierarquico` | Após descoberta | Organiza telas por hierarquia |
| `/migracao-extrair-regras` | Por tela, antes de analisar (Fase 04.5) | Destila regras de negócio no ledger `regras-negocio/{slug}.md` |
| `/migracao-analisar-tela` | Para cada tela | Investiga o que existe (técnico) de uma tela |
| `/migracao-gerar-dossie` | Após análise | Gera dossiê funcional completo (gate duro: exige o ledger de regras) |
| `/migracao-propor-interface` | Após dossiê | Propõe protótipo visual |
| `/migracao-planejar-implementacao` | Após protótipo | Cria plano técnico |
| `/migracao-autorizar-implementacao` | Quando pronto | Libera para codificação |
| `/migracao-revisar-paridade` | Após implementação | Compara legado x novo |
| `/migracao-homologar` | Após paridade | Homologa com usuário |
| `/migracao-auditar-padroes` | A qualquer momento | Audita padrões do repositório |
| `/migracao-gerar-relatorio-aprimoramento` | Periodicamente | Gera relatório de melhorias |
| `/migracao-status` | A qualquer momento | Mostra status geral |
| `/migracao-proxima-tela` | Após concluir uma tela | Avança para a próxima |
| `/migracao-bloquear` | Quando necessário | Bloqueia uma tela/módulo |
| `/migracao-retomar` | Após bloqueio | Retoma tela bloqueada |

---

## Regras gerais

1. Cada comando documenta: quando usar, o que faz, o que não faz, arquivos que atualiza, exemplo e próximo passo.
2. Nenhum comando de implementação pode ser executado sem autorização prévia.
3. Comandos de investigação e documentação podem ser executados livremente.
4. Comandos com **gate duro** abortam com mensagem se o artefato da fase anterior não existir (ver `docs/04-protocolos/protocolo-gates-validacao.md`). Gate duro > convenção implícita.
5. Os comandos de **descoberta/paridade do legado** (`descobrir-telas`, `carregar-urls`, `gerar-mapa-hierarquico`, `analisar-tela`, `extrair-regras`, `revisar-paridade`) só se aplicam em modo **migração/híbrido**. Em modo **construção**, a fonte de verdade vem de `/construir-capturar-requisitos`. Os demais comandos (configuração, propor-interface, planejar/autorizar implementação, homologar, auditar, status) são compartilhados entre os modos (ver `docs/00-visao-geral/politica-modos-projeto.md`).
