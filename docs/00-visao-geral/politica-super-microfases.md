# Política de Super Microfases

## Objetivo

Garantir que todo trabalho do OML seja executado em unidades pequenas, sequenciais e verificáveis, mas sem paradas desnecessárias.

## Quando usar

Em todas as fases. Nenhuma tarefa pode ser feita em blocos grandes.

---

## Declaração permanente

O OML deve executar qualquer trabalho em unidades pequenas, sequenciais e verificáveis.

É **proibido** executar grandes blocos de migração de uma vez.

Porém, o OML deve **fluir entre microfases sem parar**, acumulando resumos em vez de interromper a cada passo. Parar para pedir autorização em cada microfase cansa o dev e atrasa a migração.

---

## Estrutura de uma microfase

Cada microfase deve conter:

1. **Objetivo específico** — o que será feito
2. **Escopo limitado** — o que está dentro e fora
3. **Entradas necessárias** — quais informações são pré-requisito
4. **Ações permitidas** — o que pode ser feito
5. **Ações proibidas** — o que não pode ser feito
6. **Arquivos que podem ser alterados** — lista explícita
7. **Checklist de conclusão** — critérios objetivos
8. **Evidências produzidas** — o que foi gerado
9. **Riscos encontrados** — lista breve, pouco texto
10. **Próxima microfase** — segue automaticamente se 🟢

---

## Exemplo de quebra em microfases

Em vez de:

```
Migrar tela de usuários.
```

O OML deve quebrar assim:

```
Microfase 1  — Identificar URL da tela de usuários
Microfase 2  — Capturar menu e breadcrumb
Microfase 3  — Identificar botões da tela
Microfase 4  — Identificar filtros
Microfase 5  — Identificar tabela/listagem
Microfase 6  — Identificar modais
Microfase 7  — Identificar ações de escrita
Microfase 8  — Identificar permissões
Microfase 9  — Identificar integrações
Microfase 10 — Identificar regras de negócio
Microfase 11 — Gerar dossiê
Microfase 12 — Implementar (fluxo contínuo)
```

**Todas as microfases acima fluem sem parada.** O OML executa todas em sequência e apresenta um resumo ao final.

---

## Encerramento

### Fases 🟢 Autônomo
Encerramento silencioso — o OML segue para a próxima sem exibir frase.

### Fases 🟡 Resumo
Ao final do bloco, o OML apresenta uma lista breve do que fez e encontrou. Pouco texto. Sem relatórios longos.

### Fases 🔴 Crítico
Encerramento com frase obrigatória e aguardar aprovação:

```
Com isso, finalizamos 100% a Fase X — [nome da fase].
```

---

## Checklist de conclusão de microfase

- [ ] Objetivo da microfase cumprido
- [ ] Escopo respeitado
- [ ] Nenhuma ação proibida executada
- [ ] Evidências registradas
- [ ] Arquivos atualizados
- [ ] Pendências marcadas como A INVESTIGAR
- [ ] Riscos registrados (lista breve)
- [ ] Próxima microfase indicada ou executada automaticamente

---

## Regra

O OML deve fluir com cadência, acumulando resumos, e parar somente em Gates (🔴). Velocidade com segurança, não lentidão com burocracia.
