# /migracao-configurar-projeto

## Objetivo

Definir o perfil do projeto: stack, políticas, direção visual, banco legado e regras específicas.

## Quando usar

Após `/migracao-ativar`, quando o projeto ainda não possui perfil configurado.

## Entradas esperadas

Respostas do responsável sobre: stack alvo, idioma do código, banco legado, direção visual, políticas de segurança, LGPD e ambientes.

## Ações obrigatórias

- [ ] Perguntar sobre a stack alvo (Laravel, Vue, Inertia, etc.)
- [ ] Perguntar sobre o idioma do código (PT-BR ou EN)
- [ ] Perguntar sobre o banco legado (preservar, adaptar, migrar)
- [ ] Conduzir entrevista de design (30 perguntas visuais)
- [ ] Perguntar sobre ambientes disponíveis (local, homologação, produção)
- [ ] Perguntar sobre integrações existentes
- [ ] Perguntar sobre estrutura de permissões
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

- [ ] Stack definida
- [ ] Idioma definido
- [ ] Banco legado mapeado
- [ ] Direção visual definida
- [ ] Ambientes mapeados
- [ ] Perfil salvo em arquivo

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% a configuração do projeto. Perfil salvo."

## Próximo passo

`/migracao-descobrir-telas` ou `/migracao-carregar-urls`
