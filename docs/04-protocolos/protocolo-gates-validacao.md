# Protocolo de Gates de Validação (Gates Duros)

## Por quê

Instrução textual "antes de X, faça Y" é frequentemente pulada sob pressão de tempo — pelo agente ou pelo dev. **Gate duro > convenção implícita.** O comando da fase posterior **aborta com mensagem explícita** se o artefato da fase anterior não existir.

## Dois tipos de gate

O pré-requisito ausente cai em um de dois tipos — a reação é diferente:

| Tipo | Quando | Reação |
|---|---|---|
| **Gate humano (bloqueante)** | O pré-requisito depende de **pessoa**: aprovação (Gate 1/2) ou decisão sobre 🟠/❌/💀 | **ABORTA** e escala ao dev. Não há "prosseguir mesmo assim". |
| **Gate de completude (auto-resolvível)** | O pré-requisito é **trabalho investigativo do próprio OML** (ledger, linhagem, dossiê) que está ausente/incompleto | **NÃO aborta:** o OML **dispara o pré-requisito automaticamente** (investiga, preenche a memória), e **retoma** a atividade onde parou. |

> Filosofia: o OML **persegue a completude sozinho** e só para por **gente**. Lacuna investigável nunca vira parede — vira trabalho que o agente faz e segue. Isso realiza a meta de cobrir 100% do projeto sem cansar o dev.

## Mecanismo

Todo comando crítico abre com uma seção **"Validação obrigatória de pré-requisitos"**. Antes de qualquer ação, o OML verifica o pré-requisito:

- **Pré-requisito satisfeito** → prossegue normalmente.
- **Gate humano ausente** → **ABORTA**, exibe a mensagem apontando a aprovação/decisão que falta, e não executa nada.
- **Gate de completude ausente/incompleto** → **auto-resolve**: executa o comando-pré-requisito (ex.: extração de regras), preenche a memória e **continua** — registrando ao dev, em resumo breve, o que precisou investigar.

Marcadores de aprovação humana (Gates 🔴) ficam em `memoria/gates/`:
- `memoria/gates/gate-1-design-system.md` — criado quando o dev aprova a Fase 04.
- `memoria/gates/gate-2-homologacao-{slug}.md` — criado quando o dev homologa a tela (Fase 15).

## Gates canônicos

| Comando / Fase | Pré-requisito | Tipo | Reação se ausente |
|---|---|---|---|
| `/migracao-extrair-regras` (04.5) | `memoria/gates/gate-1-design-system.md` | 👤 Humano | ABORTA: "Gate 1 (Design System) não aprovado. Conclua a Fase 04 e obtenha o 'sim' do dev." |
| `/migracao-analisar-tela` (05) | `memoria/gates/gate-1-design-system.md` | 👤 Humano | ABORTA: "Gate 1 (Design System) não aprovado. Nenhuma tela é migrada antes do layout aprovado." |
| `/migracao-gerar-dossie [ID]` (06) | ledger **finalizado** `memoria/regras-negocio/{slug}.md` | 🔄 Completude | **Auto-resolve:** se o ledger faltar ou não estiver *finalizado*, dispara `/migracao-extrair-regras [ID]` (investiga e completa), depois gera o dossiê. Só escala ao dev o que for 🟠/❌/💀. |
| `/migracao-planejar-implementacao [ID]` (10) | dossiê da tela | 🔄 Completude | Auto-resolve: gera o dossiê (que por sua vez auto-resolve o ledger) e segue. |
| `/migracao-autorizar-implementacao [ID]` (12) | plano + plano de testes | 🔄 Completude → 👤 Humano | Auto-resolve plano/testes; a **autorização** em si é gate humano (Gate de implementação). |

> Mudança vs. versão anterior: o gate do dossiê deixou de **abortar** por ledger ausente — agora **auto-completa** a extração e segue. O agente persegue a completude; só **gente** o detém.

## Regras

- **Gate humano** é bloqueante, não um aviso. Não há "prosseguir mesmo assim" automático. A mensagem de abort nomeia a aprovação/decisão que falta. Exige "sim" explícito do dev (ver `docs/00-visao-geral/politica-autonomia.md`); só então o marcador em `memoria/gates/` é criado.
- **Gate de completude** nunca vira parede: o OML executa o pré-requisito investigativo e retoma, registrando em resumo breve o que precisou completar.
- Auto-resolução **não inventa**: se a completude depender de um dado que não existe ou de uma decisão (🟠/❌/💀), aí sim vira pendência/decisão do dev.
