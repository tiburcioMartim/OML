# Protocolo — Importação de .env do Legado

## Objetivo

Localizar, analisar e mapear as variáveis de configuração de ambiente do sistema legado para o formato `.env` do sistema migrado, garantindo alinhamento automático.

## Princípio

O OML investiga por conta própria. Nunca esperar que o dev saiba detalhes técnicos sobre o formato do arquivo de configuração.

## Fluxo

### Passo 1 — Pedir autorização

Perguntar ao dev:
> "Posso analisar a estrutura do sistema legado para identificar o arquivo de configuração de ambiente? (sim/não)"

Se o dev negar, registrar como pendente e seguir em frente.

### Passo 2 — Varrer o legado

Se autorizado, buscar os seguintes padrões de arquivo na raiz e subpastas do legado:

| Padrão | Tipo |
|---|---|
| `.env` | Arquivo dotenv padrão |
| `.env.example` | Template dotenv |
| `config.php` | Config PHP tradicional |
| `conexao.php` | Conexão com banco (PHP) |
| `database.php` | Config de banco |
| `settings.php` | Config geral |
| `app.php` | Config de aplicação |
| `constants.php` | Constantes da aplicação |

### Passo 3 — Extrair e classificar as CHAVES

Extrair somente os **nomes das variáveis** (chaves), nunca os valores.

Classificar cada chave por categoria:

| Categoria | Exemplos de chaves |
|---|---|
| Banco de dados | `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PORT` |
| API / Integrações | `API_URL`, `API_KEY`, `WEBHOOK_URL` |
| Email | `MAIL_HOST`, `MAIL_PORT`, `MAIL_FROM` |
| Storage | `S3_BUCKET`, `R2_ENDPOINT`, `STORAGE_PATH` |
| Aplicação | `APP_NAME`, `APP_URL`, `APP_ENV`, `APP_DEBUG` |
| Segurança | `APP_KEY`, `JWT_SECRET`, `ENCRYPTION_KEY` |

### Passo 4 — Apresentar ao dev

Exibir uma tabela com o mapeamento proposto:

> "Encontrei `config.php` com 15 variáveis. Sugiro este mapeamento para o `.env` do Laravel:"

| Chave do legado | Chave sugerida (Laravel) | Categoria |
|---|---|---|
| `$db_host` | `DB_HOST` | Banco de dados |
| `$db_name` | `DB_DATABASE` | Banco de dados |
| ... | ... | ... |

> "Aprova este mapeamento?"

### Passo 5 — Gerar .env.example

Se aprovado, gerar (ou atualizar) o arquivo `.env.example` no repositório do sistema migrado com os nomes mapeados e comentários descritivos.

## Regras de segurança

- **NUNCA** registrar valores de credenciais na memória (`memoria/`)
- **NUNCA** commitar credenciais em repositório
- Registrar somente as **CHAVES** (nomes das variáveis) nos documentos do OML
- Pedir autorização explícita antes de analisar qualquer arquivo de configuração
- Se o arquivo contiver credenciais de produção, alertar o dev sobre a sensibilidade

## Checklist

- [ ] Autorização do dev obtida
- [ ] Arquivo(s) de configuração do legado localizados
- [ ] Chaves extraídas e classificadas
- [ ] Mapeamento apresentado e aprovado pelo dev
- [ ] `.env.example` gerado ou atualizado
