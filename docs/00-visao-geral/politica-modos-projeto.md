# Política de Modos de Projeto

## Objetivo

Reconhecer que o OML opera em **três modos** — Migração, Construção (greenfield) e Híbrido — e definir **de onde vem a fonte de verdade funcional** em cada um, sem forkar o framework e sem alterar o comportamento da migração.

## Quando usar

Sempre. Esta política é lida na ativação (`/migracao-ativar`) e na configuração (`/migracao-configurar-projeto`), e governa quais fases, comandos e guardiões se aplicam.

---

## Princípio reconciliador

A Filosofia do OML diz que **o legado é a fonte de verdade funcional**. Isso permanece **verdadeiro no modo Migração** e continua sendo o coração do framework.

O que esta política acrescenta é: *a fonte de verdade sempre existe — o que muda é de onde ela vem*. O OML nunca constrói da imaginação da IA. Em construção, ele constrói da **decisão explícita do dev + boas práticas consolidadas + perfil do projeto**, registradas em arquivo, com o mesmo rigor anti-alucinação aplicado ao legado.

> Os guardiões deixam de ser lidos apenas como **comportamentos a preservar** (migração) e passam a ser, também, **padrões a aplicar** (construção). O mesmo arquivo serve aos dois modos — muda a moldura, não o conteúdo técnico.

---

## Os três modos

| Modo | Quando se aplica | Fonte de verdade funcional | Validação final |
|---|---|---|---|
| **Migração** | Existe um sistema legado a ser modernizado | Código, banco, telas e regras do **legado** | Paridade com o legado (Fase 14) |
| **Construção** (greenfield) | Projeto novo, sem legado de origem | **Decisão do dev + Boas Práticas + Perfil**, registrada em `memoria/decisoes.md` | Critérios de aceite + [Catálogo de Boas Práticas](../03-guardioes/guardiao-boas-praticas-proativas.md) |
| **Híbrido** | Domínios migrados convivem com features 100% novas no mesmo projeto | Legado (domínios migrados) **+** `decisoes.md` (features inéditas), no **mesmo ledger** | Paridade (migrado) + critérios de aceite (inédito) |

---

## Mecanismo: campo `modo` no perfil

A fonte única de verdade do modo é o campo **`modo`** gravado no perfil do projeto (`docs/06-perfis/[perfil]/perfil.md`):

```
modo: migracao | construcao | hibrido
```

Todos os comandos e fases leem esse campo para ramificar o comportamento. **Não existe comando paralelo `/construir-ativar` nem fork "OML-criacao":** o ponto de entrada continua sendo `/migracao-ativar`, que detecta a ausência de legado e pergunta o modo.

> Quando `modo: migracao`, **nada** do comportamento histórico muda. Toda a esteira de migração permanece idêntica.

---

## O que muda por modo

### Modo Construção (greenfield)

- **Fonte de verdade:** `memoria/decisoes.md` + Catálogo de Boas Práticas + perfil. Cada regra de negócio inédita é registrada com `origem: decisão do dev`.
- **Pula:** fases de descoberta e investigação do legado (Fases 01, 02, 03, 05, 06) e de paridade/conciliação (Fases 14, 17), pois não há legado para investigar nem espelhar.
- **Substitui:** a esteira de descoberta de telas pelo comando [`/construir-capturar-requisitos`](../01-comandos/construir-capturar-requisitos.md), que captura requisitos e produz dossiês de feature.
- **Entra direto:** na Fase 04 (Design System proativo — Gate 1) após a captura de requisitos.
- **Workspace:** o `diretorio_legado` é opcional; só existem OML + novo sistema (ver [política de estrutura de workspace](politica-estrutura-workspace.md)).
- **Logomarca/identidade:** definida com o dev (identidade visual nova), não herdada do legado.
- **Menu/dashboard:** alimentado por um backlog de **features planejadas**, não por telas migradas.

### Modo Híbrido

- Convivem os dois fluxos no mesmo projeto: domínios migrados seguem a esteira de migração; features inéditas seguem o fluxo de construção.
- Regras inéditas entram no **mesmo ledger** de regras de negócio (`memoria/regras-negocio/{slug}.md`) com `origem: decisão do dev (decisoes.md)` + telas análogas referenciadas — mesmo formato e mesmos status (✅ / 🟡 / 🟠 / 🔴) da migração.
- Divergência de comportamento entre app que **escreve** e app que **lê** é proibida e vira pendência.

---

## O que NÃO muda em nenhum modo

Estes mecanismos são **agnósticos de modo** e se aplicam integralmente aos três:

- **Motor de autonomia** (🟢 Autônomo / 🟡 Resumo / 🔴 Crítico) e a regra de elevação automática (ver [política de autonomia](politica-autonomia.md)).
- **Os 2 Gates:** Gate 1 (Design System) e Gate 2 (Homologação).
- **Microfases** (ver [super microfases](politica-super-microfases.md)).
- **Matriz de criticidade** (Expresso / Padrão / Estrito).
- **Política anti-alucinação, de autorização e de preservação de contexto.**
- **Definição de Pronto** (apenas o critério final de validação é parametrizado: paridade × critérios de aceite).
- **Guardião contínuo** (Fase 19), que opera sobre o repositório novo independentemente da origem.

---

## Detecção do modo

1. Na ativação, o OML valida o workspace. Se **não houver** um diretório legado irmão, o projeto é candidato a **Construção** — o OML **pergunta o modo** ao dev (não trata como erro).
2. Se houver legado, o OML pergunta se o projeto é **Migração pura** ou **Híbrido** (migra o legado e também terá features novas).
3. O modo escolhido é gravado no perfil e em `memoria/decisoes.md`.

---

## Checklist

- [ ] Modo do projeto detectado/perguntado na ativação
- [ ] Campo `modo` gravado no perfil do projeto
- [ ] Decisão de modo registrada em `memoria/decisoes.md`
- [ ] Em construção/híbrido: fonte de verdade das regras inéditas registrada com `origem: decisão do dev`
- [ ] Comportamento da migração inalterado quando `modo: migracao`