# Changelog

Todas as mudanças relevantes do OML serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/).

---

## [Não lançado]

### Adicionado

- **Modos de projeto** (`migracao` | `construcao` | `hibrido`): o OML passa a apoiar também a **construção de projetos novos (greenfield)**, não só migração — `docs/00-visao-geral/politica-modos-projeto.md`
- **Guardião de Boas Práticas Proativas** (catálogo-orquestrador de LGPD, acessibilidade, dark/light, HTML semântico, nomenclatura, responsividade, performance, segurança, i18n, SEO, design tokens, modelagem de dados) — `docs/03-guardioes/guardiao-boas-praticas-proativas.md`
- **Guardião de Tema Dark/Light** como fonte única de verdade (consolida descrições antes duplicadas em acessibilidade, design e Fase 04) — `docs/03-guardioes/guardiao-tema-dark-light.md`
- **Guardião de SEO** — `docs/03-guardioes/guardiao-seo.md`
- **Comando `/construir-capturar-requisitos`** (fonte de verdade do greenfield, equivalente à descoberta de telas) — `docs/01-comandos/construir-capturar-requisitos.md`
- **Template de Catálogo de Boas Práticas** por feature — `docs/05-templates/catalogo-boas-praticas.template.md`

### Alterado

- `filosofia.md`: reconhece os três modos; a fonte de verdade sempre existe, muda apenas de onde vem
- `politica-estrutura-workspace.md`: `diretorio_legado` agora opcional; novo cenário greenfield (sem legado não é erro)
- `migracao-ativar.md` / `migracao-configurar-projeto.md`: detecção/gravação do `modo`; perguntas de banco e `.env` do legado condicionais ao modo
- `perfil-projeto.template.md`: campo `modo`; blocos de legado condicionais
- `fase-04-pagina-visual-base.md`: dark/light por referência ao guardião dedicado; logomarca e backlog adaptados a greenfield (features planejadas)
- **Sem mudança de comportamento quando `modo: migracao`** — toda a esteira de migração permanece idêntica

---

## [1.0.0] — 2026-05-16

### Adicionado

- Estrutura inicial do OML
- Documentação de visão geral (filosofia, regra-mãe, políticas)
- 18 comandos oficiais documentados
- 20 fases de migração documentadas
- 40+ guardiões documentados
- 13 protocolos operacionais
- 22 templates reutilizáveis
- 5 perfis de stack/projeto
- Estrutura de memória operacional
- README com instruções de uso
- Licença MIT
- Guia de contribuição
- Código de conduta
