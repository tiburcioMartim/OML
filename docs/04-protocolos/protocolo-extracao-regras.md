# Protocolo de Extração de Regras de Negócio

Procedimento da Fase 04.5 / `/migracao-extrair-regras`. Produz o ledger `memoria/regras-negocio/{slug}.md` (template em `docs/05-templates/ledger-regras-negocio.template.md`).

## Princípio

Separar **o que vale** (a regra — aqui) de **o que existe** (a estrutura técnica — Fase 05). A investigação alimenta e é alimentada pelo ledger, mas são saídas separadas com gates separados. Investigação sem regras destiladas → dossiê genérico.

## Passos

1. **Localizar o código da tela.** A partir do ponto de entrada mapeado nas Fases 02–03 (URL → rota → controller), seguir: requests/validações, models, services/actions, views, queries SQL, eventos/jobs.
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
4. **Tratar quirks (anti-alucinação).** Comportamentos como `GROUP BY` sem `ORDER BY` (linha indeterminada), cálculo dividindo por 100 com dados já em unidade base, input hidden duplicado, etc.:
   - Marcar 🟠 **Possível bug — perguntar ao dev** e registrar em `memoria/pendencias.md`.
   - **Nunca** reproduzir como regra confirmada nem "corrigir" por conta própria.
   - Se o dev confirmar que é proposital → 🔴 **Bug intencional**, reproduzir com registro em `decisoes.md`.
5. **Definir o modo:** 🟦 Legado / 🟩 Greenfield / 🟪 Híbrido. Greenfield e híbrido exigem registro em `memoria/decisoes.md` (origem = decisão do dev; citar tela análoga quando houver).
6. **Multi-app.** Se a regra é usada por 2+ apps: definir o **app dono** (o que escreve) e listar os **apps que leem** (referenciam, não duplicam). Divergência entre apps → pendência prioritária. Ver `memoria/regras-negocio/_README.md`.
7. **Fechar com resumo breve** (🟡): contagem por status e lista de 🟠 que aguardam o dev.

## Ciclo de vida do ledger

- **Criação:** Fase 04.5.
- **Consulta:** Fases 05–06 (focam investigação e dossiê), 10–13 (implementação fiel), 14 (paridade).
- **Mudança vs. legado:** sempre registrada em `memoria/decisoes.md`, referenciada na coluna "Decisão" do ledger.
- **Persistência:** o ledger sobrevive ao fim da migração — fonte da verdade consultável.

## Gate

`/migracao-gerar-dossie [ID]` **aborta** se `memoria/regras-negocio/{slug}.md` não existir. Ver `docs/04-protocolos/protocolo-gates-validacao.md`.
