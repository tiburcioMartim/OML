# Protocolo de CI e Qualidade (GitHub)

## Objetivo
Garantir que **nada quebrado, mal formatado, inseguro ou inacessível** entre na branch principal. O CI é a **rede de segurança mecânica** (Camada 3 da [ativação permanente](protocolo-ativacao-permanente.md)) que não depende da memória do agente.

## Quando usar
- Modo **construção**: configurar o pipeline já na Fase 00 (de berço).
- Modo **migração**: ao abrir o repositório novo.
- Sempre que entrar uma nova ferramenta de lint/teste.

> O OML **propõe** as ferramentas conforme a stack (ver perfis) e respeita a escolha do dev. Configurar a conta/segredos do GitHub é [pendência humana](../03-guardioes/guardiao-pendencias-humanas.md) quando exigir acesso que o agente não tem.

---

## Camadas de verificação

### 1. Local (pre-commit) — barato e rápido
- Formatação automática e lint **antes** do commit (ex.: `husky` + `lint-staged`).
- Roda só nos arquivos alterados — feedback imediato.

### 2. CI (GitHub Actions) — autoridade
Pipeline obrigatório em `pull_request` e `push` na branch principal. **PR só funde com tudo verde.**

---

## Jobs obrigatórios do pipeline

| Job | Backend (Laravel) | Frontend (Vue/Inertia) |
|---|---|---|
| **Formatação** | Laravel **Pint** (`--test`, PSR-12) | **Prettier** (`--check`) |
| **Lint** | — | **ESLint** (config Vue) + **Stylelint** (CSS/Tailwind) |
| **Análise estática** | **PHPStan/Larastan** (nível acordado no perfil) | `vue-tsc`/`tsc --noEmit` se TS |
| **Testes** | **PHPUnit/Pest** (unit + feature) | **Vitest** (componentes/composables) |
| **Cobertura** | mínimo acordado por criticidade (ver [testes](../03-guardioes/guardiao-testes.md)) | idem |
| **Acessibilidade** | — | **axe** / Lighthouse a11y nas páginas-chave |
| **Segurança (deps)** | `composer audit` | `npm audit` / Dependabot |
| **Build** | — | `vite build` sem erro |
| **E2E (criticidade alta)** | Playwright/Cypress nos fluxos Estritos | idem |

> A régua segue a [matriz de criticidade](../00-visao-geral/matriz-criticidade.md): feature Expressa roda o baseline; feature Estrita exige cobertura, E2E e security review.

---

## Gates de mesclagem (branch protection)
- ✅ Todos os jobs verdes.
- ✅ Revisão (humana e/ou `code-review`/`security-review` quando disponíveis — ver [plugins](protocolo-plugins-claude.md)).
- ✅ Sem queda de cobertura abaixo do mínimo.
- ✅ Branch principal protegida: sem push direto, sem merge com CI vermelho.

## Convenções que o CI também fiscaliza
- **Cor/estilo hardcoded** (deve ser token) — regra de lint/Stylelint.
- **Componente sem `alt`/ARIA/label** — regra de a11y.
- **Segredo commitado** — scanner de segredos (ex.: gitleaks) — ver [segredos](../03-guardioes/guardiao-segredos-credenciais.md).
- **Conventional commits** (alinha com [protocolo de push](protocolo-push.md)).

---

## Saída obrigatória
- Workflows em `.github/workflows/` no projeto novo.
- Configs versionadas: `pint.json`, `phpstan.neon`, `.eslintrc`, `.prettierrc`, `.stylelintrc`, `lint-staged`.
- Mínimos de cobertura e nível de PHPStan registrados no **perfil** e em `memoria/decisoes.md`.

## Checklist
- [ ] Pre-commit (lint-staged) configurado localmente
- [ ] Pipeline GitHub Actions com formatação, lint, análise estática, testes, a11y, audit e build
- [ ] Branch principal protegida (merge só com tudo verde)
- [ ] Mínimos de cobertura/PHPStan acordados e registrados
- [ ] Scanner de segredos ativo
- [ ] Segredos do CI configurados pelo dev (pendência humana se necessário)

## Impacto / Relacionado
- **[Ativação Permanente](protocolo-ativacao-permanente.md):** o CI é a Camada 3.
- **[Guardião de Testes](../03-guardioes/guardiao-testes.md)** e **[Lint/Formatação Laravel](../06-perfis/laravel/lint-formatacao.md).**
- **[Docker](protocolo-docker.md):** o CI builda/testa nos mesmos containers quando Docker for adotado.
- **[Guardião de Docker](../03-guardioes/guardiao-docker-containerizacao.md)** e **[Deploy/Rollback](../03-guardioes/guardiao-deploy-rollback.md).**
