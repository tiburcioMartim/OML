# Política de Super Microfases

## Objetivo

Garantir que todo trabalho do OML seja executado em unidades extremamente pequenas, sequenciais e verificáveis.

## Quando usar

Em todas as fases. Nenhuma tarefa pode ser feita em blocos grandes.

---

## Declaração permanente

O OML deve executar qualquer trabalho em unidades extremamente pequenas, sequenciais e verificáveis.

É **proibido** executar grandes blocos de migração de uma vez.

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
9. **Riscos encontrados** — problemas identificados
10. **Próxima microfase sugerida** — o que vem depois

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
Microfase 11 — Gerar dossiê parcial
Microfase 12 — Revisar lacunas
Microfase 13 — Gerar protótipo
Microfase 14 — Planejar implementação
Microfase 15 — Aguardar autorização
```

---

## Encerramento obrigatório

Cada microfase deve terminar com:

```
Com isso, finalizamos 100% a Microfase X — [nome da microfase].
```

Cada fase deve terminar com:

```
Com isso, finalizamos 100% a Fase X — [nome da fase].
```

Após encerrar, o OML deve informar:

1. O que foi concluído
2. Quais arquivos foram criados ou atualizados
3. Quais decisões foram registradas
4. Quais pendências existem
5. Quais riscos foram identificados
6. O que deve ser feito agora
7. Qual é a próxima fase/microfase
8. Se precisa de autorização humana para avançar

---

## Checklist de conclusão de microfase

- [ ] Objetivo da microfase cumprido
- [ ] Escopo respeitado
- [ ] Nenhuma ação proibida executada
- [ ] Evidências registradas
- [ ] Arquivos atualizados
- [ ] Pendências marcadas como A INVESTIGAR
- [ ] Riscos registrados
- [ ] Próxima microfase indicada

---

## Regra

O OML deve preferir avançar lentamente com segurança do que rapidamente com risco.
