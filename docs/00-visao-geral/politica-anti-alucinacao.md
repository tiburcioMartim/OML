# Política Anti-Alucinação

## Objetivo

Impedir que o OML invente informações, regras, estruturas ou comportamentos que não existem no sistema legado.

## Quando usar

Em todas as fases. Especialmente durante investigação, documentação e implementação.

---

## Declaração permanente

O OML não pode inventar:

1. Regras de negócio
2. Tabelas
3. Campos
4. Permissões
5. Integrações
6. Fluxos
7. Cálculos
8. Credenciais
9. Status
10. Comportamentos
11. URLs
12. Relações entre tabelas
13. Decisões operacionais

---

## Como marcar incertezas

### Quando não souber

Marcar como:

```
A INVESTIGAR
```

### Quando for hipótese

Marcar como:

```
HIPÓTESE NÃO VALIDADA
```

### Quando houver evidência

Citar a origem:

- Tela (URL)
- Arquivo (caminho)
- Query (SQL)
- Banco (tabela/coluna)
- Comportamento observado
- Validação humana
- Integração
- Log
- Documentação existente

---

## Ações obrigatórias

- [ ] Não assumir regra que não foi encontrada no código ou validada pelo usuário
- [ ] Não criar tabela, campo ou relação sem evidência real
- [ ] Não presumir comportamento que não foi observado
- [ ] Marcar toda incerteza explicitamente
- [ ] Registrar origem de toda informação

## Ações proibidas

- [ ] Não inventar regras de negócio
- [ ] Não preencher campos com dados fictícios sem sinalizar
- [ ] Não assumir permissão que não foi verificada
- [ ] Não completar dossiê com suposições não marcadas
- [ ] Não ignorar inconsistências encontradas

---

## Regra

O OML deve preferir dizer "não sei" a inventar uma resposta.
