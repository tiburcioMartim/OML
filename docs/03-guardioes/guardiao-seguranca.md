# Guardião de Segurança

## Missão

Fazer do OML um **especialista em segurança de aplicações** — que **cita padrão** em vez de "achar". Toda tela/endpoint é avaliada em **10 eixos** ancorados em corpus autoritativo, com evidência de código, e registrada no ledger `memoria/seguranca/{slug}.md`. É o cidadão de 1ª classe de segurança, no mesmo rigor de [permissões](guardiao-permissoes-acessos.md) e [regras de negócio](guardiao-regras-negocio.md).

> Segurança e **permissões** se cruzam (o eixo E1 = controle de acesso remete a `guardiao-permissoes-acessos.md`) mas não se confundem: permissões = *quem pode o quê*; segurança = *a superfície inteira de ataque*.

## Ancoragem (padrões vigentes — fonte da verdade, não memória)

O agente ancora seus achados nestes padrões (versões confirmadas em 2026-07-17; catálogo completo em `docs/04-protocolos/protocolo-investigacao-seguranca.md`):

| Padrão | Versão vigente | Papel |
|---|---|---|
| **OWASP Top 10** | **2025** (A01–A10; SSRF absorvido em A01, Injection reabsorve XSS, novas A03 Supply Chain e A10 Exceptional Conditions) | Taxonomia primária de risco |
| **OWASP API Security Top 10** | **2023** (API1–API10; BOLA, BOPLA, etc.) | ERP é API-heavy |
| **OWASP ASVS** | **5.0.0** (17 capítulos; níveis L1/L2/L3) | Régua de verificação |
| **CWE Top 25** | **2025** (XSS #1, SQLi #2, CSRF #3, Missing Authz #4) | Fraqueza citável por achado |

**Nível-alvo:** **L2 como piso** de toda a aplicação; **L3 nos fluxos que tocam dado de saúde** (prontuário, prescrição, exame, dose) — exigência da própria ASVS para healthcare e da criticidade de segurança do paciente.

## Regra-mãe do eixo

Toda entrada é validada **no servidor** (o front é conveniência, não defesa) e todo controle **falha fechado** (fail-safe, nunca fail-open).

## Leitura por modo

- **Migração:** preservar **todo** controle que o legado já tem e **elevar** (Regra-Mãe #7 exige melhorar). **Nunca rebaixar** um controle existente — rebaixamento é **🔴** (decisão do dev).
- **Construção (greenfield):** **secure by design de berço** — authn/authz e validação server-side desde a primeira rota, e **threat model antes de codar** (OWASP A06:2025 Insecure Design). Ver a trilha greenfield no protocolo.

## Os 10 eixos de análise (por tela/endpoint)

| # | Eixo | O que investigar | Mapeamento |
|---|---|---|---|
| **E1** | **Controle de Acesso & Autorização** | Toda ação/objeto valida perfil, escopo e vínculo (paciente/unidade/tenant)? IDOR? Endpoint admin exposto? Policy/Gate presente? *(cruza com permissões)* | A01:2025 · API1/3/5:2023 · CWE-862/863/639/285 |
| **E2** | **Autenticação & Sessão** | Login, MFA, força/rotação de senha, expiração/fixação de sessão e token, refresh, logout. | A07:2025 · API2:2023 · CWE-287/306/384/613/798 |
| **E3** | **Injeção (SQLi/XSS/Command/Template)** | `whereRaw`/`DB::raw` concatenado? `{!! !!}`/`v-html`? shell/eval? escaping de saída? | A05:2025 · CWE-89/79/78/94/77 |
| **E4** | **Validação de Entrada & Regra de Negócio** | `FormRequest`/validação server-side; faixas/tipos; **cálculos clínicos**; abuso de fluxo; anti-automação. | A06:2025/A05 · API6:2023 · CWE-20/682/840 |
| **E5** | **Criptografia & Proteção de Dados (LGPD)** | Dado sensível cifrado em repouso/trânsito; `APP_KEY`; algoritmos; minimização; mascaramento na tela. | A04:2025 · CWE-311/312/319/327/798 |
| **E6** | **Configuração & Exposição** | `APP_DEBUG`, security headers, CORS, verbos HTTP, storage/bucket público, versões/erros expostos. | A02:2025 · API8:2023 · CWE-16/200/209/489/732/552 |
| **E7** | **Superfície de API & Consumo Externo** | Rate limit/paginação; **SSRF** em integrações; inventário (shadow/versão antiga); confiança em terceiro (RNDS/labs/convênio). | A01(SSRF)/API4/7/9/10 · CWE-918/770/400 |
| **E8** | **Integridade de Software, Dados & Supply Chain** | Dependências composer/npm; desserialização; **upload**; integridade de build/CI; integridade de prescrição/resultado. | A03:2025/A08:2025 · CWE-502/434/1104/494 |
| **E9** | **Log, Auditoria & Detecção** | Eventos de segurança logados; **trilha de acesso a prontuário** (quem/quando/por quê); alerta; sem dado sensível em log. | A09:2025 · CWE-778/117/532/223 |
| **E10** | **Tratamento de Erros & Condições Excepcionais** | **Fail-safe** em autz/pagamento; estados inconsistentes; erro sem vazar interno; transações atômicas. | A10:2025 · CWE-755/391/209/636 |

## Invariantes (nunca violar)

1. **Não rebaixar** — migração jamais remove/enfraquece controle do legado.
2. **Secure-by-design** — greenfield nasce com authn/authz + validação server-side + threat model.
3. **Validação no servidor** — sempre, mesmo com validação no front.
4. **Segredo fora do código/log** — só `.env`/cofre (ver [segredos e credenciais](guardiao-segredos-credenciais.md)); nunca commitar/ecoar/logar.
5. **Fail-safe** — erro/exceção **nega**, não libera acesso.
6. **Dado de saúde = L3** — cifragem em repouso/trânsito + trilha de acesso + minimização (LGPD art. 11/46).

## Severidade & elevação 🔴

- ✅ **OK** — controle presente e adequado, com evidência.
- 🟡 **Risco/hipótese** — fragilidade inferida, ainda não confirmada → pendência.
- 🟠 **Achado aberto** — vulnerabilidade plausível a validar (ex.: rota sem `auth`) → perguntar ao dev.
- 🔴 **Crítico** — vulnerabilidade explorável confirmada, **rebaixamento vs. legado**, exposição de dado de saúde, ou risco à **segurança do paciente / cálculo clínico** → **para e escala ao dev** (`decisoes.md`). Elevação automática (herda `fase-08-mapeamento-riscos` e `guardiao-seguranca-paciente-risco-operacional`).

## Adversário

O ledger/threat model de segurança é **alvo natural do [`/adversario`](../04-protocolos/protocolo-adversario.md)** — um modelo de ameaças pede um adversário tentando furá-lo. Em telas de alta criticidade, o debate adversário é recomendado antes de fechar a análise (lente "código/segurança").

> É o eixo "Segurança" do [catálogo de boas práticas proativas](guardiao-boas-praticas-proativas.md). Relacionado: [LGPD](guardiao-lgpd-privacidade.md), [segredos](guardiao-segredos-credenciais.md), [resposta a incidentes](guardiao-resposta-incidentes.md), [disaster recovery](guardiao-recuperacao-desastre.md), [segurança do paciente](guardiao-seguranca-paciente-risco-operacional.md).
