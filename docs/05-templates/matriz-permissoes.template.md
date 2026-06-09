# Matriz de Permissões (RBAC) — visão global

<!--
  Espelho agregado dos ledgers memoria/permissoes/{slug}.md. Gerada/atualizada por /migracao-mapear-permissoes.
  Vive em memoria/permissoes/matriz-permissoes.md. NUNCA inventa concessão — só reflete os ledgers (origem citada lá).
  É a visão "quem pode o quê" do ERP inteiro: base de auditoria de acesso e de paridade global.
-->

## Como ler

- **Sujeito** = perfil / nível / setor / unidade / usuário que detém a concessão.
- **Recurso** = tela (`id_tela`) e suas ações (⑥).
- **Escopo** = setor (③) / unidade (④) / nível (⑤) que restringe.
- Toda célula tem origem no ledger da tela; aqui só se **agrega**.
- **Default-deny** é global: ausência de linha = **sem acesso**.

## Telas mapeadas

| Tela / slug | `id_tela` | Rota nova | Guarda aplicada? | Mapa verificado | Achados |
|---|---|---|---|---|---|
| ex.: `nps-painel` | 201 | `nps.painel.index` | ✅ | ✅ 2026-06-09 | — |

## Matriz sujeito × recurso × ação

| Sujeito (perfil/nível/setor) | Tela | Ações permitidas | Escopo | Chave de permissão (novo) | Origem (ledger) |
|---|---|---|---|---|---|
| ex.: nível admin | `nps-painel` | ver, validar, editar | unidade do usuário | `tela.nps-painel.*` | `permissoes/nps-painel.md` |
| ex.: nível operador | `nps-painel` | ver | unidade do usuário | `tela.nps-painel.ver` | `permissoes/nps-painel.md` |

## Escopos multi-tenant (unidade) — mapa de isolamento

<!-- Quais telas filtram por unidade e como — o que impede vazamento entre hospitais. -->

| Tela | Filtra por unidade? | Mecanismo legado | Mecanismo novo | Status |
|---|---|---|---|---|
| ex.: `nps-painel` | sim | `$_SESSION['unidade']` + `permissao_unidade` | global scope `unidade` | ✅ |

## Achados de segurança abertos (🟠) e mudanças de acesso (🔴)

<!-- Consolida os achados dos ledgers que aguardam o dev. 🟠 → pendencias.md · 🔴 → decisoes.md. -->

| ID | Tela | Achado / mudança | 🟠/🔴 | Destino |
|---|---|---|---|---|
| — | — | — | — | — |

## Cobertura

| Métrica | Valor |
|---|---|
| Telas com ledger de permissões | 0 |
| Telas com mapa **verificado** (apto Gate 2) | 0 |
| Telas sem guarda (🟠) | 0 |
| Mudanças de acesso (🔴) registradas | 0 |
| Última atualização | AAAA-MM-DD |
