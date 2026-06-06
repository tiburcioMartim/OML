<!--
  Template gerado pelo OML na raiz do PROJETO NOVO (não dentro do OML).
  Substitua [placeholders]. Caminho do OML é relativo a este projeto (sibling).
  Ver: docs/04-protocolos/protocolo-ativacao-permanente.md
-->

# [Nome do Projeto] — Regras Permanentes (regido pelo OML)

Este projeto é construído/migrado sob o **OML — Orquestrador de Migração Legada**, localizado em `../OML/`. As regras abaixo valem em **toda** sessão e **toda** edição — **sem** necessidade de rodar `/migracao-ativar`. Detalhe completo nos guardiões linkados.

## Modo do projeto
`modo: [migracao | construcao | hibrido]` — fonte de verdade em `../OML/docs/00-visao-geral/politica-modos-projeto.md`.

## Guardiões SEMPRE ativos (inegociáveis)
- **Design & Reúso** — `../OML/docs/03-guardioes/guardiao-design.md` e `guardiao-reuso-componentes.md`
- **Acessibilidade (WCAG 2.2 AA)** — `../OML/docs/03-guardioes/guardiao-acessibilidade.md`
- **Tema Dark/Light & Tokens** — `guardiao-tema-dark-light.md` + `guardiao-customizacao-visual.md`
- **Máscaras PT-BR** — `guardiao-mascaras-formatacao.md`
- **Segurança & Segredos** — `guardiao-seguranca.md` + `guardiao-segredos-credenciais.md`
- **LGPD** — `guardiao-lgpd-privacidade.md`
- **Testes** — `guardiao-testes.md`

## Núcleo de berço (resumo — vale por padrão)
1. **Reuse-first:** consultar `memoria/inventario-componentes.md` antes de criar UI. Componente novo só se não for variante. Diferenças viram prop/variant no canônico, nunca cópia.
2. **Sem hardcode visual:** cor/espaçamento/tipografia só via tokens. Dark e light nativos.
3. **Acessibilidade de berço:** HTML semântico, foco visível, ARIA, contraste 4.5:1, widget de fonte/contraste/redução de movimento em todas as páginas.
4. **Máscaras sempre:** nunca exibir dado bruto formatável (CPF, R$, datas, telefone…).
5. **Segurança:** validação server-side; segredo só em `.env` (nunca no código/log).
6. **Autorização:** não implementar sem autorização explícita (regra-mãe — `../OML/docs/00-visao-geral/regra-mae.md`).
7. **Pendências humanas:** o que só o dev faz (VPS, DNS, chaves de produção, legal) vira item em `memoria/pendencias-humanas.md` — `../OML/docs/03-guardioes/guardiao-pendencias-humanas.md`.
8. **Idioma:** todo o código e a documentação em **PT-BR**.

## Comandos
Comandos do OML disponíveis em `../OML/docs/01-comandos/comandos-oficiais.md`. Para retomar o fluxo completo: `/migracao-ativar`. Para status: `/migracao-status`.

## Memória do projeto
`memoria/` contém a fonte de verdade viva (decisões, backlog, inventários, pendências humanas). Nunca operar com memória defasada — sincronizar no início da sessão.
