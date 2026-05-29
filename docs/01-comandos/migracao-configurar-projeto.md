# /migracao-configurar-projeto

## Objetivo

Definir o perfil do projeto: modo, stack, políticas, direção visual, banco e regras específicas.

## Quando usar

Após `/migracao-ativar`, quando o projeto ainda não possui perfil configurado.

## Entradas esperadas

Respostas do responsável sobre: modo do projeto, stack alvo, idioma do código, banco, direção visual, políticas de segurança, LGPD e ambientes.
Nome, email e URL do repositório do sistema.
(Migração/Híbrido) Autorização para análise do .env do legado (sim/não).

## Ações obrigatórias

### Identificação do Responsável (primeiro bloco — antes de tudo)
- [ ] Perguntar nome do responsável pelo projeto
- [ ] Perguntar email do responsável
- [ ] Perguntar URL do repositório Git do sistema (pode ser informada depois)

### Modo do Projeto (ver `docs/00-visao-geral/politica-modos-projeto.md`)
- [ ] Confirmar o `modo` detectado na ativação: **migração**, **construção** (greenfield) ou **híbrido**
- [ ] Gravar o campo `modo` no perfil — é a fonte de verdade que ramifica todo o fluxo

### Estrutura de Workspace (ver `docs/00-visao-geral/politica-estrutura-workspace.md`)
- [ ] Identificar o diretório raiz (pai do OML)
- [ ] (Migração/Híbrido) Identificar o diretório do sistema legado
- [ ] **Perguntar ao dev o nome desejado para o diretório do novo sistema** (ex: `erp-novo`, `sistema-moderno`, `app-v2`)
- [ ] Criar o diretório do novo sistema **como irmão** do OML (e do legado, se houver)
- [ ] **Nunca criar o diretório do novo sistema dentro do legado ou dentro do OML**
- [ ] Registrar os caminhos (`diretorio_raiz`, `diretorio_legado` se houver, `diretorio_novo`, `diretorio_oml`) no perfil do projeto

### Configuração do Projeto
- [ ] Perguntar sobre a stack alvo (Laravel, Vue, Inertia, etc.)
- [ ] Perguntar sobre o idioma do código (PT-BR ou EN)
- [ ] **Banco:** (Migração/Híbrido) perguntar sobre o banco legado (preservar, adaptar, migrar); (Construção) definir design de schema novo (ver `docs/03-guardioes/guardiao-modelagem-dados.md`)
- [ ] Conduzir entrevista de design (30 perguntas visuais)
- [ ] **Identidade visual:** (Migração/Híbrido) herdar logomarcas do legado; (Construção) definir identidade visual nova com o dev
- [ ] (Migração/Híbrido) Perguntar sobre integrações existentes
- [ ] Perguntar sobre estrutura de permissões
- [ ] (Construção/Híbrido) Anexar o Catálogo de Boas Práticas ao perfil (ver `docs/03-guardioes/guardiao-boas-praticas-proativas.md`)

### Ambiente de Execução
- [ ] Apresentar opções de ambiente (local, Docker, a definir) com prós e contras e perguntar a preferência do dev
- [ ] Perguntar sobre ambientes disponíveis (local, homologação, produção)

### Configuração de Ambiente do Legado (apenas Migração/Híbrido)
- [ ] Pedir autorização ao dev para analisar o arquivo de configuração de ambiente do legado (.env, config.php, etc.) e mapear variáveis para o sistema novo
- [ ] Em modo Construção, **pular** este bloco e gerar um `.env.example` a partir da stack escolhida

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
- [ ] **Modo do projeto definido e gravado no perfil (`modo`)**
- [ ] Estrutura de workspace validada (diretórios irmãos; legado opcional em construção)
- [ ] Nome do diretório do novo sistema definido pelo dev
- [ ] Diretório do novo sistema criado como irmão
- [ ] Caminhos registrados no perfil do projeto
- [ ] Stack definida
- [ ] Idioma definido
- [ ] Banco mapeado (legado em migração/híbrido; schema novo em construção)
- [ ] Direção visual / identidade definida
- [ ] Política de ambiente/Docker definida
- [ ] Ambientes mapeados
- [ ] (Construção/Híbrido) Catálogo de Boas Práticas anexado
- [ ] Perfil salvo em arquivo

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a configuração do projeto. Perfil salvo."

## Próximo passo

- **Migração / Híbrido:** `/migracao-descobrir-telas` ou `/migracao-carregar-urls`
- **Construção (greenfield):** `/construir-capturar-requisitos` (e, se o Design System ainda não existir, a Fase 04 — Gate 1)
