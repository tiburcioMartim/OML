# /migracao-configurar-projeto

## Objetivo

Definir o perfil do projeto: stack, políticas, direção visual, banco legado e regras específicas.

## Quando usar

Após `/migracao-ativar`, quando o projeto ainda não possui perfil configurado.

## Entradas esperadas

Respostas do responsável sobre: stack alvo, idioma do código, banco legado, direção visual, políticas de segurança, LGPD e ambientes.
Nome, email e URL do repositório do sistema migrado.
Autorização para análise do .env do legado (sim/não).

## Ações obrigatórias

### Identificação do Responsável (primeiro bloco — antes de tudo)
- [ ] Perguntar nome do responsável pela migração
- [ ] Perguntar email do responsável
- [ ] Perguntar URL do repositório Git do sistema migrado (pode ser informada depois)

### Estrutura de Workspace (ver `docs/00-visao-geral/politica-estrutura-workspace.md`)
- [ ] Identificar o diretório raiz de migração (pai do OML)
- [ ] Identificar o diretório do sistema legado
- [ ] **Perguntar ao dev o nome desejado para o diretório do novo sistema** (ex: `erp-novo`, `sistema-moderno`, `app-v2`)
- [ ] Criar o diretório do novo sistema **como irmão** do OML e do legado (no diretório raiz)
- [ ] **Nunca criar o diretório do novo sistema dentro do legado ou dentro do OML**
- [ ] Registrar os caminhos (`diretorio_raiz`, `diretorio_legado`, `diretorio_novo`, `diretorio_oml`) no perfil do projeto

### Configuração do Projeto
- [ ] Perguntar sobre a stack alvo (Laravel, Vue, Inertia, etc.)
- [ ] Perguntar sobre o idioma do código (PT-BR ou EN)
- [ ] Perguntar sobre o banco legado (preservar, adaptar, migrar)
- [ ] Conduzir entrevista de design (30 perguntas visuais)
- [ ] Perguntar sobre integrações existentes
- [ ] Perguntar sobre estrutura de permissões

### Ambiente de Execução
- [ ] Apresentar opções de ambiente (local, Docker, a definir) com prós e contras e perguntar a preferência do dev
- [ ] Perguntar sobre ambientes disponíveis (local, homologação, produção)

### Configuração de Ambiente do Legado
- [ ] Pedir autorização ao dev para analisar o arquivo de configuração de ambiente do legado (.env, config.php, etc.) e mapear variáveis para o sistema migrado

### Finalização
- [ ] Gerar arquivo de perfil do projeto
- [ ] Registrar decisões em `memoria/decisoes.md`

## Ações proibidas

- [ ] Não assumir respostas sem perguntar
- [ ] Não implementar nada
- [ ] Não alterar banco

## Arquivos que atualiza

- `docs/06-perfis/[perfil-escolhido]/perfil.md`
- `memoria/decisoes.md`

## Checklist de conclusão

- [ ] Dados do responsável registrados (nome, email, repositório)
- [ ] Estrutura de workspace validada (diretórios irmãos)
- [ ] Nome do diretório do novo sistema definido pelo dev
- [ ] Diretório do novo sistema criado como irmão
- [ ] Caminhos registrados no perfil do projeto
- [ ] Stack definida
- [ ] Idioma definido
- [ ] Banco legado mapeado
- [ ] Direção visual definida
- [ ] Política de ambiente/Docker definida
- [ ] Ambientes mapeados
- [ ] Perfil salvo em arquivo

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a configuração do projeto. Perfil salvo."

## Próximo passo

`/migracao-descobrir-telas` ou `/migracao-carregar-urls`
