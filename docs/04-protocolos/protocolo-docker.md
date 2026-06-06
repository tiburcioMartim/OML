# Protocolo de Criação e Configuração de Docker

## Objetivo
Padronizar **como** o OML cria e configura o ambiente Docker quando o dev o escolhe — passo a passo, do `docker-compose` de desenvolvimento à imagem de produção — complementando as **regras** do [guardião de Docker](../03-guardioes/guardiao-docker-containerizacao.md).

## Quando usar
Somente quando a política de ambiente do perfil indicar **Docker**. O OML sempre **apresenta opções** (local, Docker, a definir) e respeita a escolha. Provisionar o host/registry é [pendência humana](../03-guardioes/guardiao-pendencias-humanas.md).

> Guardião = o que deve ser verdade. Este protocolo = a sequência de passos para chegar lá.

---

## Passo 1 — Mapear serviços
Levantar, a partir da stack/perfil, os serviços necessários. Stack Laravel+Vue típica:

| Serviço | Papel | Notas |
|---|---|---|
| `app` | PHP-FPM (Laravel) | imagem base PHP fixa (sem `latest`) |
| `web` | Nginx | serve estáticos + proxy para `app` |
| `db` | MySQL/PostgreSQL | volume nomeado para dados |
| `redis` | cache/filas/sessão | |
| `queue` | worker de filas | mesma imagem do `app`, comando diferente |
| `scheduler` | cron do Laravel | `schedule:run` |
| `node` | build de assets (Vite) | só em dev/CI; **não** vai para produção (salvo SSR) |
| `ssr` | Node SSR (se Inertia SSR/Nuxt) | só se a [arquitetura](protocolo-decisao-arquitetura.md) exigir |

## Passo 2 — Estrutura de arquivos
```
projeto-novo/
├── docker-compose.yml          # desenvolvimento
├── docker-compose.prod.yml     # overrides de produção
├── .dockerignore               # obrigatório
├── .env / .env.example         # nunca segredo na imagem
└── docker/
    ├── app/Dockerfile          # multi-stage
    ├── web/nginx.conf
    └── php/php.ini
```

## Passo 3 — `docker-compose.yml` (desenvolvimento)
- Nomes descritivos por serviço; Compose `3.8`+.
- **Código montado como volume** em dev; dados em **volumes nomeados**.
- **Nunca** montar `node_modules`/`vendor` do host.
- Variáveis via `env_file: .env` — **nunca** credencial hardcoded.
- Expor ao host **só** as portas necessárias; demais serviços em rede interna.

## Passo 4 — `Dockerfile` (multi-stage, produção)
- **Stage 1 (deps PHP):** `composer install --no-dev --optimize-autoloader` com cache de layer.
- **Stage 2 (assets):** Node builda Vite; saída copiada para a imagem final.
- **Stage 3 (runtime):** imagem PHP enxuta, sem ferramentas de build, rodando como **usuário não-root**.
- Tag **fixa e versionada** (ex.: `app:1.4.2`), nunca `latest`.

## Passo 5 — Segredos e ambientes
- `.env` por ambiente, **fora** da imagem (via `env_file`/volume/secret manager).
- Chaves de **produção** entram como [pendência humana](../03-guardioes/guardiao-pendencias-humanas.md) (o agente não as inventa).
- Segue o [guardião de segredos](../03-guardioes/guardiao-segredos-credenciais.md).

## Passo 6 — CI/CD
- O [pipeline de CI](protocolo-ci-qualidade.md) builda e testa **nos mesmos containers**.
- Imagens de produção publicadas em **registry privado**.

## Passo 7 — Rollback e DR
- Manter ≥ 3 versões anteriores da imagem no registry; rollback **por tag**.
- Volumes de dados com **política de backup independente** (ver [disaster recovery](../03-guardioes/guardiao-recuperacao-desastre.md)).
- Documentar o procedimento de rollback no plano de deploy.

## Passo 8 — Verificação
- `docker compose up` sobe tudo limpo; migrations rodam; app responde.
- Healthchecks por serviço; logs estruturados (ver [observabilidade](../03-guardioes/guardiao-observabilidade.md)).
- Imagem de produção **não** contém ferramentas de build nem segredos.

---

## Checklist
- [ ] Serviços mapeados a partir da stack/perfil
- [ ] `docker-compose.yml` (dev) + `.prod.yml` + `.dockerignore` criados
- [ ] `Dockerfile` multi-stage, tag fixa, runtime não-root
- [ ] Segredos fora da imagem; chaves de produção como pendência humana
- [ ] CI builda/testa nos mesmos containers; registry privado
- [ ] Rollback por tag + backup de volumes (DR)
- [ ] Subida verificada (migrations, healthcheck, sem segredo na imagem)

## Relacionado
- [Guardião de Docker](../03-guardioes/guardiao-docker-containerizacao.md) (regras)
- [Protocolo de CI/Qualidade](protocolo-ci-qualidade.md)
- [Protocolo de Decisão de Arquitetura](protocolo-decisao-arquitetura.md) (serviço SSR)
- [Pendências Humanas](../03-guardioes/guardiao-pendencias-humanas.md) (host/registry/segredos)
