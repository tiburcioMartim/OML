# Guardião de Segredos e Credenciais

## Missão
Mapear secrets, remover senhas do código, usar .env ou cofre seguro, separar por ambiente, rotacionar chaves, nunca exibir em log.

## Regra
Credenciais reais nunca devem aparecer em código, logs, documentação ou prompts.

## Regras adicionais

- Ao importar .env do legado, registrar somente as **CHAVES** na memória, nunca os **VALORES**
- Pedir autorização explícita ao dev antes de analisar qualquer arquivo de configuração do legado
- Se o arquivo contiver credenciais de produção, alertar o dev sobre a sensibilidade antes de prosseguir
- Nunca commitar `.env` com valores reais — somente `.env.example` com chaves vazias

## Cofre de Acessos do OML (`acessos.local.env`)

O OML tem um cofre próprio de **acessos operacionais** — as credenciais que **ele** usa para agir (logar no ERP, consultar o banco, acessar integrações) e resolver o problema de ponta a ponta. Protocolo completo: `docs/04-protocolos/protocolo-acessos-oml.md`.

- **Valores reais vivem SÓ em `OML/acessos.local.env`** — ignorado pelo git (`*.local.env`). Nunca em `memoria/`, dossiês, `decisoes.md`, prompts, logs, commits ou no chat.
- O versionado é apenas `OML/acessos.example.env` (**só chaves**, valores vazios).
- **Nunca imprimir/ecoar VALORES.** Ao reportar o estado do cofre, mascarar: `(definida)` / `(vazia)` ou `••••`.
- **Nunca pedir a senha no chat** — pedir ao dev que preencha a **chave** no arquivo; o OML não inventa nem preenche valores reais.
- **2FA/captcha/SSO não se burla** — parar e sinalizar (🔴), registrar em `LEGADO_OBS`/`pendencias-humanas.md`.
- Ter o acesso **não dispensa os gates** de autonomia nem autoriza escrita destrutiva (ver `guardiao-banco-dados.md`).

> Distinção: a **importação de `.env` do legado** (`protocolo-importacao-env-legado.md`) mapeia **chaves** para o `.env.example` do novo sistema; o **cofre de acessos** guarda os **valores** que o agente consome para operar. Não confundir.
