# Protocolo de Investigação de Segurança

Procedimento de `/migracao-mapear-seguranca [ID]`, executado na investigação da tela (Fase 05) e no mapeamento de riscos (Fase 08). Produz o ledger `memoria/seguranca/{slug}.md` (template `docs/05-templates/ledger-seguranca.template.md`) e alimenta a matriz global de segurança (`memoria/seguranca/matriz-seguranca.md`).

Governado por `docs/03-guardioes/guardiao-seguranca.md`. Cruza com `guardiao-permissoes-acessos.md` (E1), `guardiao-lgpd-privacidade.md` (E5), `guardiao-segredos-credenciais.md` (E6) e `guardiao-seguranca-paciente-risco-operacional.md` (elevação 🔴).

## Princípio

*Só se protege o que se entende, e só se afirma o que se cita.* Cada achado precisa de **origem** (`arquivo:linha`, config, rota, query) **e de âncora** (item OWASP/ASVS/CWE). Sem origem → 🟡 Hipótese → pendência. **Nunca inventar vulnerabilidade nem presumir "seguro" sem evidência.** Herda `docs/00-visao-geral/politica-anti-alucinacao.md`.

> **Segurança é Regra-Mãe #7 + LGPD.** Rebaixar um controle vs. legado, expor dado de saúde, ou tocar segurança do paciente = **🔴 Crítico** (decisão do dev), nunca silencioso.

---

## Referência de padrões (fixa) — o corpus que o agente cita

*Versões confirmadas em 2026-07-17. Estas são as âncoras; um achado sem uma delas é fraco.*

### OWASP Top 10 — **2025** (primária)
`A01:2025` Broken Access Control (**absorve SSRF**) · `A02:2025` Security Misconfiguration · `A03:2025` **Software Supply Chain Failures** (nova) · `A04:2025` Cryptographic Failures · `A05:2025` Injection (**inclui XSS**) · `A06:2025` Insecure Design · `A07:2025` Authentication Failures · `A08:2025` Software or Data Integrity Failures · `A09:2025` Security Logging & Alerting Failures · `A10:2025` **Mishandling of Exceptional Conditions** (nova).
> Mapeamento p/ ferramental antigo (2021): SSRF era `A10:2021`; XSS saiu de categoria própria; A03/A10 são novas; Misconfig subiu p/ #2.

### OWASP API Security Top 10 — **2023**
`API1` BOLA · `API2` Broken Authentication · `API3` Broken Object Property Level Authz (mass assignment) · `API4` Unrestricted Resource Consumption · `API5` Broken Function Level Authz · `API6` Unrestricted Access to Sensitive Business Flows · `API7` SSRF · `API8` Security Misconfiguration · `API9` Improper Inventory Management · `API10` Unsafe Consumption of APIs.

### OWASP ASVS — **5.0.0** (17 capítulos; níveis cumulativos L1⊂L2⊂L3)
V1 Encoding/Sanitization · V2 Validation & Business Logic · V3 Web Frontend · V4 API & Web Service · V5 File Handling · V6 Authentication · V7 Session · V8 Authorization · V9 Self-contained Tokens · V10 OAuth/OIDC · V11 Cryptography · V12 Secure Communication · V13 Configuration · V14 Data Protection · V15 Secure Coding & Architecture · V16 Logging & Error Handling · V17 WebRTC.
> **L2 = piso** da aplicação · **L3 = fluxos com dado de saúde** (prontuário/prescrição/exame/dose).

### CWE Top 25 — **2025** (web-relevantes p/ Laravel/PHP)
`CWE-79` XSS(1) · `CWE-89` SQLi(2) · `CWE-352` CSRF(3) · `CWE-862` Missing Authorization(4) · `CWE-22` Path Traversal(6) · `CWE-78` OS Command Injection(9) · `CWE-94` Code Injection(10) · `CWE-434` Unrestricted Upload(12) · `CWE-918` SSRF · `CWE-502` Deserialization · `CWE-863`/`639` Broken/Improper Authorization.

### Laravel — pitfalls a caçar (com âncora)
| Pitfall | Sintoma no código | OWASP/CWE |
|---|---|---|
| Mass assignment | `Model::create($request->all())` sem `$fillable`; over-post `role`/`is_admin` | A01/API3 · CWE-915/862 |
| SQLi via raw | `DB::raw`/`whereRaw`/`orderByRaw` concatenado | A05 · CWE-89 |
| XSS | `{!! $var !!}` / `v-html` com dado do usuário | A05 · CWE-79 |
| IDOR sem policy | `Model::find($id)` sem `authorize`/escopo por tenant/paciente | A01/API1 · CWE-862/639 |
| Debug em prod | `APP_DEBUG=true` (Ignition expõe env/query) | A02 · CWE-489/209 |
| `APP_KEY` exposto | chave versionada / `.env` público / reuso entre ambientes | A04 · CWE-798/312 |
| Storage público | prontuário/exame servido de `storage/app/public` sem auth | A01/A02 · CWE-552/732 |
| CORS `*`+cookies | `allowed_origins:['*']` com credenciais | A02/API8 · CWE-942 |
| Upload perigoso | extensão/MIME sem validar; servir do webroot | A08/API4 · CWE-434 |
| Rota sem `auth` | endpoint/verbo admin sem middleware | A01/API5 · CWE-306/862 |
| Log sensível | senha/CPF/dado clínico em log/telescope | A09 · CWE-532 |

**Proteções nativas a confirmar presentes:** CSRF (`@csrf`/`VerifyCsrfToken`), Eloquent/bindings (anti-SQLi), `Hash` (Bcrypt/Argon2id), `Crypt`/cast `encrypted` (AES-256-GCM), `$fillable`, Sanctum/Fortify (auth+MFA), Gates/Policies, `RateLimiter`/`throttle`, Signed URLs, `{{ }}` auto-escape, `FormRequest`.

### Domínio hospitalar + LGPD
Dado de saúde é **sensível** (LGPD art. 5º II; tratamento art. 11). Duro:
- Cifragem em repouso (banco/backup/anexo de exame) — art. 46 · CWE-311/312.
- TLS em trânsito, inclusive integrações (RNDS/labs/convênio) — API10.
- Minimização/necessidade (art. 6º III) — não over-fetch de prontuário.
- **Trilha de auditoria de acesso a prontuário** (quem/qual paciente/quando/por quê), imutável — art. 37 · CWE-778.
- Controle por **vínculo assistencial / need-to-know** + segregação por unidade — A01/API1.
- **Segurança do paciente** — integridade de cálculo de dose/prescrição/conversão de unidade; validação server-side — A08/A10 · CWE-682/20.
- Base legal por finalidade (tutela da saúde, art. 11 II 'f'); retenção mínima do prontuário (CFM 1.821/2007 ≈ 20 anos); comunicação de incidente à ANPD/titular (art. 48).

---

## Passos (migração — investigar o que existe)

1. **Localizar a tela/endpoint** (URL/rota legada + arquivo que serve; do mapa das Fases 02–03) e a superfície (rotas, forms, APIs, uploads, integrações).
2. **Percorrer os 10 eixos (E1–E10)** do `guardiao-seguranca.md`. Para cada eixo, com **origem citada + âncora OWASP/CWE**, atribuir status: ✅ OK · 🟡 risco/hipótese · 🟠 aberto (validar) · 🔴 crítico · N/A (com evidência).
3. **E1 Acesso/Autz:** remeter ao ledger de permissões (`permissoes/{slug}.md`); aqui focar **IDOR/BOLA** (objeto por ID sem escopo), endpoint admin exposto, `authorize`/Policy ausente.
4. **E3 Injeção:** grep por `whereRaw`/`DB::raw`/`selectRaw` concatenado, `{!! !!}`/`v-html`, shell/eval; confirmar escaping de saída.
5. **E5 Cripto/LGPD:** dado sensível cifrado em repouso? TLS? `APP_KEY` protegido? mascaramento na tela? minimização?
6. **E6 Config:** `APP_DEBUG`, security headers, CORS, storage público, mensagens de erro.
7. **E7 API/Externo:** rate limit/paginação, **SSRF** em integração, inventário de versões, confiança em terceiro.
8. **E8 Integridade:** dependências desatualizadas (composer/npm audit), desserialização, **upload** (tipo/tamanho/fora do webroot), integridade de prescrição/resultado.
9. **E9 Log/Auditoria:** eventos logados? **trilha de acesso a prontuário**? dado sensível vazando em log?
10. **E10 Erros:** autz/pagamento **fail-safe**? transações atômicas? erro sem vazar interno?
11. **Nível ASVS:** marcar o nível-alvo (L2 piso; **L3** se a tela toca dado de saúde) e se os requisitos do nível estão atendidos.
12. **Mapear legado → novo:** para cada risco, o **controle Laravel/Vue equivalente** (middleware, Policy, `FormRequest`, `Crypt`, `throttle`, headers) e a **evidência de que não rebaixa**.
13. **Veredito:** *não rebaixa vs. legado · fail-safe · dado de saúde em L3 · segredos fora do código*. Rebaixamento/exposição → 🔴 → `decisoes.md`.
14. **Self-healing:** achado investigável (qual rota, qual config, qual dep) → investigar, preencher e seguir. Só vira pendência/decisão o que depende de **gente** (🟠 a validar, 🔴 a decidir).
15. **Atualizar a matriz** (`matriz-seguranca.md`) e fechar com resumo breve (🟡): eixos cobertos, achados 🟠/🔴, nível ASVS, e se o ledger ficou **verificado** (apto ao Gate 2) ou o que falta.

## Trilha greenfield (construção — projetar seguro de berço)

Não há legado a espelhar; a fonte é a decisão do dev + o padrão. Antes de codar a feature:

1. **Threat model** por rota/fluxo (base A06:2025 Insecure Design): identificar ativos (dado de saúde?), atores, superfície e abusos plausíveis (por eixo E1–E10).
2. **Definir os controles de berço** por eixo (authn/authz, validação server-side, cripto, headers, rate limit, auditoria) e o **nível ASVS** (L2 piso, L3 se dado de saúde).
3. Registrar no mesmo ledger `seguranca/{slug}.md` (origem = `decisoes.md`, modo 🟩 greenfield).
4. **Estressar o threat model com `/adversario`** (recomendado em alta criticidade) — um adversário tentando furar o desenho antes de implementar.

---

## Definição de Pronto (análise "verificada")

A tela só está **apta ao Gate 2** quando o ledger tem:

- [ ] Os **10 eixos** avaliados (com status + origem + âncora, ou "N/A" com evidência)
- [ ] **Nível ASVS** marcado (L2 piso; **L3** confirmado nos fluxos de dado de saúde)
- [ ] Achados classificados (✅/🟡/🟠/🔴) com **origem e âncora citadas**
- [ ] **Mapeamento legado→novo** dos controles + evidência de que **não rebaixa**
- [ ] **Veredito** preenchido; 🔴 (rebaixamento/exposição/segurança do paciente) em `decisoes.md`; 🟠/🟡 em `pendencias.md`
- [ ] Sem 🟡 Hipótese **investigável** pendente

## Gate

`/migracao-homologar [ID]` (Gate 2) **aborta** (🔴 humano) se o ledger `memoria/seguranca/{slug}.md` não existir ou o **veredito de segurança** não estiver verificado — **para telas de criticidade alta** (dado de saúde, cálculo clínico/financeiro, permissões). Ver `docs/04-protocolos/protocolo-gates-validacao.md`. O dossiê consome este ledger; se ausente numa tela crítica, **auto-resolve** disparando `/migracao-mapear-seguranca` (gate de completude), escalando ao dev só 🟠/🔴.

## Varredura orquestrada em rodadas controladas (multiagente)

Igual à investigação de permissões: sweep de módulo roda **1 rodada por vez, gate 🔴 humano ao fim**, estado persistente em `memoria/seguranca/_controle-varredura.md`, **verificação adversarial obrigatória** de cada achado (tentar refutá-lo antes de persistir), **mecanismo-only sem ambiente vivo** (exploit real depende de execução → 🟡 pendência; nunca "confirmar" vulnerabilidade sem evidência). Ver `protocolo-investigacao-permissoes.md` §"Varredura orquestrada".

## Ciclo de vida do ledger

- **Criação/atualização:** Fase 05 (investigação) e Fase 08 (riscos) via `/migracao-mapear-seguranca`.
- **Consulta:** dossiê (06), plano (10 — planejar os controles), paridade (14), homologação (15).
- **Mudança/rebaixamento vs. legado:** sempre 🔴 em `decisoes.md`, referenciado no ledger.
- **Persistência:** sobrevive ao fim da migração — postura de segurança consultável e base de re-auditoria.

## Relacionado
- [Guardião de Segurança](../03-guardioes/guardiao-seguranca.md)
- [Protocolo do Adversário](protocolo-adversario.md) (estressar threat model)
- [Protocolo de Investigação de Permissões](protocolo-investigacao-permissoes.md) (E1)
- [Protocolo de Gates de Validação](protocolo-gates-validacao.md)
- [Guardião de LGPD](../03-guardioes/guardiao-lgpd-privacidade.md) · [Segredos](../03-guardioes/guardiao-segredos-credenciais.md) · [Segurança do Paciente](../03-guardioes/guardiao-seguranca-paciente-risco-operacional.md)
