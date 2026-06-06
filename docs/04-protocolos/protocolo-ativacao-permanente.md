# Protocolo de Ativação Permanente dos Guardiões

## Objetivo
Fazer com que os guardiões **não-negociáveis** (design, reúso de componentes, acessibilidade, máscaras, tokens, segurança) fiquem **sempre ativos** — em **toda** edição de código no projeto novo — **sem** o dev precisar digitar `/migracao-ativar` a cada sessão.

## O problema
`/migracao-ativar` carrega as regras **sob demanda**. Se o dev abre o editor e começa a codar direto, o agente pode agir sem os guardiões. Para um guardião "extremamente rigoroso" (como o de design), isso é inaceitável: ele precisa valer **por padrão**.

---

## Como o Claude Code carrega contexto sozinho

O Claude Code lê automaticamente, no início de cada sessão, o arquivo **`CLAUDE.md`** presente no diretório de trabalho (e nos diretórios acima). É o mecanismo idiomático de "regras permanentes": o que estiver nele vale em **toda** interação, sem comando.

> Como o dev trabalha **dentro do projeto novo** (diretório irmão do OML), é **lá** que mora o `CLAUDE.md` que mantém os guardiões ativos — apontando para os guardiões do OML por caminho relativo (`../OML/docs/...`).

---

## Mecanismo (camadas, da mais simples à mais forte)

### Camada 1 — `CLAUDE.md` no projeto novo (obrigatória)
Na configuração (`/migracao-configurar-projeto`), o OML **gera um `CLAUDE.md` na raiz do projeto novo** a partir de [`claude-md-projeto-novo.template.md`](../05-templates/claude-md-projeto-novo.template.md). Esse arquivo:
- Declara que o projeto é regido pelo OML e **lista os guardiões sempre-ativos** com link relativo.
- **Embute as regras de berço inegociáveis** (resumo curto) para valerem mesmo sem leitura dos arquivos completos.
- Aponta o caminho do OML irmão e os comandos disponíveis.

Resultado: ao abrir qualquer sessão no projeto novo, o agente já chega com design/reúso/a11y/máscaras/tokens ligados.

### Camada 2 — Hook `SessionStart` (opcional, reforço)
Para quem quer garantia extra, um hook `SessionStart` em `.claude/settings.json` do projeto novo injeta um lembrete dos guardiões no início de cada sessão (ver [skill de configuração de hooks]). Útil quando o time é grande e nem todos leem o `CLAUDE.md`. **Opcional** — a Camada 1 já resolve o caso comum.

### Camada 3 — Gate de qualidade no CI (rede de segurança)
Mesmo que o contexto falhe, o [protocolo de CI/qualidade](protocolo-ci-qualidade.md) barra no PR violações objetivas (cor hardcoded, componente não documentado, falta de `alt`/ARIA, etc.). É a salvaguarda que **não depende** de o agente "lembrar".

> As três camadas se complementam: contexto (CLAUDE.md) → reforço (hook) → bloqueio mecânico (CI). Rigor de verdade não confia só na memória do agente.

---

## O que entra no `CLAUDE.md` do projeto (resumo embutido)
Apenas o **núcleo inegociável**, curto e direto — o detalhe fica nos guardiões linkados:
- **Design & reúso:** reuse-first; nada de cor/estilo hardcoded; componente novo só se não for variante; registrar no inventário.
- **Acessibilidade:** WCAG 2.2 AA de berço; widget de fonte/contraste/redução de movimento; dark/light por tokens.
- **Máscaras:** PT-BR sempre; nunca exibir dado bruto formatável.
- **Segurança/Segredos:** validação server-side; segredo só em `.env`.
- **Autorização:** não implementar sem autorização explícita; regra-mãe vale.
- **Pendências humanas:** o que só o dev faz vira item em `memoria/pendencias-humanas.md`.

## Checklist
- [ ] `CLAUDE.md` gerado na raiz do **projeto novo** (Camada 1) na configuração
- [ ] Guardiões inegociáveis listados com link relativo ao OML
- [ ] Núcleo de regras de berço embutido (resumo) no `CLAUDE.md`
- [ ] (Opcional) hook `SessionStart` configurado para reforço
- [ ] Gate de CI ativo como rede de segurança (Camada 3)

## Impacto / Relacionado
- **[Guardião de Design](../03-guardioes/guardiao-design.md) e [Reúso](../03-guardioes/guardiao-reuso-componentes.md):** passam a valer por padrão, não sob demanda.
- **[`/migracao-configurar-projeto`](../01-comandos/migracao-configurar-projeto.md):** passa a gerar o `CLAUDE.md` do projeto novo.
- **[Protocolo de CI/Qualidade](protocolo-ci-qualidade.md):** Camada 3.
- **Template:** [`claude-md-projeto-novo.template.md`](../05-templates/claude-md-projeto-novo.template.md).
