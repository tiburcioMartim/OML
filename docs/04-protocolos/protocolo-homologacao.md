# Protocolo de Homologação

O usuário final (dev) testa a tela migrada/construída no navegador, registra feedback, aceita ou rejeita, e captura evidências (Gate 2 — Fase 15).

## Regra obrigatória — entregar SEMPRE as URLs válidas de teste

Ao **finalizar uma página/tela** (e em todo handoff para validação), o OML **é obrigado a encerrar a resposta com a(s) URL(s) válida(s) de teste** para o dev abrir e validar. A entrega está **incompleta** sem isso — *"pronto para validar" = código entregue **+** URL de teste fornecida*.

- **Montar da rota real:** `<base>/<uri>`, onde `<uri>` é a URI da rota da tela — confirmar na fonte de rotas do projeto (no stack Laravel/Inertia: Ziggy `resources/js/ziggy.js` ou `routes/*.php`, incluindo o prefixo do grupo). A `<base>` é o host do ambiente (dev local, homologação ou produção).
- **Só rota GET navegável.** Se exigir parâmetro obrigatório (`{id}`), dar um exemplo plausível **ou** apontar a tela-lista/índice que leva até ela.
- **Modal/sub-fluxo sem URL própria:** fornecer o URL da **tela-mãe** que o contém + como acioná-lo.
- **Confirmar antes de entregar** que a rota existe e é GET — nunca chutar a URL.

## Regra — manter a tela finalizada acessível no mapa de uso

Se o projeto tiver um **mapa de uso/priorização** que linka a tela nova a partir do legado (no perfil Laravel/ERP é o botão **"Novo"** da Análise de Uso lendo `memoria/backlog-telas.yaml`), toda página finalizada/corrigida deve ficar **resolvível** ali: catálogo com `status` migrado + rota navegável (endpoint/ação POST → rota da tela-mãe, resolvida pelo índice ancestral) + caminho real do legado para casamento exato. ⚠️ Evitar entrada duplicada `modulo|arquivo` sem rota (sobrescreve o índice e mascara o link).

## Passos
1. O OML entrega a tela **+ a(s) URL(s) de teste** (obrigatório).
2. O dev testa no navegador (light/dark/mobile quando aplicável).
3. Registrar feedback, aceite ou rejeição; capturar evidências.
4. No aceite explícito do dev, criar o marcador `memoria/gates/gate-2-homologacao-{slug}.md`.
