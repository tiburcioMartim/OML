# Guardião de Reúso de Componentes

## Missão
Impedir design desconexo e espalhado. **Reusar antes de criar; criar uma vez, melhorar sempre.** Cada padrão visual/comportamental existe em **um único componente canônico**, consumido por todas as telas — nunca recriado, copiado ou estilizado por fora.

## Regra-dura (reuse-first)
Antes de criar **qualquer** componente, o OML é **obrigado** a consultar o [inventário de componentes](../05-templates/inventario-componentes.template.md) (`memoria/inventario-componentes.md`) e a [Página Visual](guardiao-design.md). Só se cria um componente novo quando ficar provado que **não é variante** de um existente. Copiar-e-colar estilo entre telas é violação.

## Quando ativo
Sempre — nos três modos. Em migração, garante que telas migradas convirjam para os mesmos componentes; em construção, garante que o sistema nasça com uma biblioteca coesa.

---

## Hierarquia de reúso (sempre de baixo para cima)

1. **Token** — cor, espaçamento, raio, tipografia. Nunca valor hardcoded (ver [customização visual](guardiao-customizacao-visual.md) e [tema dark/light](guardiao-tema-dark-light.md)).
2. **Primitivo** — Botão, Input, Select, Badge, Modal, Tabela canônica. Base de tudo.
3. **Composto** — Card de paciente, Form de cadastro, Toolbar de filtros. **Compõe primitivos**, não os redesenha.
4. **Página/Layout** — Monta compostos. Não introduz estilo próprio.

> Precisa de algo novo? Suba a escada: existe token? existe primitivo? é variante de um composto? Só o que falta em **todos** os degraus vira componente novo.

---

## Variante, não cópia

Diferenças visuais/comportamentais entram como **props/variants no componente existente**, nunca como um segundo componente:

- ✅ `<Botao variante="perigo" tamanho="sm">` — uma fonte de verdade.
- ❌ `BotaoPerigo.vue` + `BotaoPequeno.vue` copiados do `Botao.vue`.
- Props **aditivas e não-invasivas** (ex.: a prop `linhaClass` da tabela canônica — ver [componentes Vue](../06-perfis/vue/componentes.md)) preservam a paridade comportamental.

Lógica transversal (formatação, tema, a11y, permissões, tabela) **não** vira componente: vira **Composable** (ver [composables obrigatórios](../06-perfis/vue/composables-obrigatorios.md)).

---

## Fluxo obrigatório ao precisar de UI

1. **Buscar** no inventário + Página Visual um componente que sirva.
2. **Achou exato?** Usar.
3. **Achou parecido?** Estender por prop/variant **no componente existente** e documentar a variante.
4. **Não achou?** Criar o componente, **atribuir ID único**, registrar no inventário e documentar na Página Visual **antes** de usá-lo em tela.
5. **Encontrou duplicata existente?** Consolidar no canônico e remover a cópia (auto-limpeza — ver [política de auto-limpeza/refatoração](../00-visao-geral/politica-auto-limpeza-refatoracao.md)).

---

## Anti-padrões (violação)
- Estilizar um elemento "só nesta tela" com classes soltas em vez de usar/estender o componente.
- Dois componentes que fazem quase a mesma coisa com nomes diferentes.
- Recriar tabela, modal, paginação ou form do zero por tela.
- Cor/espaçamento hardcoded em vez de token.
- Componente novo sem ID, sem registro no inventário e sem entrada na Página Visual.

---

## Gate
Nenhuma tela avança para implementação/homologação com componente novo **não justificado** (não provado que não é variante) ou **não registrado**. O [guardião contínuo de padronização](guardiao-continuo-padronizacao.md) fiscaliza duplicatas no repositório novo.

## Checklist
- [ ] Inventário e Página Visual consultados antes de criar UI
- [ ] Diferença resolvida por prop/variant no canônico (não por cópia)
- [ ] Componente novo (se houver) com ID, registro no inventário e doc na Página Visual
- [ ] Lógica transversal em Composable, não em componente
- [ ] Duplicatas encontradas foram consolidadas no canônico

## Impacto em outros guardiões
- **[Guardião de Design](guardiao-design.md):** documenta o componente; este guardião garante que ele seja **reusado** e não multiplicado.
- **[Composables Obrigatórios](../06-perfis/vue/composables-obrigatorios.md):** lógica transversal não vira componente.
- **[Customização Visual](guardiao-customizacao-visual.md) / [Tema Dark/Light](guardiao-tema-dark-light.md):** tokens são o degrau 1 da hierarquia.
- **[Boas Práticas Proativas](guardiao-boas-praticas-proativas.md):** é o eixo "Reúso de componentes" do catálogo.
