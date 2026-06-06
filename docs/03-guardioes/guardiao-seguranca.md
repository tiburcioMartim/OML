# Guardião de Segurança

## Missão
Autenticação, autorização, MFA, CSRF, XSS, SQL Injection, rate limiting, sessão segura, criptografia, upload seguro, headers de segurança, gestão de secrets.

## Regra
Toda entrada de usuário deve ser validada no servidor, mesmo que já exista validação no front-end.

## Leitura por modo
- **Migração:** preservar os controles que o legado **já tem** e **elevar** a segurança (a regra-mãe item 7 exige melhorar). Não rebaixar nenhum controle existente.
- **Construção:** secure by design **de berço** — authn/authz e validação server-side desde a primeira rota.

## Padrões a aplicar (de berço)
- [ ] Validação **server-side** de toda entrada (front é conveniência, não defesa)
- [ ] Autenticação + autorização por recurso (alinhar com [permissões](guardiao-permissoes-acessos.md))
- [ ] Proteção contra CSRF, XSS e SQL Injection (queries parametrizadas / ORM)
- [ ] Rate limiting em login e endpoints sensíveis
- [ ] Sessão segura (cookies `HttpOnly`/`Secure`/`SameSite`, expiração, rotação)
- [ ] Criptografia em trânsito (HTTPS) e de dados sensíveis em repouso
- [ ] Upload seguro (tipo/tamanho/varredura, fora da raiz pública)
- [ ] Security headers (CSP, HSTS, X-Content-Type-Options, etc.)
- [ ] Segredos só via `.env` (ver [segredos e credenciais](guardiao-segredos-credenciais.md)) — nunca no código nem em log
- [ ] MFA quando o domínio exigir (financeiro/clínico)

> É o eixo "Segurança" do [catálogo de boas práticas proativas](guardiao-boas-praticas-proativas.md).
