# Protocolo de Plugins e Skills do Claude

## Objetivo
Definir como o OML **detecta, recomenda, usa e registra** os plugins/skills do Claude Code disponíveis na sessão para reforçar a construção e a migração — sem depender da memória do dev e sem prometer o que o agente não pode fazer.

## Quando usar
- Na **ativação** (`/migracao-ativar`) e na **configuração** (`/migracao-configurar-projeto`): inventariar o que está disponível.
- Na **Fase 04 (Design System / Gate 1)** de construção: usar o plugin de design.
- Antes de **revisar, testar ou pesquisar arquitetura**: usar os plugins correspondentes.

---

## O que é verdade sobre plugins (não alucinação)

O OML roda **dentro** do Claude Code. É importante ser honesto sobre o que o agente consegue:

| Capacidade | O agente consegue? |
|---|---|
| **Ver** quais skills estão disponíveis na sessão | ✅ Sim — aparecem na lista de skills do contexto |
| **Invocar** uma skill disponível (ex.: `frontend-design`) | ✅ Sim — via a ferramenta de Skill |
| **Verificar** se um plugin está ativo | ✅ Indiretamente — se a skill do plugin aparece na lista, está ativo |
| **Instalar/ativar** um plugin sozinho, em silêncio | ❌ **Não** — instalação de plugin é ação do **dev** (`/plugin`) |

> Portanto a regra do OML é: **detectar → usar se disponível → orientar a instalação se ausente**. Nunca fingir que usou um plugin que não estava disponível, e nunca bloquear o fluxo só porque um plugin opcional falta.

---

## Procedimento de detecção (passo a passo)

1. **Listar o disponível.** Na ativação, o OML verifica quais skills/plugins estão presentes na sessão e registra em `memoria/plugins-disponiveis.md` (gerado a partir do que o contexto expõe).
2. **Comparar com o "kit recomendado"** (tabela abaixo) conforme o **modo** e a **stack** do projeto.
3. **Para cada recomendado ausente:** emitir **uma linha** de orientação ao dev (como instalar via `/plugin`), marcada como **pendência opcional** — não vira bloqueio (ver [pendências humanas](../03-guardioes/guardiao-pendencias-humanas.md), categoria *ferramental*).
4. **Registrar a decisão** (usar / instalar depois / dispensar) em `memoria/decisoes.md` e no perfil.

> Como o dev instala: no Claude Code, `/plugin` abre o gerenciador; marketplaces entram com `/plugin marketplace add <fonte>` e plugins com `/plugin install <nome>`. O OML **sugere**; quem instala é o dev.

---

## Kit recomendado por situação

Apenas skills/plugins **reais** do ecossistema Claude Code. O OML usa o que estiver disponível e **degrada graciosamente** quando não estiver.

| Plugin / Skill | Para quê | Quando o OML aciona |
|---|---|---|
| **`frontend-design`** | Gerar interfaces distintas e de alto padrão, fugindo do "AI genérico" | Construção, **Fase 04** (Design System) e ao criar telas novas com forte peso visual |
| **`code-review`** | Revisar o diff em busca de bugs e simplificações | Antes de homologar (Gate 2) e no `/push` |
| **`security-review`** | Revisão de segurança das mudanças pendentes | Features **Estritas** (dados sensíveis, financeiro/clínico) antes do rollout |
| **`verify`** / **`run`** | Subir o app e confirmar que a mudança funciona de verdade | Homologação operacional (Fase 15) e revisão de paridade (Fase 14) |
| **`deep-research`** | Pesquisa multi-fonte verificada (libs, abordagens, trade-offs) | Decisão de arquitetura/biblioteca (ver [protocolo de decisão de arquitetura](protocolo-decisao-arquitetura.md)) |

> **Outros plugins** (acessibilidade, testes, lint) podem existir no marketplace do dev. O OML **não inventa nomes**: na ativação, lista o que de fato está disponível e sugere avaliar o marketplace para os eixos ainda descobertos (a11y, e2e, etc.).

---

## Regra de uso do `frontend-design` (construção)

1. Na Fase 04, **se** `frontend-design` estiver disponível, o OML o usa para propor a direção visual e os componentes-base — **mas o resultado continua subordinado** aos guardiões do OML: [tokens/dark-light](../03-guardioes/guardiao-tema-dark-light.md), [acessibilidade](../03-guardioes/guardiao-acessibilidade.md), [reúso de componentes](../03-guardioes/guardiao-reuso-componentes.md) e [design](../03-guardioes/guardiao-design.md).
2. O design gerado **não pula o Gate 1**: o dev aprova antes de virar padrão.
3. Se o plugin **não** estiver disponível, o OML constrói o Design System pelos próprios guardiões e registra a sugestão de instalar `frontend-design` para iterações futuras.

> O plugin acelera; o guardião decide. Plugin nenhum substitui acessibilidade, tokens ou reúso.

---

## Checklist
- [ ] Skills/plugins disponíveis inventariados em `memoria/plugins-disponiveis.md`
- [ ] Kit recomendado comparado ao disponível (por modo/stack)
- [ ] Ausências relevantes viraram orientação de instalação (pendência opcional), não bloqueio
- [ ] Uso de `frontend-design` (quando presente) submetido aos guardiões e ao Gate 1
- [ ] Decisão (usar/instalar/dispensar) registrada em `memoria/decisoes.md`

## Impacto em outros guardiões / protocolos
- **[Guardião de Design](../03-guardioes/guardiao-design.md)** e **[Reúso de Componentes](../03-guardioes/guardiao-reuso-componentes.md):** o output de qualquer plugin de design passa por eles.
- **[Pendências Humanas](../03-guardioes/guardiao-pendencias-humanas.md):** instalar plugin é tarefa do dev (categoria *ferramental*).
- **[Protocolo de Decisão de Arquitetura](protocolo-decisao-arquitetura.md):** `deep-research` apoia a escolha.
