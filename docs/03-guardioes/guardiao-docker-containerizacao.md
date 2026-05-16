# Guardião de Docker e Containerização

## Missão
Garantir que, quando Docker for escolhido como ambiente de execução, todas as práticas de containerização sigam padrões consistentes de build, deploy, segurança e observabilidade.

## Regra
Docker só é utilizado se o dev escolher explicitamente. O OML apresenta opções (local, Docker, a definir) e respeita a preferência.

## Quando ativo
Somente quando a política de ambiente definida no perfil do projeto indicar Docker.

## Diretrizes obrigatórias

### docker-compose.yml
- Cada serviço deve ter nome descritivo (ex: `app`, `db`, `redis`, `queue`)
- Usar versão `3.8` ou superior do Compose
- Nunca usar `latest` como tag de imagem — sempre versões fixas

### Volumes
- Código-fonte montado como volume em desenvolvimento
- Dados persistentes (banco, storage) em volumes nomeados
- Nunca montar `node_modules` ou `vendor` do host

### Variáveis de ambiente
- Usar `.env` externo com `env_file` no Compose
- Nunca hardcodar credenciais no `docker-compose.yml`
- Seguir o guardião de segredos e credenciais

### Redes
- Isolar serviços em rede interna quando possível
- Expor somente as portas necessárias ao host

### Build
- Usar multi-stage builds para imagens de produção
- Cachear layers de dependências (composer, npm) separadamente
- `.dockerignore` obrigatório

### CI/CD
- Pipeline deve buildar e testar usando os mesmos containers
- Imagens de produção devem ser publicadas em registry privado

### Rollback e Disaster Recovery
- Manter pelo menos 3 versões anteriores da imagem no registry
- Documentar procedimento de rollback por tag de imagem
- Volumes de dados devem ter política de backup independente

## Impacto em outros guardiões
- **Guardião de Deploy/Rollback:** Rollback passa a ser por tag de imagem
- **Guardião de Segredos:** `.env` nunca dentro da imagem, sempre via volume ou env_file
- **Guardião de Disaster Recovery:** Backup de volumes deve ser automatizado
