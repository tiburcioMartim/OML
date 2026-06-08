# Protocolo — Cofre de Acessos do OML (`acessos.local.env`)

## Objetivo

Dar ao OML um lugar fixo, seguro e padronizado para guardar os **acessos operacionais** de que ele precisa para **agir e resolver o problema de ponta a ponta** — logar no ERP legado, logar no sistema novo, consultar o banco, acessar integrações — sem depender de o dev executar cada passo manualmente.

É o **"`.env` do próprio OML"**: o agente lê o cofre, autentica nos sistemas e segue resolvendo.

## Não confundir com a Importação de `.env` do Legado

| | **Importação de `.env` do Legado** (`protocolo-importacao-env-legado.md`) | **Cofre de Acessos do OML** (este protocolo) |
|---|---|---|
| Para quê | Mapear as **CHAVES** de config do legado → `.env.example` do sistema novo | Guardar os **VALORES** de acesso que o OML usa para **operar** |
| O que persiste | Só **nomes** de variáveis (nunca valores) | **Credenciais reais** (URL, usuário, senha, tokens) |
| Onde mora | `.env.example` do projeto novo + perfil (só chaves) | `OML/acessos.local.env` (ignorado pelo git, **nunca** commitado) |
| Quem consome | O desenvolvedor, ao configurar o novo `.env` | O **agente**, em runtime, para autenticar e agir |

Os dois convivem: a importação alinha a configuração; o cofre dá ao agente o acesso para executar.

---

## Os dois arquivos

| Arquivo | Conteúdo | Git | Papel no manifesto |
|---|---|---|---|
| `OML/acessos.example.env` | **Só CHAVES** + comentários (template) | **Versionado** | Motor (`docs/05-templates/acessos.example.env` é a fonte) |
| `OML/acessos.local.env` | **VALORES reais** (URL, usuário, senha, tokens) | **Ignorado** (`*.local.env` no `.gitignore`) | **Local** (por máquina; nunca versionado nem sobrescrito) |

Convenção `*.local.env` espelha a do `.claude/settings.local.json`: o sufixo `.local.` marca "específico desta máquina, fora do git".

### Formato

`dotenv` clássico (`CHAVE=valor`), com chaves em `MAIUSCULA_SNAKE_CASE` **namespaced por sistema**. Blocos canônicos (preencher só os que existirem no projeto):

| Bloco | Chaves | Para o OML… |
|---|---|---|
| Sistema legado | `LEGADO_URL`, `LEGADO_USUARIO`, `LEGADO_SENHA`, `LEGADO_OBS` | logar na app legada e comparar paridade |
| Sistema novo | `NOVO_URL`, `NOVO_USUARIO`, `NOVO_SENHA` | logar na app migrada e homologar |
| Banco legado | `DB_LEGADO_HOST/PORT/DATABASE/USUARIO/SENHA` | consultar schema/dados reais (leitura) |
| Banco novo | `DB_NOVO_HOST/PORT/DATABASE/USUARIO/SENHA` | validar a migração |
| Integrações | `API_<SERVICO>_BASE_URL`, `API_<SERVICO>_TOKEN` (um bloco por serviço) | exercitar integrações |

`LEGADO_OBS` é texto livre para o que não cabe em campo (passo de 2FA, perfil necessário, URL de homologação alternativa, captcha, etc.).

---

## Ciclo de vida

### 1. Seed automático (na ativação)

`/migracao-ativar` garante o cofre (seed-if-missing — ver `docs/01-comandos/migracao-ativar.md`):

1. Se `OML/acessos.example.env` não existir, copiá-lo de `docs/05-templates/acessos.example.env`.
2. Garantir que `acessos.local.env` (ou `*.local.env`) está no `.gitignore` do OML — **antes** de criar o arquivo de valores.
3. Se `OML/acessos.local.env` não existir, criá-lo a partir do `.example` (chaves com **valores vazios**) — padrão `cp .env.example .env`.
4. **Carregar** o `acessos.local.env` e reportar **quais blocos estão preenchidos × vazios** — sempre **mascarando** valores (ex.: `LEGADO_SENHA=•••• (definida)` / `(vazia)`). Nunca imprimir o valor.

Nunca sobrescrever um `acessos.local.env` existente — é dado do dev/da máquina.

### 2. Preenchimento (dev)

O dev abre `OML/acessos.local.env` e cola os valores reais. O OML pode **abrir o arquivo para escrever uma chave nova** (ex.: descobriu um sistema a mais), mas **não inventa valores** e **não preenche senha** — o valor real é responsabilidade do dev.

### 3. Uso (agente)

Ao precisar agir num sistema, o OML lê **somente as chaves daquele bloco** do `acessos.local.env` e autentica. Exemplo — logar no ERP legado via navegador (Playwright):

1. `browser_navigate` → `LEGADO_URL`.
2. `browser_fill_form` / `browser_type` → `LEGADO_USUARIO`, `LEGADO_SENHA`.
3. Se `LEGADO_OBS` indicar 2FA/captcha → parar e pedir o passo manual ao dev (🔴), não tentar burlar.
4. Seguir a tarefa (comparar tela, conferir dado, reproduzir fluxo) já autenticado.

Se o bloco necessário estiver **vazio**, o OML **para e pede ao dev** para preencher aquele bloco do cofre — citando só a **chave** que falta, nunca pedindo a senha no chat.

---

## Regras de segurança (duras)

Complementa `docs/03-guardioes/guardiao-segredos-credenciais.md`.

- **`acessos.local.env` é a ÚNICA morada de valores reais.** Nada de credencial em `memoria/`, `decisoes.md`, dossiês, prompts, logs, commits ou no chat.
- **Nunca imprimir/ecoar/logar VALORES.** Ao reportar estado do cofre, mascarar (`(definida)`/`(vazia)`, ou `••••`).
- **Nunca commitar.** O arquivo é ignorado pelo git; ainda assim, o `/push` aborta se detectar credencial no diff (guardião de segredos).
- **Nunca colar a senha no chat.** Pedir ao dev que preencha o **arquivo**; referenciar só a **chave**.
- **2FA/captcha/SSO não se burla.** Se a autenticação exigir passo humano, parar e sinalizar (🔴) — registrar a necessidade em `LEGADO_OBS`/`memoria/pendencias-humanas.md`.
- **Produção é sensível.** Se o cofre apontar para ambiente de produção, alertar antes de qualquer ação de escrita e reger-se pelo `docs/03-guardioes/guardiao-banco-dados.md` (escrita destrutiva do agente = proibida).
- **Acesso ≠ autorização para mudar o fluxo.** Ter o login não dispensa os gates: o cofre dá meios de **investigar/validar**, não de pular autonomia.

---

## Checklist

- [ ] `.gitignore` do OML ignora `*.local.env` (e `acessos.local.env`)
- [ ] `acessos.example.env` (só chaves) presente e versionado
- [ ] `acessos.local.env` existe (do `.example`), fora do git
- [ ] Blocos preenchidos reportados **mascarados** (nunca valor)
- [ ] Nenhum valor real em `memoria/`, doc, prompt, log ou commit
- [ ] Passos humanos (2FA/captcha) sinalizados, não burlados
