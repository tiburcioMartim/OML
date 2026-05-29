# Protocolo de Varredura de Models (Anti-Scaffold-Alucinado)

## Problema

Scaffolds alucinados — Model apontando para tabela inexistente, Vue inventando campos, controller chamando métodos fantasmas — aparecem em projetos cujo setup inicial foi feito sem confirmar o schema do banco vivo. Quando só são descobertos no momento da migração, geram retrabalho integral. Esta varredura os pega **antes de qualquer trabalho**.

## Quando roda

Como etapa automática de `/migracao-ativar`, **antes de qualquer fase de trabalho**. Pode ser re-executada a qualquer momento.

## Passos

1. **Varrer Models.** Listar `app/Models/**/*.php` do projeto novo (e do legado, se for Eloquent).
2. **Extrair a tabela de cada Model:** propriedade `$table` quando declarada; senão, o plural snake_case do nome da classe (convenção Eloquent).
3. **Validar contra o banco vivo:** para cada tabela, checar `Schema::hasTable('<tabela>')` (ou consulta equivalente ao information_schema).
4. **Classificar:**
   - ✅ **OK** — tabela existe.
   - 🟠 **Suspeito** — tabela existe mas há divergência relevante (ex.: colunas referenciadas no código não existem).
   - 🔴 **Órfão** — `$table` não existe no banco. Scaffold provavelmente alucinado.
5. **Emitir relatório** em `memoria/scaffolds-suspeitos.md` (formato em `docs/05-templates/` — instância já presente na memória).
6. **Abrir pendência prioritária.** Cada Model 🔴 Órfão vira pendência **prioritária** em `memoria/pendencias.md` — não se inicia migração de tela que depende de Model órfão sem o dev decidir (apagar o scaffold, criar a tabela, ou apontar para a tabela legada correta).

## Saída

`memoria/scaffolds-suspeitos.md` com: Model · `$table` esperada · tabela existe? · status (✅/🟠/🔴) · ação recomendada.

## Regra

Model órfão é **bloqueio de qualidade**: o OML não constrói em cima de scaffold alucinado. Registrar, encaminhar ao dev, e só prosseguir com decisão registrada em `memoria/decisoes.md`.
