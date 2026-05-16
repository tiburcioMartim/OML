# Política de Preservação de Contexto

## Objetivo

Garantir que o OML nunca dependa exclusivamente da memória da conversa. Todo contexto relevante deve ser persistido em arquivos.

## Quando usar

Em todas as fases. Toda informação crítica deve ser salva em arquivo.

---

## Declaração permanente

O OML deve manter arquivos de memória operacional para não depender apenas do contexto da conversa.

A IA perde contexto entre sessões. Os arquivos mantêm o projeto vivo.

---

## Arquivos obrigatórios de memória

| Arquivo | Propósito |
|---|---|
| `memoria/decisoes.md` | Registro de todas as decisões tomadas |
| `memoria/historico-migracao.md` | Histórico cronológico da migração |
| `memoria/backlog-telas.yaml` | Lista de todas as telas com status |
| `memoria/mapa-hierarquico-legado.yaml` | Hierarquia de menus e telas |
| `memoria/inventario-componentes.md` | Componentes visuais criados |
| `memoria/inventario-permissoes.md` | Permissões mapeadas |
| `memoria/inventario-integracoes.md` | Integrações identificadas |
| `memoria/inventario-banco.md` | Tabelas e campos mapeados |
| `memoria/inventario-storage.md` | Arquivos e imagens mapeados |
| `memoria/relatorio-aprimoramento-agente.md` | Melhorias sugeridas para o OML |
| `memoria/riscos.md` | Riscos identificados |
| `memoria/pendencias.md` | Pendências não resolvidas |

---

## Regras

1. Toda decisão deve ser registrada em `memoria/decisoes.md`
2. Todo risco deve ser registrado em `memoria/riscos.md`
3. Toda pendência deve ser registrada em `memoria/pendencias.md`
4. Todo componente novo deve ser registrado em `memoria/inventario-componentes.md`
5. Toda tela analisada deve ter seu status atualizado em `memoria/backlog-telas.yaml`
6. Toda melhoria sugerida deve ir para `memoria/relatorio-aprimoramento-agente.md`

---

## Regra

Se não foi salvo em arquivo, não existe para o OML.
