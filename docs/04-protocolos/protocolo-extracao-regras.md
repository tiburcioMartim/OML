# Protocolo de Extração de Regras de Negócio

Procedimento da Fase 04.5 / `/migracao-extrair-regras`. Produz o ledger `memoria/regras-negocio/{slug}.md` (template em `docs/05-templates/ledger-regras-negocio.template.md`).

## Princípio

Separar **o que vale** (a regra — aqui) de **o que existe** (a estrutura técnica — Fase 05). A investigação alimenta e é alimentada pelo ledger, mas são saídas separadas com gates separados. Investigação sem regras destiladas → dossiê genérico.

**Regra de rigor:** *só se migra o que se entende.* Cada detalhe — cada input, cada query, cada side-effect — precisa de origem rastreada (`arquivo:linha`). Detalhe sem origem = 🟡 Hipótese e vira pendência de investigação; a unidade não avança para o dossiê com lacunas.

## Unidade legada (escopo)

A extração não cobre só **telas**. Toda **unidade legada** que executa regra de negócio é rastreável, com seu próprio ledger:
🖥️ `tela` · 🔌 `endpoint`/API · ⚙️ `job`/cron · 🧮 `processamento`/batch · 📄 `relatório`.

O `tipo de unidade` é registrado na Identificação do ledger. Endpoints/jobs/processamentos entram no backlog como itens próprios (campo de tipo), não como apêndice de uma tela.

## Estado funcional da unidade

Antes das regras, dar um **veredito sobre a unidade inteira** (evidência obrigatória, nunca suposição):
- ✔️ **Funciona** · ⚠️ **Funciona com quirk** · ❌ **Quebrada** (citar o erro reproduzível) · 💀 **Código morto** (uso real = 0 e/ou inalcançável — **confirmar com o dev**, cruzar com `docs/03-guardioes/guardiao-mapa-uso-backlog.md`).
- ❌/💀 são **decisão do dev** (corrigir × replicar × descartar) → `memoria/decisoes.md`. O agente nunca descarta nem "conserta" sozinho.

## Passos

1. **Localizar o código da unidade.** A partir do ponto de entrada mapeado nas Fases 02–03 (URL/rota/comando/agendamento → controller/handler), seguir: requests/validações, models, services/actions, views, queries SQL, eventos/jobs.
2. **Varrer por tipo de regra:**
   - `validação` — FormRequests, `required`, regex, regras condicionais
   - `cálculo` — somas, percentuais, conversões de unidade, agregações SQL
   - `fluxo` — máquinas de estado, if/else de negócio, ordem de etapas
   - `permissão` — gates, policies, checagens de papel/setor
   - `side-effect` — disparos de e-mail, jobs, gravação em log, atualização de outra tabela
   - `temporal` — prazos, expiração, fuso, agendamento
   - `integração` — chamadas externas e seus contratos/falhas
   - `mensagem` — textos de erro/sucesso que carregam regra
   - `default` — valores padrão implícitos
   - `quirk` — comportamento estranho (ver passo 4)
3. **Citar a origem** de cada regra: `arquivo:linha` (ou query SQL / URL / "validação humana"). Citação direta é obrigatória. Sem evidência → status 🟡 Hipótese.
3a. **Mapear a linhagem de dados de cada input.** Para cada campo/input: como popula (load × submit × calculado), **de onde vem o dado** (tabela.coluna · query · endpoint · sessão · request · hardcode · cálculo · storage), qual **query** o alimenta e suas dependências/filtros. Preencher a tabela "Mapa de inputs e linhagem de dados" do ledger. Input sem origem rastreada = 🟡 Hipótese → pendência.
3b. **Catalogar as queries.** Cada SQL relevante na seção "Queries": o que faz, tabelas, se escreve, origem citada e se é quirk (GROUP BY sem ORDER BY, JOIN sem índice, etc.).
4. **Tratar quirks (anti-alucinação).** Comportamentos como `GROUP BY` sem `ORDER BY` (linha indeterminada), cálculo dividindo por 100 com dados já em unidade base, input hidden duplicado, etc.:
   - Marcar 🟠 **Possível bug — perguntar ao dev** e registrar em `memoria/pendencias.md`.
   - **Nunca** reproduzir como regra confirmada nem "corrigir" por conta própria.
   - Se o dev confirmar que é proposital → 🔴 **Bug intencional**, reproduzir com registro em `decisoes.md`.
5. **Definir o modo:** 🟦 Legado / 🟩 Greenfield / 🟪 Híbrido. Greenfield e híbrido exigem registro em `memoria/decisoes.md` (origem = decisão do dev; citar tela análoga quando houver).
6. **Multi-app.** Se a regra é usada por 2+ apps: definir o **app dono** (o que escreve) e listar os **apps que leem** (referenciam, não duplicam). Divergência entre apps → pendência prioritária. Ver `memoria/regras-negocio/_README.md`.
7. **Desenhar o fluxograma das regras** (Mermaid) na seção "Fluxo das regras" do ledger: entradas → validações → cálculos → decisões → side-effects → saída, usando os IDs `RN-{slug}-NN` nos nós. Este diagrama alimenta o Atlas.
8. **Fechar com resumo breve** (🟡): estado funcional da unidade + contagem por status + lista de 🟠 que aguardam o dev.

## Atlas de Fluxos de Regras

Os fluxogramas e estados de todas as unidades são agregados no **Atlas** (`memoria/atlas-regras-negocio.md`, template `docs/05-templates/atlas-regras-negocio.template.md`), gerado por `/migracao-gerar-atlas-regras` — a visão ampla do negócio do legado para o dev. O atlas é **espelho** dos ledgers; nunca inventa fluxo.

## Ciclo de vida do ledger

- **Criação:** Fase 04.5.
- **Consulta:** Fases 05–06 (focam investigação e dossiê), 10–13 (implementação fiel), 14 (paridade).
- **Mudança vs. legado:** sempre registrada em `memoria/decisoes.md`, referenciada na coluna "Decisão" do ledger.
- **Persistência:** o ledger sobrevive ao fim da migração — fonte da verdade consultável.

## Gate

`/migracao-gerar-dossie [ID]` **aborta** se `memoria/regras-negocio/{slug}.md` não existir. Ver `docs/04-protocolos/protocolo-gates-validacao.md`.
