# Protocolo de Gates de Validação (Gates Duros)

## Por quê

Instrução textual "antes de X, faça Y" é frequentemente pulada sob pressão de tempo — pelo agente ou pelo dev. **Gate duro > convenção implícita.** O comando da fase posterior **aborta com mensagem explícita** se o artefato da fase anterior não existir.

## Mecanismo

Todo comando crítico abre com uma seção **"Validação obrigatória de pré-requisitos (Gate duro)"**. Antes de qualquer ação, o OML verifica a existência do artefato exigido:

- **Artefato existe** → prossegue normalmente.
- **Artefato ausente** → **ABORTA imediatamente**, exibe a mensagem do gate apontando o comando que precisa rodar antes, e **não executa nenhuma ação**.

Marcadores de aprovação humana (Gates 🔴) ficam em `memoria/gates/`:
- `memoria/gates/gate-1-design-system.md` — criado quando o dev aprova a Fase 04.
- `memoria/gates/gate-2-homologacao-{slug}.md` — criado quando o dev homologa a tela (Fase 15).

## Gates duros canônicos

| Comando / Fase | Pré-requisito | Aborta se ausente, com mensagem |
|---|---|---|
| `/migracao-extrair-regras` (04.5) | `memoria/gates/gate-1-design-system.md` | "Gate 1 (Design System) não aprovado. Conclua a Fase 04 e obtenha o 'sim' do dev." |
| `/migracao-analisar-tela` (05) | `memoria/gates/gate-1-design-system.md` | "Gate 1 (Design System) não aprovado. Nenhuma tela é migrada antes do layout aprovado." |
| `/migracao-gerar-dossie [ID]` (06) | `memoria/regras-negocio/{slug}.md` | "Falta o ledger de regras da tela [ID]. Rode `/migracao-extrair-regras [ID]` primeiro." |
| `/migracao-planejar-implementacao [ID]` (10) | dossiê da tela | "Falta o dossiê da tela [ID]. Rode `/migracao-gerar-dossie [ID]` primeiro." |
| `/migracao-autorizar-implementacao [ID]` (12) | plano + plano de testes | "Falta plano e/ou plano de testes da tela [ID]. Conclua as Fases 10 e 11." |

> O gate **emblemático** do relatório: `/migracao-gerar-dossie` **aborta** sem `regras-negocio/{slug}.md`. Sem regras destiladas, o dossiê sai genérico.

## Regras

- O gate é **bloqueante**, não um aviso. Não há "prosseguir mesmo assim" automático.
- A mensagem de abort sempre nomeia o **comando exato** que destrava o gate.
- Gates de aprovação humana (🔴) exigem "sim" explícito do dev (ver `docs/00-visao-geral/politica-autonomia.md`); só então o marcador em `memoria/gates/` é criado.
