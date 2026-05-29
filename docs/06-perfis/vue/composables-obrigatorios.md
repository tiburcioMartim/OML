# Composables Obrigatórios (Vue)

Lógica transversal mora em **Composables**, nunca copiada dentro de componentes. É **proibido reescrever** o que um Composable já encapsula — o OML deve consultar e reutilizar. Esta regra é reforçada pela `<ai_directive>` embarcada no Styleguide (`docs/04-protocolos/protocolo-diretivas-ia-styleguide.md`).

> Nomes abaixo são a convenção padrão do OML. Se o projeto já usa outros nomes, registrar o mapeamento no perfil e manter a regra de "não duplicar".

| Composable | Para quê | Em vez de |
|---|---|---|
| `useMasks()` | Máscaras/format PT-BR: R$, datas, CPF/CNPJ, telefone, CEP, % | reescrever regex/format em cada campo |
| `useTheme()` | Tema claro/escuro, persistência, sync com SO (`prefers-color-scheme`) | ler/gravar `localStorage` e alternar classe `.dark` na mão |
| `useA11y()` | Helpers de acessibilidade: foco, `aria-*`, navegação por teclado, redução de movimento | atributos ARIA ad-hoc e handlers de teclado duplicados |
| `usePermissions()` | Checagem de permissões/papéis do usuário no front | `if` de papel espalhado em componentes |
| `useTable()` | Estado de tabela: paginação, filtros, ordenação, seleção | reimplementar paginação/ordenação por tela |

## Regras

- **Antes de escrever lógica de formatação, tema, acessibilidade, permissão ou tabela:** verificar se há Composable que já faz. Se houver, usar.
- **Ao encontrar** lógica duplicada que deveria estar num Composable: refatorar para o Composable (auto-limpeza — `docs/00-visao-geral/politica-auto-limpeza-refatoracao.md`).
- **Composable novo** (uma necessidade transversal ainda não coberta): criar o Composable e documentá-lo aqui — não resolver localmente.
- Componentes consomem Composables; **não** duplicam a lógica deles.
