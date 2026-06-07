# Contribuindo com o OML

Obrigado pelo interesse em contribuir com o **OML — Orquestrador de Migração Legada**!

## Como contribuir

1. Faça um fork do repositório.
2. Crie uma branch descritiva: `git checkout -b melhoria/nome-da-melhoria`.
3. Faça suas alterações seguindo os padrões do projeto.
4. Envie um pull request descrevendo claramente o que foi feito.

## Regras de contribuição

- Todo o conteúdo deve estar em **português do Brasil**.
- Seguir a estrutura de arquivos existente (objetivo, quando usar, ações obrigatórias, ações proibidas, checklist de conclusão).
- Separar melhorias do **núcleo genérico** de melhorias dos **perfis específicos** (Laravel, Vue, ERP hospitalar, etc.).
- Não incluir dados sensíveis, credenciais, senhas ou tokens reais.

## Tipos de contribuição aceitos

- Novos guardiões
- Novos templates
- Melhorias em protocolos existentes
- Novos perfis de stack/projeto
- Correções de texto ou formatação
- Traduções (quando houver suporte a outros idiomas)

## Versionamento

O OML segue [SemVer](https://semver.org/lang/pt-BR/) em `VERSION` (raiz). Ao contribuir com o **motor**:

- Atualize o `CHANGELOG.md` (seção `[Não lançado]`).
- Em release, faça o bump em `VERSION` e crie a tag `vX.Y.Z`.
- **Nunca** versione dado de projeto: `memoria/` é **estado** (ignorado pelo git). Estrutura nova de memória vai no seed `docs/05-templates/memoria-seed/`, não em `memoria/`.
- Comando novo? Crie o doc em `docs/01-comandos/`, registre em `comandos-oficiais.md` e adicione o slash command em `.claude/commands/`.

Ver a [política de versionamento e atualização](docs/00-visao-geral/politica-versionamento-atualizacao.md).

## Reportando problemas

Abra uma issue descrevendo:
1. O que você esperava
2. O que aconteceu
3. Como reproduzir
4. Sugestão de melhoria, se houver
