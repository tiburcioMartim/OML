# /migracao-mapear-seguranca

## Objetivo

Investigar e registrar a **postura de segurança** de uma tela/endpoint nos **10 eixos** (E1–E10) ancorados em OWASP Top 10:2025 / API 2023 / ASVS 5.0 / CWE Top 25:2025, com evidência de código, e gravá-la no ledger persistente `memoria/seguranca/{slug}.md` — com o mapeamento fiel para o novo sistema (migração) ou o desenho seguro de berço (greenfield). Torna o OML um especialista que **cita padrão**, não que "acha".

## Quando usar

Por tela, na investigação (Fase 05) e no mapeamento de riscos (Fase 08). **Migração/híbrido:** investiga o legado (preservar+elevar). **Construção:** trilha greenfield (threat model + controles de berço), origem em `decisoes.md`.

## Validação obrigatória de pré-requisitos (Gate duro)

> ⛔ **Se o Gate 1 (Fase 04 — Design System) não tiver sido aprovado, ABORTAR:**
> "Gate bloqueado: o Design System (Fase 04) precisa ser aprovado antes de mapear segurança. Conclua a Fase 04 e obtenha o 'sim' explícito do dev."

Ver `docs/04-protocolos/protocolo-gates-validacao.md`.

## Entradas esperadas

ID ou slug da tela. Exemplo: `/migracao-mapear-seguranca TELA-0001`

## Ações obrigatórias

- [ ] Seguir `docs/04-protocolos/protocolo-investigacao-seguranca.md` e o `docs/03-guardioes/guardiao-seguranca.md`
- [ ] Criar/atualizar o ledger a partir de `docs/05-templates/ledger-seguranca.template.md`
- [ ] Avaliar os **10 eixos** (E1–E10) com **status + origem citada (`arquivo:linha`) + âncora OWASP/CWE**
- [ ] **E1** remeter ao ledger de permissões; focar IDOR/BOLA, endpoint admin exposto, Policy/authorize ausente
- [ ] **E3** caçar `whereRaw`/`DB::raw` concatenado, `{!! !!}`/`v-html`, shell/eval; confirmar escaping
- [ ] **E5** cifragem em repouso/trânsito de dado sensível, `APP_KEY`, minimização, mascaramento (LGPD)
- [ ] **E6/E7/E8** config/headers/CORS/storage · rate limit/SSRF/inventário · deps/upload/integridade
- [ ] **E9/E10** trilha de acesso a prontuário + log sem dado sensível · fail-safe + transações atômicas
- [ ] Marcar o **nível ASVS** (L2 piso; **L3** nos fluxos com dado de saúde)
- [ ] **Mapear para o novo** o controle equivalente + evidência de que **não rebaixa** vs. legado
- [ ] **Veredito:** não rebaixa · fail-safe · dado de saúde em L3 · segredos fora do código
- [ ] **Self-healing:** dado investigável faltando → investigar, preencher e seguir
- [ ] Atualizar a **matriz** `memoria/seguranca/matriz-seguranca.md`
- [ ] Status ∈ {✅ OK, 🟡 Risco/hipótese, 🟠 Aberto, 🔴 Crítico}

## Ações proibidas

- [ ] Presumir "seguro" sem evidência (sem confirmação → investigar / 🟡)
- [ ] **Inventar vulnerabilidade** ou "confirmar" exploit sem execução/evidência (sem ambiente vivo → 🟡)
- [ ] **Rebaixar** qualquer controle do legado (rebaixamento = 🔴 → decisão do dev)
- [ ] Cobrir só XSS/SQLi e ignorar os demais eixos (auth, cripto, config, API, integridade, log, erros)
- [ ] Expor `APP_KEY`/segredo, ou registrar dado sensível/credencial no ledger ou em log
- [ ] Não implementar código (este comando só investiga e registra)
- [ ] Aplicar mudança que rebaixa segurança (🔴) sem decisão explícita do dev em `decisoes.md`

## Arquivos que atualiza

- `memoria/seguranca/{slug}.md` (ledger)
- `memoria/seguranca/matriz-seguranca.md` (matriz global)
- `memoria/pendencias.md` (achados 🟠/🟡 a validar ao vivo)
- `memoria/decisoes.md` (rebaixamentos/mudanças 🔴)
- `memoria/riscos.md` (riscos de segurança da Fase 08)
- `memoria/backlog-telas.yaml` (campo `seguranca: mapeada`)

## Checklist de conclusão

- [ ] Ledger salvo, 10 eixos avaliados com âncora
- [ ] Nível ASVS marcado (L3 confirmado onde há dado de saúde)
- [ ] Achados com origem citada; sem alucinação de vulnerabilidade
- [ ] Mapeamento para o novo + prova de não-rebaixamento
- [ ] Veredito preenchido; 🔴 em `decisoes.md`; 🟠/🟡 em `pendencias.md`
- [ ] Matriz de segurança atualizada

## Frase obrigatória de encerramento

"Mapa de segurança da tela [NOME] concluído: [N] achados (✅ [n] · 🟡 [n] · 🟠 [n] · 🔴 [n]). Eixos: [cobertos]. Nível ASVS: [L2/L3]. Veredito: não rebaixa [✓/✗] · fail-safe [✓/✗] · dado de saúde protegido [✓/✗/N/A]. [apto ao Gate 2 / falta: …]"

## Próximo passo

`/migracao-gerar-dossie [ID]` (consome este ledger). Em tela de alta criticidade, o Gate 2 (`/migracao-homologar`) tem **gate duro 🔴** no veredito de segurança. Threat model de alta criticidade: estressar com `/adversario` antes de fechar.
