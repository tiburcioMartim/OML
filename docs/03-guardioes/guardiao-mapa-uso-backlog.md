# Guardião do Mapa de Uso × Backlog

## Missão
Responder com evidência à pergunta **"esta tela do legado já foi migrada — e onde?"** e **"quais telas valem ser migradas primeiro?"**, cruzando o **uso real** do legado com o **backlog** e a **navegabilidade** da rota nova. Transforma priorização e confirmação de paridade em algo dirigido por dado, não por achismo.

## Regra-mãe
O **backlog** (`memoria/backlog-telas.yaml`) é a **fonte única** do vínculo `legado → rota nova`. Uso real **prioriza**; backlog **vincula**; navegabilidade **confirma**. Nenhuma dessas três pontas inventa vínculo — sem evidência, a tela fica como não resolvida, nunca como "migrada" por suposição (ver `docs/00-visao-geral/politica-anti-alucinacao.md` e a regra-mãe de rastreabilidade).

---

## As três pontas

1. **Uso real** — instrumentar o legado para **logar acesso** (qual URL/tela é de fato usada e com que frequência). O ranking por uso prioriza a migração por valor.
2. **Backlog como vínculo** — cada item do backlog carrega a `rota_laravel` correspondente. É o único lugar que liga a tela legada à rota nova.
3. **Navegabilidade** — a rota nova existe e é alcançável? Disso sai o status real e o link direto (deep-link) para a tela migrada.

---

## Resolvedor de status (genérico)

Ao decidir se uma tela legada está migrada e como linká-la:

- **Rota navegável (GET)** → status `migrada`, gera **link direto** (deep-link) e o botão **Novo** quando aplicável.
- **Endpoint de ação (não-GET: POST de `processar_*` / `salvar_*` etc.)** → **fallback ação→tela**: procurar o `index` (GET) do mesmo grupo/recurso e linkar para a tela onde a função vive. Não marcar como "não-migrada" só porque a ação em si não é navegável.
- **URL de diretório** (sem arquivo, ex.: termina em `/`) → **tolerar** resolvendo para o `index` do módulo.
- **Sem correspondência no backlog** → `não resolvida` (nunca "migrada" por suposição).

> Implementações específicas por stack moram no perfil — ver `docs/06-perfis/laravel/analise-uso-backlog.md` para o resolvedor Laravel (ação→`modulo.recurso.index`, diretório→`index.php`).

---

## Relatório de saída
Um relatório que, para cada tela legada:
- ranqueia por **uso real** (mais usadas primeiro);
- mostra o **status de migração** resolvido;
- **linka** o legado e a rota nova quando migrada.

Serve à priorização (migrar o que mais importa) e à confirmação de paridade (a função existe e é alcançável no novo).

## Modo: greenfield / híbrido
Em construção pura não há legado a instrumentar; o "uso" passa a ser a expectativa de uso das features planejadas em `/construir-capturar-requisitos`. Em híbrido, vale para a parte migrada. Governado por `docs/00-visao-geral/politica-modos-projeto.md`.

## Ações proibidas
- [ ] Marcar tela como migrada sem rota navegável **ou** fallback ação→tela resolvido
- [ ] Criar vínculo legado→novo fora do backlog
- [ ] Tratar endpoint de ação migrado como "não-migrado" por não ser GET
- [ ] Ignorar URL de diretório por não casar com arquivo
- [ ] Priorizar migração sem olhar o uso real quando o log existe
