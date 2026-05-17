problema: tenho um sistema erp legado com codigo procedural e muito hardcode, que precisa ser modernizado para o laravel seguindo as melhores praticas de linter, TDD, segurança, design padronizado, entre tudo que se precisa para o sistema ficar excelente, quero discutir com você porque não sei qual o melho caminho, mas eu acho talvez um agente que irá fazer uma migração minunciosa, extraindo todas as regras de negócio cuidadosamente, preservando as tabelas do legado porque nao podemos muda-las, preciso ver as telas antes de começar a codar, afinal de contas o erp já existe, queremos manter as funcionalidades e regras de negocio, porem modernizar para laravel e modernizar o layout, quero fazer de uma vez só, como vamos refazer do zero o sistema, tendo como guia um que já existe acho que seja possivel, mas quero conversar bastante com você sobre isso para sermos cirurgicos e acertivo em nossa migração, fazendo tudo por microfases para nao alucinar ou perder contexto, fases bem pequenas e bem definidas, uma em sequencia da outra, o que voce acha?

---

Sim, eu acho **muito possível** — e, pelo que você descreveu, **esse é justamente um caso ideal para uma migração guiada por agente**, mas com uma condição importante:

**não pode ser um agente “fazedor de código”. Precisa ser um agente de migração cirúrgica, investigativo, documentador, testador e só depois executor.**

A sua intuição está correta: como o ERP já existe, ele vira a **fonte de verdade funcional**. O novo Laravel não deve nascer da imaginação da IA. Ele deve nascer da leitura minuciosa do legado.

## Minha opinião direta

Eu **não faria uma reescrita livre do zero**.

Eu faria uma **reconstrução moderna orientada pelo legado**, preservando:

1. as tabelas existentes;
2. as regras de negócio;
3. os fluxos operacionais;
4. permissões;
5. relatórios;
6. filtros;
7. validações;
8. comportamentos escondidos em código procedural;
9. cálculos;
10. exceções e hardcodes importantes.

Mas modernizando:

1. arquitetura Laravel;
2. organização por módulos/domínios;
3. controllers enxutos;
4. services/actions;
5. policies/permissions;
6. validações formais;
7. testes;
8. layout;
9. componentes reutilizáveis;
10. design system;
11. segurança;
12. linting;
13. documentação viva.

Laravel combina bem com isso porque já oferece estrutura para MVC, camada de banco, validação, testes, autorização e organização de aplicação. A própria documentação atual destaca recursos como injeção de dependência, abstração de banco, filas, agendamentos e testes unitários/integrados. ([Laravel][1])

## O erro que precisamos evitar

O maior erro seria dizer para a IA:

> “Pegue esse ERP legado e refaça em Laravel.”

Isso vai dar ruim.

Ela pode:

* ignorar regra escondida;
* simplificar fluxo sem perceber;
* alterar cálculo;
* mudar comportamento de tela;
* criar tabela nova sem necessidade;
* inventar arquitetura bonita, mas incompatível;
* perder permissões;
* quebrar relatórios;
* modernizar demais e descaracterizar o operacional;
* alucinar campos, status e regras.

Então o processo precisa ser **travado por microfases**, com documentação e aprovação entre elas.

## O melhor caminho: migração por módulos, não por sistema inteiro

Mesmo que a vontade seja “fazer de uma vez só”, eu recomendo pensar assim:

> O projeto inteiro será reconstruído, mas a execução será feita módulo por módulo, tela por tela, regra por regra.

Exemplo:

1. módulo de clientes;
2. módulo de produtos;
3. módulo de estoque;
4. módulo financeiro;
5. módulo de vendas;
6. módulo de relatórios;
7. módulo de permissões;
8. módulo de notas/documentos;
9. configurações;
10. dashboard.

Dentro de cada módulo, a IA não começa codando. Ela primeiro cria um **dossiê funcional**.

## A estrutura ideal do agente

Eu criaria um **RHC Migration Agent** com papéis internos bem definidos. Não precisa ser literalmente vários agentes separados, mas a lógica deve ser essa:

### 1. Investigador do Legado

Responsável por analisar:

* arquivos PHP procedurais;
* queries SQL;
* includes;
* variáveis globais;
* sessões;
* permissões;
* telas;
* formulários;
* filtros;
* botões;
* modais;
* relatórios;
* cálculos;
* regras hardcoded;
* integrações;
* dependências entre páginas.

Ele não codifica nada. Só investiga.

### 2. Documentador Funcional

Transforma a investigação em documentação:

* objetivo da tela;
* atores envolvidos;
* fluxo principal;
* campos;
* tabelas usadas;
* joins;
* filtros;
* validações;
* botões;
* regras de negócio;
* mensagens de erro;
* permissões;
* comportamentos especiais;
* riscos;
* dúvidas.

### 3. Arquiteto Laravel

Converte o dossiê em plano técnico:

* rotas;
* controllers;
* requests;
* models compatíveis com tabelas legadas;
* services/actions;
* DTOs, se fizer sentido;
* policies;
* resources;
* components;
* testes;
* estrutura de pastas.

Laravel permite trabalhar com bancos existentes, mas será necessário configurar os Models com cuidado quando as tabelas não seguem as convenções do framework, como nomes de tabela, chaves primárias, timestamps e tipos de chave. A documentação do Eloquent, por exemplo, prevê ajustes para chaves primárias não convencionais. ([Laravel][2])

### 4. Guardião do Banco Legado

Esse papel é crítico.

Regra absoluta:

> O agente não pode alterar tabela, coluna, tipo, constraint ou registro do banco legado sem aprovação explícita.

Ele pode:

* mapear tabelas existentes;
* criar Models adaptados;
* criar camadas de compatibilidade;
* sugerir views ou tabelas auxiliares, se necessário;
* documentar inconsistências.

Mas não pode sair “melhorando o banco” sem autorização.

### 5. Guardião de Design

Antes de codar telas finais, ele precisa criar:

* wireframe;
* layout visual;
* componentes usados;
* tokens;
* padrões de espaçamento;
* estados de botão;
* tabela;
* filtros;
* modais;
* cards;
* formulários;
* estados vazios;
* mensagens de erro;
* responsividade.

Isso conversa muito com aquilo que você já vinha pensando: uma página interna de guia visual/design system. O ideal é que essa página seja criada logo no início e vire o parâmetro de toda a modernização.

### 6. Engenheiro de Testes

Antes ou durante a codificação, ele define:

* testes de regra de negócio;
* testes de validação;
* testes de autorização;
* testes de fluxo;
* testes de regressão comparando legado x Laravel;
* cenários críticos.

Laravel já tem suporte nativo para testes unitários e de integração dentro do ecossistema, o que ajuda muito nessa migração controlada. ([Laravel][1])

### 7. Revisor de Migração

Ao final de cada microfase, ele confere:

* a regra do legado foi preservada?
* a tela nova cumpre o mesmo objetivo?
* as permissões batem?
* os filtros retornam o mesmo resultado?
* os cálculos conferem?
* o layout segue o design system?
* há testes?
* houve alteração indevida no banco?
* o código passou no linter?

Para padronização de código, Laravel Pint é uma escolha natural no ecossistema Laravel, pois é o formatador opinativo oficial baseado no PHP-CS-Fixer e segue o estilo Laravel por padrão. ([Laravel][3])

## O processo que eu recomendo

Eu dividiria em **macroetapas**, mas cada macroetapa teria microfases pequenas.

---

# Fase 0 — Preparação do projeto

Antes de migrar qualquer tela:

## Decisões iniciais

Definir:

* versão do Laravel;
* banco usado;
* se será Blade, Livewire, Vue/Inertia ou outra abordagem;
* padrão de autenticação;
* padrão de permissões;
* estrutura de módulos;
* padrão visual;
* biblioteca de componentes;
* estratégia de testes;
* estratégia de lint;
* política de banco legado;
* estratégia de logs;
* estratégia de auditoria;
* ambiente de homologação.

Pelo seu caso, eu tenderia a usar:

**Laravel + Inertia + Vue**, se vocês querem uma interface moderna e mais rica.

Ou:

**Laravel + Livewire**, se querem velocidade com menos complexidade JavaScript.

A documentação atual do Laravel apresenta starter kits tanto com Vue via Inertia quanto com Livewire, então as duas opções são compatíveis com o ecossistema moderno. ([Laravel][4])

Minha preferência para ERP moderno:
**Laravel + Inertia + Vue + componentes bem padronizados.**

Mas se sua equipe for mais forte em PHP do que em front-end, **Livewire pode ser mais seguro**.

---

# Fase 1 — Mapa geral do legado

Antes de escolher a primeira tela, o agente deve mapear o sistema:

* lista de módulos;
* lista de telas;
* arquivos principais;
* tabelas usadas;
* permissões;
* relatórios;
* rotinas críticas;
* integrações;
* dependências;
* telas mais usadas;
* telas mais arriscadas;
* telas simples para piloto.

Resultado dessa fase:

> “Mapa Mestre do ERP Legado”.

Esse documento vira o índice da migração.

---

# Fase 2 — Escolher uma tela piloto

Não começaria pelo módulo mais difícil.

Eu escolheria uma tela que tenha:

* listagem;
* filtros;
* cadastro;
* edição;
* exclusão ou inativação;
* permissões;
* uso de uma ou duas tabelas;
* complexidade média.

Por quê?

Porque essa primeira tela vai validar o método inteiro.

Ela vai testar:

* design;
* arquitetura;
* conexão com banco legado;
* padrão de Model;
* padrão de Service;
* padrão de Request;
* padrão de teste;
* padrão de componente;
* padrão de documentação;
* fluxo do agente.

---

# Fase 3 — Dossiê da tela antes de codar

Para cada tela, o agente deve produzir um documento assim:

## Dossiê funcional da tela

* Nome da tela no legado;
* URL ou caminho;
* Arquivos envolvidos;
* Objetivo da tela;
* Usuários que acessam;
* Permissões necessárias;
* Tabelas consultadas;
* Tabelas alteradas;
* Campos exibidos;
* Campos editáveis;
* Filtros;
* Ordenações;
* Botões;
* Modais;
* Validações;
* Regras de cálculo;
* Regras condicionais;
* Hardcodes encontrados;
* Mensagens;
* Casos de erro;
* Comportamentos especiais;
* Prints da tela atual;
* Sugestão da tela nova;
* Riscos;
* Dúvidas.

Essa fase é **obrigatória**.

Nenhum código Laravel deve ser escrito antes dela.

---

# Fase 4 — Protótipo visual antes do código

Aqui entra um ponto que você falou e eu concordo 100%:

> “Preciso ver as telas antes de começar a codar.”

Perfeito.

Antes de codar, a IA deve gerar:

* proposta visual da tela;
* estrutura dos componentes;
* estados da interface;
* responsividade;
* botões;
* tabela;
* filtros;
* modal;
* formulário;
* mensagens;
* empty state;
* loading state.

A tela nova deve respeitar o legado funcionalmente, mas não precisa copiar o visual antigo.

A regra seria:

> Mesma função, mesma regra, melhor experiência.

---

# Fase 5 — Plano técnico da tela

Depois que o dossiê e o layout forem aprovados, o agente monta o plano técnico:

* rotas Laravel;
* controller;
* Form Requests;
* Models;
* Services;
* Actions;
* Policies;
* Resources;
* componentes Vue/Blade/Livewire;
* testes;
* queries;
* tratamento de erros;
* logs;
* riscos.

Esse plano deve ser pequeno, específico e revisável.

---

# Fase 6 — Testes antes/depois

Aqui está a parte que vai impedir regressão.

Para cada regra importante do legado, criar pelo menos um teste.

Exemplos:

* usuário sem permissão não acessa;
* filtro por data retorna corretamente;
* cálculo de total bate com o legado;
* status X bloqueia edição;
* campo obrigatório é validado;
* exclusão na verdade inativa, se essa for a regra;
* relatório soma corretamente;
* cliente inadimplente gera bloqueio, se existir essa regra.

Não precisa testar tudo no primeiro dia, mas as regras críticas precisam de teste.

---

# Fase 7 — Implementação mínima da tela

A codificação deve ser pequena.

Nada de:

> “Agora implemente o módulo inteiro.”

Melhor:

> “Implemente somente a listagem da tela X, com filtros A, B e C, usando as tabelas legadas já mapeadas, sem alterar banco.”

Depois:

> “Agora implemente criação.”

Depois:

> “Agora edição.”

Depois:

> “Agora permissões.”

Depois:

> “Agora testes.”

Depois:

> “Agora revisão.”

Esse é o ponto central: **microfases reais**.

---

# Fase 8 — Revisão de paridade

Depois de implementar, comparar:

| Item       | Legado       | Laravel novo | Status |
| ---------- | ------------ | ------------ | ------ |
| Campos     | Iguais?      | Sim/Não      |        |
| Filtros    | Iguais?      | Sim/Não      |        |
| Permissões | Iguais?      | Sim/Não      |        |
| Cálculos   | Iguais?      | Sim/Não      |        |
| Banco      | Alterado?    | Não          |        |
| Layout     | Modernizado? | Sim          |        |
| Testes     | Criados?     | Sim/Não      |        |

Essa tabela precisa existir em cada tela.

---

# Fase 9 — Homologação operacional

Antes de considerar uma tela migrada:

* usuário real testa;
* dados reais ou cópia segura são usados;
* resultado é comparado com legado;
* bugs são registrados;
* ajustes são feitos;
* tela é marcada como “migrada com paridade”.

---

# Fase 10 — Próxima tela

Só depois disso o agente passa para a próxima tela.

Esse ciclo se repete.

## Minha recomendação de arquitetura

Eu não faria um Laravel “bagunçado” com regra dentro de controller.

Eu usaria algo nessa linha:

```txt
app/
  Domains/
    Clientes/
      Actions/
      Data/
      Models/
      Services/
      Policies/
      Queries/
      Rules/
      Tests/
    Produtos/
    Estoque/
    Financeiro/

resources/
  js/
    Components/
      Ui/
      Forms/
      Tables/
      Modals/
      Layout/
    Pages/
      Clientes/
      Produtos/
      Estoque/

docs/
  migration/
    00-visao-geral-legado.md
    01-mapa-modulos.md
    02-politica-banco-legado.md
    03-padrao-arquitetural.md
    04-padrao-design-system.md
    telas/
      clientes-listagem.md
      produtos-cadastro.md
```

A ideia é ter separação clara entre:

* regra de negócio;
* acesso ao banco;
* interface;
* validação;
* autorização;
* teste;
* documentação.

## Sobre preservar as tabelas legadas

Isso precisa virar uma regra escrita, não apenas uma intenção.

Eu criaria uma política assim:

```txt
POLÍTICA DE BANCO LEGADO

1. É proibido alterar, remover ou renomear tabelas existentes.
2. É proibido alterar colunas existentes sem autorização explícita.
3. É proibido alterar tipos, índices ou constraints existentes sem autorização explícita.
4. É proibido apagar dados reais.
5. Models Laravel devem se adaptar ao banco legado, e não o contrário.
6. Qualquer tabela auxiliar nova precisa ser proposta, justificada e aprovada.
7. Toda query crítica deve ser documentada.
8. Toda escrita no banco deve ser rastreável.
```

Isso é essencial porque Laravel tem convenções próprias, mas o legado provavelmente não segue essas convenções. Então os Models precisarão declarar coisas como nome da tabela, chave primária, timestamps desativados, casts e relacionamentos cuidadosamente.

## Sobre “fazer tudo de uma vez”

Eu entendo o que você quer dizer: já que o sistema existe, parece possível refazer tudo com a IA.

Mas eu separaria em duas coisas:

### Estratégia global

Sim, podemos planejar tudo de uma vez.

### Execução

Não, eu não executaria tudo de uma vez.

O certo seria:

> Planejamento global, execução microscópica.

A IA pode até ter uma visão completa do ERP, mas ela deve trabalhar com janelas pequenas para não perder contexto.

## O modelo de microfase ideal

Para cada tela/módulo, eu usaria sempre este ciclo:

```txt
1. Investigar legado
2. Documentar regras
3. Mapear banco
4. Mapear permissões
5. Propor nova UI
6. Aprovar UI
7. Planejar arquitetura Laravel
8. Criar testes esperados
9. Implementar parte pequena
10. Rodar lint/testes
11. Revisar paridade
12. Homologar
13. Registrar decisão
14. Avançar
```

Esse ciclo é o coração da migração.

## Onde o agente entra

O agente deve ter um comando simples, por exemplo:

```txt
/rhc-migrar
```

Ao receber isso, ele não deve começar a programar.

Ele deve iniciar um protocolo:

```txt
RHC Migration Agent ativado.

Antes de qualquer código, vou iniciar a fase de investigação.

Informe:
1. Nome ou URL da tela legado
2. Objetivo da tela
3. Arquivos relacionados, se souber
4. Tabelas envolvidas, se souber
5. Se essa tela pode escrever no banco
6. Nível de criticidade
7. Se deseja apenas análise, protótipo ou implementação
```

Depois ele segue a metodologia.

## O que eu criaria primeiro

Antes de migrar qualquer coisa, eu criaria estes arquivos:

```txt
/docs/RHC_MIGRATION_MASTER_PLAN.md
/docs/LEGACY_DATABASE_POLICY.md
/docs/MIGRATION_MICROPHASE_PROTOCOL.md
/docs/LARAVEL_ARCHITECTURE_STANDARD.md
/docs/DESIGN_SYSTEM_STANDARD.md
/docs/TESTING_STANDARD.md
/docs/SECURITY_STANDARD.md
/docs/AGENT_ACTIVATION_PROMPT.md
/docs/MIGRATION_HISTORY.md
/docs/DECISIONS.md
```

Esses arquivos seriam a “memória operacional” do projeto.

## Minha sugestão prática para começarmos

Eu acho que devemos construir isso em camadas.

Primeiro, eu montaria com você o **protocolo mestre da migração**.

Depois, o **prompt fixo do agente**.

Depois, os **arquivos de governança**.

Depois, o **modelo de dossiê por tela**.

Depois, o **modelo de checklist de paridade**.

Depois, o **modelo de microfase de implementação**.

A sequência que eu recomendo é:

```txt
1. Definir a filosofia da migração
2. Definir o protocolo do agente
3. Definir as regras invioláveis
4. Definir o padrão Laravel
5. Definir o padrão de design
6. Definir o padrão de testes
7. Criar o comando /rhc-migrar
8. Testar em uma tela piloto
9. Ajustar o método
10. Escalar para o ERP inteiro
```

## Minha conclusão

Você está no caminho certo, mas eu ajustaria a frase:

Em vez de:

> “Vamos refazer o ERP do zero.”

Eu usaria:

> “Vamos reconstruir o ERP em Laravel, com arquitetura moderna, usando o legado como fonte de verdade funcional, preservando banco e regras de negócio, migrando por microfases auditáveis.”

Essa diferença é gigante.

Porque “refazer do zero” abre margem para a IA inventar.

“Reconstruir com o legado como fonte de verdade” obriga a IA a preservar o que importa.

Minha recomendação: **sim, use um agente**, mas um agente com protocolo rígido, memória em arquivos, checklist de paridade, aprovação por fase e proibição explícita de alterar o banco legado sem autorização.

[1]: https://laravel.com/docs/13.x/installation?utm_source=chatgpt.com "Installation | Laravel 13.x - The clean stack for Artisans and ..."
[2]: https://laravel.com/docs/5.3/upgrade?utm_source=chatgpt.com "Upgrade Guide | Laravel 5.3 - The clean stack for Artisans ..."
[3]: https://laravel.com/docs/13.x/pint?utm_source=chatgpt.com "Laravel Pint | Laravel 13.x - The clean stack for Artisans ..."
[4]: https://laravel.com/docs/13.x/starter-kits?utm_source=chatgpt.com "Starter Kits | Laravel 13.x - The clean stack for Artisans and ..."

---

5. Guardião de Design: temos que por na memoria do agente que sempre que criar algo inédito, deve ser documentado para usar como parametro depois tambem
Fase 0 — Preparação do projeto
mais moderna lts, o banco do legado, vue/inertia, checkar,checkar,estudar padrao da industria, temos que analisar mas queremos algo conservador e moderno para um hospital com design levemente boleado e icones de traçado sem preenchimento mas vamos discutir mais sobre isso, checkar,checkar,checkar,checkar,checkar,checkar.

sobre a pagina visual, ela será feita na etapa zero para aprovação, ou depois???

RHC Migration Agent ativado.

Antes de qualquer código, vou iniciar a fase de investigação.

Informe:
1. Nome ou URL da tela legado: posso passar sim o url
2. Objetivo da tela: melhor investigar, porque eu nao saberei informar
3. Arquivos relacionados, se souber melhor investigar, porque eu nao saberei informar
4. Tabelas envolvidas, se souber melhor investigar, porque eu nao saberei informar
5. Se essa tela pode escrever no banco só escrever no banco quando for absolutante necessário
6. Nível de criticidade melhor investigar, porque eu nao saberei informar
7. Se deseja apenas análise, protótipo ou implementação, quero os 3, mas faça os dois primeiro e pare na implementação para receber autorização


o agente irá para o github para ajudar outros devs nas migrações, então ele tem que atender diferentes cenários e tecnologias, então a gente precisa ser bem cuidadoso, no final de tudo quando estiver tudo definido, vou passar para o claude opus realizar o desenvolvimento do agente, ahh, todas as nossas conversas eu estarei documentando para ajudar o opus na hora da criação, o que tu achas?

---

Acho excelente você documentar tudo para depois passar ao Claude Opus. Na verdade, esse é o melhor caminho: **não pedir para o Opus “pensar do zero”**, mas entregar para ele um **caderno de arquitetura do agente**, com decisões, regras, protocolos, exemplos e limites.

Assim ele entra como executor/desenvolvedor do agente, não como alguém tentando descobrir a estratégia.

## Sobre a página visual: deve nascer na Fase 0

Minha resposta direta:

**Sim, a página visual/design system deve ser criada na etapa zero, antes da migração das telas.**

Mas com uma observação importante: ela não nasce 100% completa. Ela nasce como **versão base aprovada** e vai evoluindo conforme surgirem novos elementos.

Então eu dividiria assim:

```txt
Fase 0.1 — Criar identidade visual base
Fase 0.2 — Criar página visual inicial
Fase 0.3 — Aprovar componentes essenciais
Fase 0.4 — Usar essa página como parâmetro obrigatório nas migrações
Fase 0.5 — Sempre que surgir algo novo, documentar antes/depois de usar
```

Ou seja:

> A página visual começa na Fase 0, mas vira um documento vivo durante toda a migração.

Isso resolve exatamente o ponto que você levantou sobre o Guardião de Design.

## Memória nova para o Guardião de Design

Eu colocaria essa regra na memória do agente:

```txt
REGRA PERMANENTE — GUARDIÃO DE DESIGN

Sempre que o agente criar, adaptar ou introduzir qualquer elemento visual inédito no sistema — componente, variação, token, layout, padrão de espaçamento, estado visual, comportamento de interação, ícone, tabela, modal, formulário, badge, alerta, card, menu, navegação ou qualquer padrão de UI — ele deve documentar esse elemento na Página Visual / Design System antes de consolidá-lo como padrão reutilizável.

Nenhum elemento visual inédito deve ficar isolado em uma tela específica sem documentação.

Todo novo elemento deve receber:
1. ID único;
2. nome;
3. descrição;
4. finalidade;
5. variações;
6. estados;
7. tokens utilizados;
8. regras de uso;
9. exemplo visual;
10. componente/caminho no código;
11. data de criação;
12. tela/módulo onde surgiu primeiro;
13. status: experimental, aprovado, depreciado ou substituído.

A Página Visual é a fonte de verdade visual do projeto.
```

Essa regra é importantíssima porque impede o ERP novo de virar uma colcha de retalhos.

## Sobre a Fase 0 do seu caso específico

Você citou:

> “mais moderna LTS”

Aqui tem um ponto técnico importante: o Laravel atual não usa mais exatamente o modelo antigo de versões LTS como antigamente. A política atual da documentação oficial informa que os releases recebem **18 meses de correções de bugs** e **2 anos de correções de segurança**. ([Laravel][1])

Então, para o agente, eu não escreveria simplesmente:

> usar Laravel LTS mais moderno

Eu escreveria algo mais preciso:

```txt
Usar a versão estável mais recente do Laravel que esteja dentro da janela oficial de suporte, avaliando compatibilidade com PHP, banco legado, dependências do projeto e maturidade para ambiente crítico.
```

Como é um sistema hospitalar, eu concordo com você: precisamos de algo **moderno, mas conservador**.

Não é “usar a coisa mais nova porque é nova”.

É:

> usar uma stack moderna, suportada, madura e segura para ambiente crítico.

## Stack inicial recomendada para o seu ERP hospitalar

Como base de discussão, eu colocaria assim:

```txt
Backend:
- Laravel em versão estável suportada
- PHP compatível com a versão escolhida
- Eloquent adaptado ao banco legado
- Form Requests
- Policies/Gates
- Services/Actions
- Jobs/Queues quando necessário
- Logs e auditoria

Frontend:
- Vue
- Inertia
- Componentização rígida
- Design system interno
- Ícones lineares sem preenchimento
- Layout conservador, limpo e hospitalar

Banco:
- Banco legado preservado
- Sem migrations destrutivas
- Models adaptados às tabelas existentes
- Tabelas auxiliares somente com aprovação

Qualidade:
- TDD quando aplicável
- Testes de regressão por tela
- Testes de autorização
- Testes de validação
- Linter e formatter
- Revisão de paridade legado x novo

Segurança:
- Controle de acesso por perfil/permissão
- Proteção contra alteração indevida de dados
- Logs de ações sensíveis
- Validação server-side obrigatória
- Sanitização de inputs
- Auditoria de operações críticas
```

Laravel Pint pode entrar como padrão natural de formatação/lint no ecossistema Laravel, já que é o formatador opinativo oficial baseado no PHP-CS-Fixer. ([Laravel][1])

## Sobre o estilo visual hospitalar

A direção que você descreveu é boa:

> conservador, moderno, levemente boleado, ícones de traçado sem preenchimento.

Eu transformaria isso em princípio de design:

```txt
DIREÇÃO VISUAL BASE — ERP HOSPITALAR

O sistema deve transmitir confiança, clareza, higiene visual, organização e segurança operacional.

Estilo:
- moderno, porém conservador;
- layout limpo;
- cantos levemente arredondados;
- baixa poluição visual;
- hierarquia clara;
- áreas bem espaçadas;
- componentes reutilizáveis;
- ícones lineares, sem preenchimento;
- cores calmas;
- contraste acessível;
- estados visuais claros;
- aparência profissional para ambiente hospitalar.

Evitar:
- visual muito colorido;
- excesso de sombras;
- excesso de animações;
- botões chamativos sem necessidade;
- layout “startup demais”;
- cards exageradamente arredondados;
- ícones preenchidos pesados;
- decisões visuais isoladas por tela.
```

Esse trecho pode ir direto para a documentação do agente.

## Ajuste no comando de ativação do agente

O fluxo que você mostrou está bom, mas eu ajustaria para o seu caso, porque você não sabe informar objetivo, arquivos, tabelas e criticidade. Então o agente **não deve depender dessas respostas**.

Eu mudaria para:

```txt
/rhc-migrar
```

E o agente responde:

```txt
RHC Migration Agent ativado.

Modo padrão: investigação antes de implementação.

Antes de qualquer código, vou investigar a tela legado e produzir:
1. Dossiê funcional;
2. Mapeamento técnico;
3. Mapeamento de banco;
4. Mapeamento de permissões;
5. Riscos e dúvidas;
6. Proposta de layout modernizado;
7. Plano de implementação.

A implementação ficará bloqueada até autorização explícita.

Informe apenas o que você souber:
1. URL da tela legado;
2. Credenciais temporárias, se necessário;
3. Módulo aproximado, se souber;
4. Observações importantes, se houver.

Se você não souber objetivo, arquivos, tabelas, permissões ou criticidade, eu devo investigar e documentar.
```

Isso é melhor porque reduz o esforço do usuário.

O agente precisa partir do princípio:

> O usuário pode conhecer a operação, mas não necessariamente o código.

## Regra sobre escrever no banco

Sua frase é importante:

> “só escrever no banco quando for absolutamente necessário”

Eu deixaria mais forte:

```txt
REGRA DE ESCRITA NO BANCO

Durante investigação, prototipação, análise e criação de layout, é proibido escrever no banco legado.

Durante implementação, qualquer operação de escrita só pode existir se a tela legado já possuir comportamento equivalente ou se houver autorização explícita.

Por padrão:
- leitura é permitida com segurança;
- escrita é bloqueada;
- alteração estrutural é proibida;
- exclusão física é proibida, salvo prova de que o legado já fazia isso e autorização explícita.

Sempre que uma ação puder alterar dados, o agente deve documentar:
1. tabela afetada;
2. campos afetados;
3. condição para escrita;
4. regra de negócio;
5. permissão necessária;
6. risco;
7. teste obrigatório.
```

Isso é fundamental para um ERP hospitalar.

## Regra dos 3 passos: análise, protótipo e implementação

Você disse:

> “quero os 3, mas faça os dois primeiro e pare na implementação para receber autorização”

Perfeito. Isso vira protocolo:

```txt
PROTOCOLO DE EXECUÇÃO POR TELA

Para cada tela migrada, o agente deve seguir obrigatoriamente:

Etapa 1 — Análise
- investigar legado;
- mapear regra de negócio;
- mapear banco;
- mapear permissões;
- mapear riscos;
- documentar dossiê.

Etapa 2 — Protótipo
- propor nova tela;
- indicar componentes;
- atualizar ou consultar página visual;
- documentar novos padrões;
- aguardar validação visual.

Etapa 3 — Plano de implementação
- propor arquivos;
- propor arquitetura;
- propor testes;
- propor sequência de microcommits;
- estimar riscos.

Bloqueio:
- O agente deve parar antes de implementar.
- Só pode implementar se o usuário disser explicitamente:
  “autorizo implementar”
  ou comando equivalente definido pelo projeto.
```

Isso evita a IA sair codando por empolgação.

## Como transformar isso em agente open source

Aqui entra a parte mais importante: seu agente não pode nascer preso ao Laravel/hospital.

Ele precisa ter duas camadas:

## 1. Núcleo genérico do agente

Serve para qualquer migração.

```txt
Migration Agent Core

Responsabilidades:
- investigar legado;
- extrair regras de negócio;
- mapear banco;
- mapear permissões;
- mapear UI;
- gerar dossiês;
- gerar plano de migração;
- bloquear implementação até autorização;
- manter histórico;
- manter decisões;
- comparar paridade;
- documentar riscos;
- criar checklist por tela.
```

Esse núcleo pode servir para:

* PHP procedural → Laravel;
* CodeIgniter → Laravel;
* sistema antigo → Rails;
* sistema antigo → Node;
* desktop legado → web;
* ERP antigo → stack moderna.

## 2. Perfil tecnológico do projeto

Aqui entram as escolhas específicas.

Exemplo do seu caso:

```txt
Project Profile: Hospital ERP Laravel

Target stack:
- Laravel
- Vue
- Inertia
- banco legado preservado
- design hospitalar conservador
- ícones lineares
- linter Laravel/PHP
- testes Laravel
- página visual interna
```

Para outro dev, poderia ser:

```txt
Project Profile: Legacy PHP to Symfony
```

Ou:

```txt
Project Profile: Rails Monolith Modernization
```

Ou:

```txt
Project Profile: Java Swing to Web App
```

Essa separação deixa seu projeto open source muito mais forte.

## Estrutura que eu imagino para o repositório no GitHub

Eu faria algo assim:

```txt
migration-agent/
  README.md
  LICENSE
  docs/
    philosophy.md
    migration-protocol.md
    business-rule-extraction.md
    database-safety-policy.md
    design-guardian.md
    testing-strategy.md
    security-strategy.md
    implementation-gates.md
    glossary.md

  templates/
    project-profile.template.md
    screen-dossier.template.md
    database-map.template.md
    permission-map.template.md
    design-system-page.template.md
    parity-checklist.template.md
    implementation-plan.template.md
    migration-history.template.md
    decisions.template.md

  profiles/
    laravel-vue-inertia/
      profile.md
      architecture-standard.md
      testing-standard.md
      linting-standard.md
      design-system-standard.md

    generic-web-app/
      profile.md

  commands/
    activate.md
    investigate-screen.md
    propose-ui.md
    plan-implementation.md
    authorize-implementation.md
    review-parity.md

  memory/
    decisions.md
    migration-history.md
    component-inventory.md
    route-permission-map.md
    database-observations.md

  agents/
    legacy-investigator.md
    business-rule-analyst.md
    database-guardian.md
    design-guardian.md
    security-reviewer.md
    test-engineer.md
    migration-reviewer.md
    implementation-agent.md
```

Isso já dá uma base excelente para o Opus implementar.

## A melhor decisão conceitual até aqui

A melhor coisa que você disse foi:

> “o agente irá para o GitHub para ajudar outros devs nas migrações.”

Então o nome e a estrutura não devem ficar presos ao RHC.

Eu faria assim:

Nome do projeto open source:

```txt
Legacy Migration Agent
```

E dentro dele você pode ter um profile:

```txt
profiles/rhc-hospital-erp-laravel/
```

Ou, se quiser preservar a marca do seu uso interno:

```txt
Core open source:
Legacy Migration Agent

Uso interno:
RHC Migration Agent Profile
```

Assim você cria algo útil para a comunidade e, ao mesmo tempo, mantém seu ERP com regras específicas.

## Minha visão final

Sim, documentar nossas conversas para entregar ao Claude Opus é uma ótima estratégia.

Mas o material que você deve entregar para ele não pode ser só um histórico de conversa. O ideal é consolidar em documentos objetivos:

```txt
1. Visão do agente
2. Problema que ele resolve
3. Filosofia de migração
4. Regras invioláveis
5. Fluxo de ativação
6. Microfases
7. Guardiões internos
8. Templates de documentação
9. Perfis tecnológicos
10. Exemplo aplicado ao ERP hospitalar Laravel
```

E a decisão sobre a página visual fica assim:

> A Página Visual / Design System nasce na Fase 0 como baseline obrigatório, é aprovada antes da primeira tela migrada, e passa a ser atualizada sempre que qualquer elemento visual inédito surgir.

Esse ponto deve entrar como regra permanente do Guardião de Design.

[1]: https://laravel.com/docs/master/releases?utm_source=chatgpt.com "Release Notes | Laravel master - The clean stack for ..."

---

eu consigo colocar uma lista de urls para o agente ir em uma esteira de execução até migrar tudo?

---

Sim, consegue — e eu acho que **esse deve ser o modelo ideal para escalar a migração**.

Mas com um cuidado importante:

> A lista de URLs não deve virar uma esteira cega de implementação.
> Ela deve virar uma **esteira de investigação, documentação, prototipação, planejamento e implementação autorizada por etapa**.

Ou seja, o agente pode percorrer uma lista inteira de telas, mas ele precisa ter **gates de segurança** para não sair migrando tudo sem validação.

## Como eu faria

Você cria um arquivo tipo:

```txt
/docs/migration/url-backlog.md
```

Com uma lista assim:

```md
# Backlog de URLs para Migração

## Grupo 1 — Cadastros básicos

- [ ] /pacientes
- [ ] /convenios
- [ ] /medicos
- [ ] /especialidades

## Grupo 2 — Atendimento

- [ ] /agenda
- [ ] /recepcao
- [ ] /triagem
- [ ] /prontuario

## Grupo 3 — Financeiro

- [ ] /contas-a-receber
- [ ] /contas-a-pagar
- [ ] /faturamento
- [ ] /relatorios-financeiros
```

Mas cada item precisa ter status.

## Status recomendado para cada URL

Eu usaria algo assim:

```md
| URL | Módulo | Status | Etapa atual | Criticidade | Observações |
|---|---|---|---|---|---|
| /pacientes | Cadastros | Pendente | Não iniciada | A investigar |  |
| /agenda | Atendimento | Em análise | Dossiê funcional | Alta | Depende de médicos e pacientes |
| /contas-a-receber | Financeiro | Bloqueada | Aguardando aprovação | Alta | Escrita sensível no banco |
```

## A esteira ideal

O agente pode trabalhar assim:

```txt
1. Ler lista de URLs
2. Classificar por módulo
3. Detectar dependências
4. Priorizar telas menos arriscadas primeiro
5. Investigar a primeira URL
6. Gerar dossiê funcional
7. Gerar protótipo visual
8. Gerar plano técnico
9. Parar antes de implementar
10. Aguardar autorização
11. Implementar em microfases
12. Revisar paridade
13. Marcar URL como migrada
14. Passar para a próxima
```

## Eu não deixaria ele “migrar tudo sozinho”

Para o seu caso, principalmente por ser ERP hospitalar e banco legado, eu evitaria:

```txt
Pegue essas 80 URLs e migre tudo automaticamente.
```

Isso é perigoso.

O certo seria:

```txt
Pegue essas 80 URLs, investigue todas, agrupe por módulo, classifique criticidade, gere dossiês e proponha uma ordem segura de migração.
```

Depois disso, você autoriza por bloco.

## Modelo de autorização

Eu criaria níveis de autorização:

```txt
AUTORIZAÇÃO NÍVEL 1 — Investigar URLs
Pode acessar telas, analisar comportamento, mapear regras e gerar documentação.

AUTORIZAÇÃO NÍVEL 2 — Prototipar telas
Pode propor layouts modernizados e atualizar a página visual.

AUTORIZAÇÃO NÍVEL 3 — Planejar implementação
Pode gerar plano técnico, arquivos previstos, testes e riscos.

AUTORIZAÇÃO NÍVEL 4 — Implementar uma URL específica
Pode codar somente a tela autorizada.

AUTORIZAÇÃO NÍVEL 5 — Implementar um bloco
Pode migrar um grupo de telas aprovadas, uma por uma, respeitando microfases.

AUTORIZAÇÃO NÍVEL 6 — Execução assistida em esteira
Pode avançar automaticamente apenas entre telas já analisadas, prototipadas e aprovadas.
```

Para o seu projeto, eu começaria só até o nível 3.

## Arquivo de esteira

Eu criaria este arquivo:

```txt
/docs/migration/MIGRATION_PIPELINE.md
```

Com algo assim:

```md
# Migration Pipeline

## Regras da Esteira

1. Nenhuma URL pode ser implementada sem dossiê funcional.
2. Nenhuma URL pode ser implementada sem mapeamento de banco.
3. Nenhuma URL pode ser implementada sem mapeamento de permissões.
4. Nenhuma URL pode ser implementada sem protótipo visual aprovado.
5. Nenhuma URL pode ser implementada sem plano técnico.
6. Nenhuma URL pode escrever no banco sem regra documentada.
7. Nenhuma URL pode alterar estrutura do banco legado.
8. Nenhuma URL pode avançar para “Migrada” sem checklist de paridade.
9. Todo elemento visual novo deve ser documentado na Página Visual.
10. Todo comportamento divergente do legado deve ser justificado e aprovado.
```

## Modelo mais robusto para a lista de URLs

Em vez de uma lista simples, eu usaria YAML ou Markdown estruturado.

Exemplo em YAML:

```yaml
migration_urls:
  - id: MIG-001
    legacy_url: "/pacientes"
    module: "Cadastros"
    known_purpose: null
    priority: "a_investigar"
    criticality: "a_investigar"
    write_operations: "a_investigar"
    status: "pending_investigation"
    allowed_steps:
      - investigate
      - document
      - prototype
      - plan
    implementation_authorized: false
    notes: ""

  - id: MIG-002
    legacy_url: "/agenda"
    module: "Atendimento"
    known_purpose: null
    priority: "a_investigar"
    criticality: "a_investigar"
    write_operations: "a_investigar"
    status: "pending_investigation"
    allowed_steps:
      - investigate
      - document
      - prototype
      - plan
    implementation_authorized: false
    notes: ""
```

Esse formato é melhor para agente/IDE porque ele consegue atualizar o status com mais precisão.

## Ordem ideal de migração

O agente não deve seguir necessariamente a ordem que você colocou.

Ele deve primeiro analisar e propor uma ordem segura.

Critérios:

```txt
1. Baixa escrita no banco primeiro
2. Telas de consulta antes de telas transacionais
3. Cadastros-base antes de processos complexos
4. Módulos com menor dependência primeiro
5. Telas com alto uso operacional, mas baixa complexidade, para validar rápido
6. Relatórios depois que as fontes de dados estiverem mapeadas
7. Telas críticas hospitalares só depois do método estar validado
```

Exemplo:

Melhor começar com:

```txt
Especialidades
Convênios
Médicos
Pacientes
```

Antes de:

```txt
Prontuário
Faturamento
Internação
Prescrição
```

## O agente pode ter dois modos de esteira

### 1. Modo varredura

Ele pega todas as URLs e faz apenas análise.

```txt
/rhc-varrer-urls
```

Resultado:

```txt
- mapa de telas;
- módulos;
- criticidade;
- dependências;
- tabelas;
- permissões;
- riscos;
- ordem recomendada.
```

### 2. Modo migração assistida

Ele pega uma URL por vez e executa o protocolo completo até parar antes da implementação.

```txt
/rhc-migrar-esteira
```

Resultado por tela:

```txt
- dossiê;
- protótipo;
- plano;
- checklist;
- aguardando autorização.
```

## Comando que eu criaria

Eu criaria algo assim:

```txt
/rhc-carregar-urls
```

O agente responderia:

```txt
Cole abaixo a lista de URLs do legado.

Vou:
1. normalizar a lista;
2. atribuir IDs únicos;
3. agrupar por módulo provável;
4. identificar dependências aparentes;
5. criar o backlog de migração;
6. iniciar somente a investigação, sem implementar nada.
```

Depois:

```txt
/rhc-varrer-backlog
```

E depois:

```txt
/rhc-migrar-proxima
```

Esse último seria muito útil.

Ele sempre pega a próxima URL segura da fila.

## O que eu recomendo para você

Sim, coloque a lista de URLs.

Mas use assim:

```txt
Primeiro objetivo:
mapear o ERP inteiro.

Segundo objetivo:
classificar risco e dependência.

Terceiro objetivo:
migrar por blocos pequenos.
```

A esteira ideal não é:

> “migre tudo”.

É:

> “conduza a migração inteira com rastreabilidade, gates e autorização.”

## Regra que deve ir para o agente

Eu adicionaria esta memória:

```txt
REGRA PERMANENTE — EXECUÇÃO POR LISTA DE URLS

Quando o usuário fornecer uma lista de URLs do sistema legado, o agente deve tratá-la como backlog de migração, não como autorização automática para implementação.

O agente deve:
1. gerar IDs únicos para cada URL;
2. agrupar por módulo provável;
3. investigar cada tela;
4. mapear objetivo, regras, banco, permissões e riscos;
5. classificar criticidade;
6. identificar dependências entre telas;
7. propor ordem segura de migração;
8. executar análise, protótipo e plano técnico;
9. bloquear implementação até autorização explícita;
10. atualizar status da URL no backlog;
11. registrar decisões e histórico.

A presença de uma URL na lista não significa autorização para codar.
```

Essa última frase é essencial:

> **A presença de uma URL na lista não significa autorização para codar.**

Esse modelo deixa sua migração muito mais segura e escalável.

---

nós temos muitas integrações com apis, email, whatsapp entre outras integrações, temos que assistir todas elas tambem né?


---

Sim — **obrigatoriamente**.

Em uma migração de ERP, as integrações precisam ser tratadas como parte crítica do sistema, não como detalhe técnico. Muitas vezes a regra de negócio real está escondida justamente nelas: envio de e-mail, disparo de WhatsApp, consulta em API externa, webhook, geração de boleto, nota fiscal, assinatura digital, gateway de pagamento, agenda, laboratório, convênio, etc.

Eu colocaria uma frente específica no agente:

```txt
Guardião de Integrações
```

## O que esse Guardião precisa mapear

Para cada integração, ele deve descobrir e documentar:

```txt
1. Nome da integração
2. Finalidade
3. Serviço externo usado
4. Endpoint/API
5. Método de autenticação
6. Onde as credenciais ficam
7. Arquivos do legado envolvidos
8. Telas que disparam a integração
9. Eventos que acionam a integração
10. Dados enviados
11. Dados recebidos
12. Webhooks recebidos
13. Logs existentes
14. Retentativas
15. Tratamento de erro
16. Timeouts
17. Impacto no usuário
18. Impacto no banco
19. Risco operacional
20. Plano de migração
21. Testes necessários
```

## Regra importante

A integração não deve ser migrada só copiando código.

Ela precisa ser classificada:

```txt
Manter como está
Recriar em Laravel
Isolar em Service
Substituir por provider melhor
Descontinuar
Revisar com aprovação
```

## Exemplo

Se o legado envia WhatsApp quando uma consulta é marcada, o agente precisa mapear:

```txt
Tela: Agendamento
Evento: confirmação de consulta
Integração: WhatsApp
Quando dispara: após salvar agendamento
Mensagem enviada: texto X
Variáveis: nome do paciente, data, horário, médico
Provider: API Y
Credenciais: local Z
Falhas: não bloqueia o agendamento ou bloqueia?
Retentativa: existe ou não?
Log: existe ou não?
```

Essa última pergunta é essencial:

> Se o WhatsApp falhar, o agendamento ainda deve ser salvo?

Esse tipo de decisão muda totalmente a arquitetura.

## No Laravel, eu recomendaria

Integrações devem ir para camadas específicas:

```txt
app/
  Integrations/
    WhatsApp/
      WhatsAppClient.php
      WhatsAppMessageService.php
      DTOs/
      Exceptions/
    Email/
      MailService.php
    ExternalApi/
      ExternalApiClient.php

  Jobs/
    SendWhatsAppMessageJob.php
    SendEmailJob.php

  Domains/
    Appointments/
      Actions/
        CreateAppointmentAction.php
```

E sempre que possível:

```txt
A regra de negócio salva o dado.
A integração externa roda em fila.
A falha da integração é registrada.
O usuário é avisado quando necessário.
```

Isso deixa o ERP mais resiliente.

## Para hospital, isso é ainda mais crítico

Em ambiente hospitalar, integração pode envolver:

```txt
- confirmação de consulta;
- lembrete de paciente;
- envio de resultado;
- faturamento;
- convênios;
- laboratório;
- nota fiscal;
- prontuário;
- anexos;
- comunicação interna;
- permissões;
- auditoria;
- LGPD;
- logs de acesso.
```

Então o agente precisa ter uma regra forte:

```txt
Nenhuma integração pode ser removida, alterada ou substituída sem documentação e autorização explícita.
```

## Adição à memória do agente

Eu colocaria assim:

```txt
REGRA PERMANENTE — GUARDIÃO DE INTEGRAÇÕES

O agente deve mapear, documentar e proteger todas as integrações externas ou internas do sistema legado, incluindo APIs, e-mail, WhatsApp, webhooks, gateways, serviços de arquivos, emissão fiscal, relatórios, mensageria, automações e qualquer comunicação com sistemas terceiros.

Toda integração deve ser tratada como possível regra de negócio crítica.

Antes de migrar qualquer tela, o agente deve verificar se aquela tela:
1. chama alguma API;
2. envia e-mail;
3. envia WhatsApp/SMS;
4. consome webhook;
5. gera arquivo;
6. importa dados;
7. exporta dados;
8. agenda tarefas;
9. executa rotina automática;
10. dispara side effects externos.

Nenhuma integração pode ser migrada, removida, simulada, substituída ou desativada sem documentação e autorização explícita.

Para cada integração, o agente deve documentar:
1. origem do disparo;
2. destino;
3. credenciais necessárias;
4. payload enviado;
5. resposta esperada;
6. tratamento de erro;
7. retentativas;
8. logs;
9. impacto no banco;
10. impacto no usuário;
11. risco operacional;
12. plano de teste;
13. plano de fallback.
```

## E eu adicionaria um inventário próprio

Arquivo:

```txt
/docs/migration/INTEGRATION_INVENTORY.md
```

Ou em formato estruturado:

```yaml
integrations:
  - id: INT-001
    name: "WhatsApp - confirmação de consulta"
    provider: "a_investigar"
    trigger: "Após salvar agendamento"
    source_screen: "/agenda"
    source_files: []
    payload: "a_investigar"
    credentials_location: "a_investigar"
    has_retry: "a_investigar"
    has_logs: "a_investigar"
    failure_behavior: "a_investigar"
    criticality: "alta"
    migration_strategy: "a_definir"
    implementation_authorized: false
```

## Conclusão

Sim, temos que assistir todas as integrações.

Mais do que isso: precisamos criar uma camada inteira do agente para isso.

Eu atualizaria o desenho do agente para incluir:

```txt
1. Investigador do Legado
2. Analista de Regras de Negócio
3. Guardião do Banco
4. Guardião de Design
5. Guardião de Segurança
6. Guardião de Testes
7. Guardião de Integrações
8. Revisor de Paridade
```

E uma regra central:

> Nenhuma tela está completamente analisada até que suas integrações e efeitos colaterais externos tenham sido mapeados.

---

temos que ter feedbacks para orientar os usuarios, temos que ter 
- quero adicionar ao projeto acessibilidade 100% 
- dark / light mode, surdo, tamanho de fonte, cego, alto contraste, tudo que o bom senso exige

- LGPD nas mais altas boas práticas, anonimização de dados, exportação do dados e etc, tudo que a lei exigir

quero que TODAS as variavei, classes, funcoes, constantes e etc, tenha nomes semanticos, nao importa o tamanho que ficarem

existe algo que ainda nao abordamos? quero chegar ao apice e nada faltar na hora de migrar.

---

Sim. E ainda bem que você levantou isso agora, porque essas coisas precisam entrar **no DNA do agente**, não como “tarefas finais”.

A partir de agora, eu colocaria mais alguns guardiões permanentes:

```txt
1. Guardião de Acessibilidade
2. Guardião de LGPD e Privacidade
3. Guardião de Feedbacks e Experiência Operacional
4. Guardião de Nomenclatura Semântica
5. Guardião de Observabilidade
6. Guardião de Auditoria
7. Guardião de Documentação Viva
```

## 1. Feedbacks para orientar usuários

Isso é obrigatório, principalmente em ERP hospitalar. O usuário não pode ficar em dúvida se uma ação salvou, falhou, está carregando, está bloqueada ou precisa de atenção.

Eu adicionaria esta regra:

```txt
REGRA PERMANENTE — FEEDBACK OPERACIONAL

Toda ação relevante do usuário deve gerar feedback claro, acessível e contextual.

O sistema deve possuir feedbacks para:
1. carregamento;
2. salvamento;
3. erro;
4. validação;
5. sucesso;
6. alerta;
7. ação bloqueada;
8. permissão insuficiente;
9. dados ausentes;
10. confirmação antes de ações críticas;
11. falha de integração;
12. operação em processamento;
13. operação parcialmente concluída;
14. tentativa de sair com alterações não salvas;
15. indisponibilidade de serviço externo.

Nenhuma ação crítica pode acontecer silenciosamente.
```

Exemplo prático:

```txt
Ruim:
Erro ao salvar.

Bom:
Não foi possível salvar o agendamento porque o convênio do paciente está inativo. Verifique o cadastro do convênio ou selecione outra forma de atendimento.
```

O agente deve ser obrigado a pensar em:

```txt
O usuário precisa saber o que aconteceu?
O usuário precisa saber o que fazer agora?
O erro é técnico ou operacional?
Essa mensagem expõe dado sensível?
Essa mensagem é acessível para leitor de tela?
```

## 2. Acessibilidade 100%

Aqui eu tomaria cuidado com o termo “100%”, porque acessibilidade total absoluta é difícil de provar. Mas podemos definir um alvo forte:

> Conformidade mínima WCAG 2.2 AA, buscando AAA quando viável e útil.

As WCAG 2.2 são organizadas em quatro princípios: perceptível, operável, compreensível e robusto; os critérios de sucesso têm níveis A, AA e AAA. ([W3C][1]) O W3C recomenda usar a versão mais atual das WCAG ao desenvolver ou atualizar políticas de acessibilidade web. ([W3C Capítulo São Paulo][2])

Eu escreveria assim:

```txt
REGRA PERMANENTE — ACESSIBILIDADE

O sistema deve buscar acessibilidade máxima, adotando WCAG 2.2 nível AA como baseline obrigatório e nível AAA quando tecnicamente viável e adequado ao contexto.

Toda tela, componente e fluxo devem considerar:
1. navegação por teclado;
2. foco visível;
3. leitores de tela;
4. contraste adequado;
5. alto contraste;
6. modo claro e escuro;
7. ajuste de tamanho de fonte;
8. redução de movimento;
9. textos alternativos;
10. rótulos semânticos;
11. mensagens de erro acessíveis;
12. aria-labels quando necessário;
13. landmarks;
14. hierarquia correta de headings;
15. formulários com labels reais;
16. estados de componente comunicáveis;
17. não depender apenas de cor;
18. áreas clicáveis adequadas;
19. suporte a zoom;
20. linguagem clara;
21. acessibilidade para usuários surdos;
22. acessibilidade para usuários cegos ou com baixa visão;
23. acessibilidade para pessoas com deficiência motora;
24. acessibilidade cognitiva sempre que possível.
```

Sobre “surdo”: o principal impacto em ERP geralmente é não depender de áudio. Se houver vídeo, alerta sonoro, treinamento ou mídia, precisa de legenda, transcrição e alternativa visual.

Sobre “cego”: foco em leitor de tela, semântica HTML, navegação por teclado, ordem lógica, labels, mensagens de erro e não usar layout visual como única fonte de informação.

Sobre “alto contraste”: isso precisa virar preferência do usuário.

## 3. Dark mode, light mode, fonte e alto contraste

Eu não trataria isso só como “tema”. Eu trataria como **preferências de acessibilidade e conforto visual**.

```txt
REGRA PERMANENTE — PREFERÊNCIAS DE INTERFACE

O sistema deve permitir preferências persistentes por usuário, incluindo:
1. modo claro;
2. modo escuro;
3. modo automático conforme sistema operacional;
4. alto contraste;
5. tamanho de fonte;
6. densidade da interface;
7. redução de animações;
8. preferência por ícones com texto;
9. possível modo leitura simplificada para telas críticas.

Essas preferências devem ser aplicadas por tokens de design, não por ajustes isolados em telas.
```

Isso é importante: nada de sair colocando `text-lg` aleatório em cada tela. O ideal é trabalhar com tokens.

Exemplo:

```txt
--font-size-base
--font-size-sm
--font-size-lg
--color-background
--color-surface
--color-text-primary
--color-text-muted
--color-border
--color-danger
--color-success
--focus-ring
```

## 4. LGPD nas mais altas boas práticas

Sim, entra como guardião próprio. E em sistema hospitalar isso é ainda mais sensível, porque pode haver dados de saúde, que são dados pessoais sensíveis pela LGPD.

A LGPD é a Lei nº 13.709/2018 e trata da proteção de dados pessoais em meios físicos e digitais, buscando proteger direitos fundamentais de liberdade, privacidade e livre desenvolvimento da personalidade. ([Planalto][3])

Eu adicionaria:

```txt
REGRA PERMANENTE — LGPD E PRIVACIDADE

O sistema deve adotar privacidade por padrão e por design.

Toda tela, tabela, relatório, exportação, log, integração e rotina deve ser analisada quanto a:
1. dados pessoais;
2. dados pessoais sensíveis;
3. base legal;
4. finalidade;
5. necessidade;
6. minimização;
7. retenção;
8. descarte;
9. anonimização;
10. pseudonimização;
11. consentimento quando aplicável;
12. legítimo interesse quando aplicável;
13. acesso do titular;
14. correção de dados;
15. exportação/portabilidade quando aplicável;
16. revogação quando aplicável;
17. eliminação quando aplicável;
18. compartilhamento com terceiros;
19. operadores e controladores;
20. logs de acesso;
21. trilha de auditoria;
22. incidentes de segurança;
23. relatório de impacto quando necessário.
```

E eu criaria um inventário:

```txt
/docs/privacy/DATA_INVENTORY.md
/docs/privacy/LGPD_COMPLIANCE_MAP.md
/docs/privacy/DATA_RETENTION_POLICY.md
/docs/privacy/DATA_EXPORT_POLICY.md
/docs/privacy/ANONYMIZATION_POLICY.md
/docs/privacy/CONSENT_AND_LEGAL_BASIS.md
/docs/privacy/THIRD_PARTY_DATA_SHARING.md
```

## 5. Anonimização, exportação e direitos do titular

Isso precisa entrar no produto e na arquitetura.

```txt
FUNCIONALIDADES LGPD A CONSIDERAR

1. Exportar dados do titular;
2. Corrigir dados;
3. Anonimizar dados quando permitido;
4. Excluir dados quando permitido;
5. Bloquear exclusão quando houver obrigação legal de retenção;
6. Registrar solicitações LGPD;
7. Registrar quem atendeu a solicitação;
8. Registrar base legal;
9. Registrar prazo;
10. Gerar histórico de tratamento;
11. Controlar compartilhamentos com terceiros;
12. Auditar acessos a dados sensíveis.
```

Ponto importante: em hospital, nem sempre pode simplesmente apagar dados. Pode haver obrigação legal, regulatória, contábil ou assistencial de retenção. Então o agente precisa evitar simplificação perigosa.

Regra:

```txt
O agente não deve presumir que dado de saúde pode ser excluído fisicamente. Deve avaliar retenção, base legal e obrigação regulatória antes de propor eliminação.
```

## 6. Nomes semânticos para tudo

Concordo 100%.

Em sistema crítico, clareza vale mais que nome curto.

Eu colocaria assim:

```txt
REGRA PERMANENTE — NOMENCLATURA SEMÂNTICA

Todas as variáveis, classes, funções, métodos, constantes, componentes, arquivos, rotas, eventos, jobs, policies, requests, services, actions, testes e identificadores devem ter nomes semânticos, explícitos e orientados ao domínio.

É proibido usar nomes genéricos, ambíguos ou abreviados sem justificativa.

Evitar:
- $data;
- $info;
- $row;
- $obj;
- $result;
- $temp;
- $x;
- $aux;
- process();
- handleData();
- saveInfo();
- doAction();
- manager;
- helper genérico.

Preferir:
- $patientAppointmentData;
- $activeHealthInsuranceAgreement;
- $pendingInvoiceCollection;
- calculateAppointmentTotalAmount();
- authorizePatientRecordAccess();
- sendAppointmentConfirmationMessage();
- CreatePatientAppointmentAction;
- PatientHealthInsuranceEligibilityService.
```

E eu iria além:

```txt
O nome deve explicar intenção, domínio e responsabilidade.
O tamanho do nome é secundário.
Clareza é prioridade.
```

## 7. Existe algo que ainda não abordamos?

Sim. Estamos muito bem, mas para chegar ao “ápice”, ainda faltam alguns blocos importantes.

## A. Auditoria profunda

Em ERP hospitalar, auditoria é vital.

```txt
Precisamos registrar:
1. quem acessou;
2. quem criou;
3. quem alterou;
4. quem excluiu/inativou;
5. antes e depois da alteração;
6. data/hora;
7. IP/dispositivo quando relevante;
8. motivo da alteração quando crítico;
9. acesso a prontuário/dados sensíveis;
10. exportação de dados;
11. falhas de login;
12. alteração de permissões;
13. ações administrativas.
```

## B. Observabilidade

Não basta logar erro. O sistema precisa ser monitorável.

```txt
Incluir:
1. logs estruturados;
2. rastreamento de exceções;
3. métricas de performance;
4. monitoramento de filas;
5. monitoramento de integrações;
6. alertas para falhas críticas;
7. health checks;
8. status de serviços externos;
9. rastreio de jobs;
10. dashboard técnico.
```

## C. Plano de rollback

Toda migração precisa ter volta.

```txt
REGRA — ROLLBACK

Nenhuma tela crítica deve entrar em produção sem plano de rollback.

Documentar:
1. como voltar para tela legado;
2. como desfazer deploy;
3. como lidar com dados criados no novo sistema;
4. como comparar inconsistências;
5. quem autoriza rollback;
6. janela segura de implantação.
```

## D. Feature flags

Eu recomendo fortemente.

```txt
Usar feature flags para:
1. ativar tela nova por usuário;
2. ativar por perfil;
3. ativar por unidade/setor;
4. testar em paralelo;
5. desligar rapidamente se houver erro;
6. fazer rollout gradual.
```

Isso é perfeito para migração de ERP.

## E. Paralelismo legado x novo

Em alguns módulos, pode ser útil rodar lado a lado:

```txt
1. legado continua oficial;
2. novo roda em homologação;
3. comparar resultados;
4. validar relatórios;
5. liberar por etapas.
```

## F. Performance e carga

Ainda precisamos incluir:

```txt
1. índices existentes;
2. queries pesadas;
3. N+1 queries;
4. paginação;
5. cache;
6. tempo de resposta por tela;
7. relatórios demorados;
8. exportações grandes;
9. filas para tarefas longas;
10. limites de timeout.
```

## G. Permissões e segregação de funções

Não basta “admin e usuário”.

```txt
Mapear:
1. perfis;
2. permissões por tela;
3. permissões por botão;
4. permissões por campo;
5. permissões por unidade;
6. permissões por setor;
7. acesso a dados sensíveis;
8. quem pode exportar;
9. quem pode imprimir;
10. quem pode alterar dados críticos.
```

## H. Segurança avançada

OWASP Top 10 continua sendo uma referência central para riscos críticos de aplicações web; a página oficial da OWASP o descreve como padrão de referência para riscos mais críticos em aplicações web. ([OWASP Foundation][4])

Adicionar:

```txt
1. autenticação forte;
2. MFA para perfis críticos;
3. proteção CSRF;
4. proteção XSS;
5. proteção SQL Injection;
6. rate limiting;
7. proteção contra enumeração;
8. sessão segura;
9. expiração por inatividade;
10. criptografia de dados sensíveis;
11. gestão de secrets;
12. headers de segurança;
13. upload seguro;
14. validação server-side;
15. logs de segurança;
16. princípio do menor privilégio.
```

## I. Gestão de documentos e arquivos

Se o ERP lida com anexos:

```txt
1. upload seguro;
2. antivírus/varredura;
3. tipos permitidos;
4. tamanho máximo;
5. armazenamento privado;
6. URLs assinadas;
7. controle de acesso;
8. versionamento;
9. retenção;
10. exclusão segura.
```

## J. Importação, exportação e relatórios

Precisamos padronizar:

```txt
1. CSV;
2. Excel;
3. PDF;
4. impressão;
5. relatórios grandes em fila;
6. filtros aplicados;
7. registro de quem exportou;
8. mascaramento de dados sensíveis;
9. marca d’água quando necessário;
10. logs de exportação.
```

## K. Qualidade de dados

Sistema legado costuma ter dados ruins.

```txt
Incluir:
1. dados duplicados;
2. campos inconsistentes;
3. CPF/CNPJ inválido;
4. datas inválidas;
5. status órfão;
6. registros sem relacionamento;
7. encoding antigo;
8. campos usados com múltiplos significados;
9. normalização sem alterar banco legado;
10. camada de compatibilidade.
```

## L. Documentação operacional

Não basta documentação técnica.

```txt
Criar:
1. manual por tela;
2. ajuda contextual;
3. tooltips;
4. glossário do sistema;
5. perguntas frequentes;
6. fluxo de treinamento;
7. changelog para usuários;
8. guia de novas telas.
```

## M. Ambientes e deploy

Precisamos definir:

```txt
1. local;
2. desenvolvimento;
3. homologação;
4. staging;
5. produção;
6. backup antes de deploy;
7. CI/CD;
8. testes automatizados no pipeline;
9. análise estática;
10. secrets por ambiente;
11. logs por ambiente;
12. rollback.
```

## N. Backups e recuperação de desastre

Essencial.

```txt
1. política de backup;
2. frequência;
3. criptografia do backup;
4. teste de restauração;
5. RPO;
6. RTO;
7. cópia fora do servidor;
8. plano de desastre;
9. responsável por restauração;
10. auditoria dos backups.
```

## O. Versionamento de decisões

Tudo que decidirmos precisa ficar registrado.

```txt
/docs/DECISIONS.md
```

Formato:

```txt
Data:
Decisão:
Motivo:
Alternativas consideradas:
Impacto:
Quem aprovou:
Status:
```

## P. Internacionalização e linguagem

Mesmo que o sistema seja PT-BR, padronizar:

```txt
1. textos da interface;
2. mensagens de erro;
3. datas;
4. moedas;
5. CPF/CNPJ;
6. telefone;
7. fuso horário;
8. pluralização;
9. tom de voz.
```

## Q. Testes de aceitação operacional

Além de teste automatizado, precisamos de teste com usuário real.

```txt
1. cenário;
2. usuário;
3. dados usados;
4. resultado esperado;
5. evidência;
6. aprovação;
7. observações.
```

## R. Migração de autenticação e sessões

Ainda precisamos abordar:

```txt
1. usuários existentes;
2. senhas;
3. hashes antigos;
4. política de troca de senha;
5. MFA;
6. sessões ativas;
7. bloqueio por tentativas;
8. recuperação de senha;
9. permissões herdadas.
```

## S. Compatibilidade com impressoras e operação real

ERP hospitalar pode depender de impressão.

```txt
1. etiquetas;
2. pulseiras;
3. guias;
4. recibos;
5. relatórios;
6. impressoras térmicas;
7. layout de impressão;
8. margens;
9. códigos de barras;
10. QR codes.
```

## T. Governança de componentes

Além da página visual:

```txt
1. inventário de componentes;
2. status do componente;
3. dono/responsável;
4. exemplos;
5. props;
6. variações;
7. acessibilidade;
8. testes;
9. telas que usam;
10. data de alteração.
```

## U. Modo manutenção

Importante para ERP:

```txt
1. aviso de manutenção;
2. bloqueio temporário de operações;
3. tela amigável;
4. exceções para administradores;
5. registro de manutenção;
6. comunicação interna.
```

## V. Tratamento de erros com privacidade

Erro não pode vazar stack trace ou dado sensível.

```txt
Usuário vê mensagem humana.
Sistema registra detalhe técnico seguro.
Dado sensível não aparece em log desnecessário.
```

## W. Governança de APIs

Além de mapear integrações:

```txt
1. contratos;
2. versionamento;
3. timeouts;
4. retries;
5. idempotência;
6. circuit breaker;
7. logs;
8. fallback;
9. ambiente sandbox;
10. testes com mocks.
```

## Minha atualização do “ápice” do agente

Agora o agente deveria ter estes guardiões:

```txt
1. Legacy Investigator
2. Business Rule Guardian
3. Database Guardian
4. Integration Guardian
5. Design Guardian
6. Accessibility Guardian
7. LGPD & Privacy Guardian
8. Security Guardian
9. Test Guardian
10. Feedback & UX Guardian
11. Semantic Naming Guardian
12. Documentation Guardian
13. Observability Guardian
14. Audit Guardian
15. Deployment & Rollback Guardian
16. Performance Guardian
17. Data Quality Guardian
```

## Regra-mãe que eu colocaria no projeto

```txt
REGRA-MÃE DO AGENTE

A migração só é considerada correta quando preserva as regras de negócio do legado, protege o banco existente, melhora a arquitetura, eleva a segurança, respeita LGPD, garante acessibilidade, padroniza o design, documenta decisões, mantém rastreabilidade, possui testes, oferece feedback claro ao usuário e permite rollback seguro.
```

## Minha resposta sincera

Sim, ainda faltavam temas. Agora estamos chegando em um nível muito mais maduro.

Os pontos mais importantes que faltavam eram:

```txt
1. auditoria;
2. observabilidade;
3. rollback;
4. feature flags;
5. acessibilidade formal;
6. LGPD formal;
7. feedbacks operacionais;
8. semântica de nomes;
9. qualidade de dados;
10. plano de desastre;
11. documentação operacional;
12. governança de arquivos;
13. segurança de APIs;
14. testes de aceitação com usuários;
15. compatibilidade de impressão.
```

Com isso, o agente deixa de ser apenas um “migrador de código” e vira um **framework de modernização segura de sistemas legados**.

[1]: https://www.w3.org/WAI/standards-guidelines/wcag/?utm_source=chatgpt.com "WCAG 2 Overview | Web Accessibility Initiative (WAI)"
[2]: https://www.w3c.br/traducoes/wcag/wcag22-pt-BR/?utm_source=chatgpt.com "Diretrizes de Acessibilidade para Conteúdo Web (WCAG) 2.2"
[3]: https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm?utm_source=chatgpt.com "L13709 - Planalto"
[4]: https://owasp.org/www-project-top-ten/?utm_source=chatgpt.com "OWASP Top Ten Web Application Security Risks"

---

- nao sei se é na parte do código mas quero abordar tudo que seja relacionado à desater recovery

- os temas que voce já citou, consolide-os para utilizarmos no agente, 
- analise se ainda falta algo para abordarmos, quero ser bem incisivo na hora da migração.

---

Sim — **Disaster Recovery não é só código**. Ele precisa ser tratado como um eixo próprio do agente, envolvendo **arquitetura, infraestrutura, banco, backups, integrações, operação, segurança, deploy, pessoas, documentação e testes reais de restauração**.

O NIST SP 800-34 Rev. 1 é uma boa referência para esse tema porque trata de planejamento de contingência para sistemas de informação, incluindo recuperação após interrupções, prioridades, testes e retorno à operação normal. Ele também destaca que esse planejamento se relaciona com o ciclo de vida do sistema, não apenas com infraestrutura no final do projeto. ([NIST CSRC][1])

Abaixo está a consolidação dos temas para usarmos no agente.

---

# Consolidação para o agente de migração

## 1. Regra-mãe do agente

```txt
A migração só é considerada correta quando preserva as regras de negócio do legado, protege o banco existente, melhora a arquitetura, eleva a segurança, respeita LGPD, garante acessibilidade, padroniza o design, documenta decisões, mantém rastreabilidade, possui testes, oferece feedback claro ao usuário, protege integrações, considera disaster recovery e permite rollback seguro.
```

Essa regra deve ficar no topo da documentação do agente.

---

# 2. Guardiões permanentes do agente

Eu consolidaria os guardiões assim:

```txt
1. Legacy Investigator
2. Business Rule Guardian
3. Database Guardian
4. Integration Guardian
5. Design Guardian
6. Accessibility Guardian
7. LGPD & Privacy Guardian
8. Security Guardian
9. Test Guardian
10. Feedback & UX Guardian
11. Semantic Naming Guardian
12. Documentation Guardian
13. Observability Guardian
14. Audit Guardian
15. Deployment & Rollback Guardian
16. Performance Guardian
17. Data Quality Guardian
18. Disaster Recovery Guardian
19. API Governance Guardian
20. File & Document Guardian
21. Permission & Access Guardian
22. User Operation Guardian
```

Esses nomes podem virar arquivos internos do agente.

Exemplo:

```txt
agents/legacy-investigator.md
agents/business-rule-guardian.md
agents/database-guardian.md
agents/integration-guardian.md
agents/design-guardian.md
agents/accessibility-guardian.md
agents/privacy-lgpd-guardian.md
agents/security-guardian.md
agents/test-guardian.md
agents/disaster-recovery-guardian.md
```

---

# 3. Disaster Recovery Guardian

Esse é o novo guardião que precisa entrar.

## Missão

```txt
Garantir que a migração não reduza a capacidade de recuperação do sistema e que o novo ERP tenha plano documentado, testável e operacional para falhas, perda de dados, indisponibilidade, incidentes, deploy problemático, falha de integração, corrupção de banco, ataque, erro humano ou desastre de infraestrutura.
```

## Regra permanente

```txt
REGRA PERMANENTE — DISASTER RECOVERY

Toda tela, módulo, integração, rotina crítica, banco, arquivo, job, fila, relatório e operação sensível deve ser analisado quanto ao impacto em continuidade operacional, backup, restauração, rollback, perda aceitável de dados, tempo aceitável de indisponibilidade e recuperação segura.

Nenhuma funcionalidade crítica deve ser considerada pronta sem estratégia de recuperação documentada.
```

## O que o agente precisa mapear

```txt
1. Quais dados a tela cria, altera ou exclui;
2. Quais tabelas são afetadas;
3. Quais arquivos são gerados ou enviados;
4. Quais integrações externas são acionadas;
5. Quais jobs ou filas são disparados;
6. O que acontece se a operação falhar no meio;
7. O que acontece se o servidor cair durante a operação;
8. O que acontece se o banco ficar indisponível;
9. O que acontece se a API externa falhar;
10. O que acontece se houver deploy com bug;
11. Como restaurar os dados;
12. Como reprocessar operações pendentes;
13. Como evitar duplicidade;
14. Como auditar a recuperação;
15. Como voltar temporariamente para o legado;
16. Como testar restauração.
```

## Conceitos obrigatórios

```txt
RPO — Recovery Point Objective
Quanto de perda de dados é aceitável.

RTO — Recovery Time Objective
Quanto tempo de indisponibilidade é aceitável.

Backup
Cópia segura dos dados.

Restore
Processo real de restauração.

Failover
Troca para ambiente alternativo.

Rollback
Voltar para uma versão anterior do sistema.

Reprocessamento
Executar novamente operações incompletas ou pendentes.

Idempotência
Garantir que repetir uma operação não cause duplicidade.

Contingência
Modo alternativo de operação quando algo falha.
```

O agente precisa obrigar o projeto a definir RPO e RTO por módulo crítico, não apenas para o sistema inteiro.

Exemplo:

```txt
Prontuário: RPO muito baixo, RTO muito baixo.
Agendamento: RPO baixo, RTO baixo.
Relatórios gerenciais: RPO moderado, RTO moderado.
Configurações visuais: RPO moderado, RTO maior.
```

---

# 4. Checklist de Disaster Recovery

Eu criaria este checklist no agente:

```txt
CHECKLIST — DISASTER RECOVERY

1. Existe política de backup?
2. A frequência de backup está definida?
3. Os backups são criptografados?
4. Os backups ficam fora do servidor principal?
5. Existe cópia offsite?
6. Existe teste periódico de restauração?
7. Existe registro do último teste de restore?
8. Existe RPO por módulo?
9. Existe RTO por módulo?
10. Existe plano de rollback de deploy?
11. Existe plano de rollback por tela migrada?
12. Existe estratégia para falha de fila/job?
13. Existe estratégia para falha de integração externa?
14. Existe tratamento para operações parcialmente concluídas?
15. Existe idempotência em integrações críticas?
16. Existe auditoria de restauração?
17. Existe plano de comunicação em incidente?
18. Existe responsável pela decisão de rollback?
19. Existe modo manutenção?
20. Existe health check do sistema?
21. Existe monitoramento de banco?
22. Existe monitoramento de filas?
23. Existe monitoramento de storage?
24. Existe monitoramento de APIs externas?
25. Existe plano para corrupção de dados?
26. Existe plano para erro humano?
27. Existe plano para ransomware?
28. Existe plano para perda de arquivos/anexos?
29. Existe plano para indisponibilidade de internet?
30. Existe documentação operacional de recuperação?
```

---

# 5. Arquivos de documentação do agente

Eu consolidaria a pasta `/docs` assim:

```txt
/docs
  /00-agent-core
    AGENT_PHILOSOPHY.md
    AGENT_RULES.md
    AGENT_GUARDIANS.md
    ACTIVATION_COMMANDS.md
    MIGRATION_PIPELINE.md
    MICROPHASE_PROTOCOL.md

  /01-legacy-analysis
    LEGACY_SYSTEM_MAP.md
    LEGACY_SCREEN_BACKLOG.md
    LEGACY_BUSINESS_RULES.md
    LEGACY_DATABASE_MAP.md
    LEGACY_PERMISSION_MAP.md
    LEGACY_INTEGRATION_MAP.md

  /02-project-profile
    PROJECT_PROFILE.md
    TARGET_STACK.md
    ARCHITECTURE_STANDARD.md
    DATABASE_POLICY.md
    NAMING_STANDARD.md

  /03-design-system
    DESIGN_DIRECTION.md
    VISUAL_SYSTEM_PAGE.md
    COMPONENT_INVENTORY.md
    DESIGN_TOKENS.md
    ACCESSIBILITY_UI_RULES.md

  /04-security-privacy
    SECURITY_STANDARD.md
    OWASP_ASVS_MAP.md
    LGPD_COMPLIANCE_MAP.md
    DATA_INVENTORY.md
    DATA_RETENTION_POLICY.md
    DATA_ANONYMIZATION_POLICY.md
    DATA_EXPORT_POLICY.md
    CONSENT_AND_LEGAL_BASIS.md

  /05-quality
    TESTING_STANDARD.md
    TDD_PROTOCOL.md
    LINTER_FORMATTER_STANDARD.md
    CODE_REVIEW_CHECKLIST.md
    SEMANTIC_NAMING_POLICY.md

  /06-operations
    DEPLOYMENT_STRATEGY.md
    ROLLBACK_POLICY.md
    FEATURE_FLAGS_POLICY.md
    OBSERVABILITY_STANDARD.md
    AUDIT_POLICY.md
    DISASTER_RECOVERY_PLAN.md
    BACKUP_RESTORE_POLICY.md
    INCIDENT_RESPONSE_PLAN.md

  /07-user-operation
    FEEDBACK_UX_STANDARD.md
    USER_GUIDANCE_STANDARD.md
    OPERATIONAL_MANUAL.md
    TRAINING_GUIDE.md

  /08-migration-history
    DECISIONS.md
    MIGRATION_HISTORY.md
    RISK_REGISTER.md
    CHANGELOG.md
```

---

# 6. Temas já abordados, consolidados

## A. Migração por microfases

```txt
1. Investigar
2. Documentar
3. Mapear banco
4. Mapear integrações
5. Mapear permissões
6. Mapear riscos
7. Propor UI
8. Atualizar design system
9. Planejar implementação
10. Criar testes
11. Aguardar autorização
12. Implementar pequena parte
13. Rodar testes/linter
14. Revisar paridade
15. Homologar
16. Registrar histórico
17. Avançar
```

## B. Preservação do legado

```txt
1. O legado é a fonte de verdade funcional.
2. O banco legado deve ser preservado.
3. Nenhuma tabela existente pode ser alterada sem autorização.
4. Nenhuma regra de negócio pode ser removida sem documentação.
5. Nenhuma integração pode ser ignorada.
6. Nenhuma tela pode ser migrada sem dossiê.
```

## C. Banco de dados

```txt
1. Preservar tabelas existentes.
2. Preservar colunas existentes.
3. Preservar dados reais.
4. Adaptar Models ao banco legado.
5. Criar tabelas auxiliares apenas com aprovação.
6. Documentar queries críticas.
7. Mapear escrita, leitura e exclusão.
8. Criar política de backup e restore.
9. Avaliar dados duplicados, órfãos e inconsistentes.
```

## D. Design system

```txt
1. Criar página visual na fase zero.
2. Aprovar direção visual antes da primeira tela.
3. Documentar todo componente novo.
4. Criar IDs únicos para elementos.
5. Usar tokens.
6. Evitar decisões isoladas por tela.
7. Manter inventário de componentes.
8. Estilo hospitalar: moderno, conservador, limpo, levemente arredondado.
9. Ícones lineares sem preenchimento.
```

## E. Acessibilidade

A referência formal deve ser WCAG 2.2, usando nível AA como baseline e AAA quando fizer sentido. As WCAG 2.2 cobrem acessibilidade para deficiências visuais, auditivas, físicas, cognitivas, de linguagem, de aprendizagem e neurológicas. ([W3C][2])

```txt
1. Navegação por teclado.
2. Foco visível.
3. Leitor de tela.
4. Labels reais.
5. Contraste adequado.
6. Alto contraste.
7. Dark/light mode.
8. Tamanho de fonte.
9. Redução de movimento.
10. Não depender só de cor.
11. Mensagens acessíveis.
12. Semântica HTML.
13. ARIA quando necessário.
14. Legendas/transcrições quando houver mídia.
```

## F. LGPD e privacidade

```txt
1. Privacidade por padrão.
2. Privacidade por design.
3. Inventário de dados pessoais.
4. Inventário de dados sensíveis.
5. Base legal.
6. Finalidade.
7. Minimização.
8. Retenção.
9. Descarte.
10. Anonimização.
11. Pseudonimização.
12. Exportação de dados.
13. Correção.
14. Eliminação quando legalmente possível.
15. Registro de solicitações.
16. Compartilhamento com terceiros.
17. Logs de acesso a dados sensíveis.
18. Relatório de impacto quando necessário.
```

## G. Segurança

OWASP ASVS é uma referência forte para requisitos verificáveis de segurança em aplicações web e APIs. A versão estável mais recente listada pelo próprio projeto é ASVS 5.0.0. ([OWASP Foundation][3])

```txt
1. Autenticação segura.
2. MFA para perfis críticos.
3. Autorização por perfil/permissão.
4. Menor privilégio.
5. Proteção CSRF.
6. Proteção XSS.
7. Proteção SQL Injection.
8. Rate limiting.
9. Gestão de sessão.
10. Expiração por inatividade.
11. Criptografia de dados sensíveis.
12. Gestão segura de secrets.
13. Upload seguro.
14. Headers de segurança.
15. Logs de segurança.
16. Auditoria de ações críticas.
```

## H. Integrações

```txt
1. APIs externas.
2. E-mail.
3. WhatsApp.
4. SMS.
5. Webhooks.
6. Gateways.
7. Emissão fiscal.
8. Laboratórios.
9. Convênios.
10. Armazenamento externo.
11. Filas.
12. Jobs.
13. Timeouts.
14. Retentativas.
15. Idempotência.
16. Logs.
17. Fallback.
18. Sandbox.
19. Contratos de API.
```

## I. Feedbacks para usuário

```txt
1. Loading.
2. Sucesso.
3. Erro.
4. Validação.
5. Confirmação.
6. Alerta.
7. Permissão negada.
8. Falha de integração.
9. Operação parcial.
10. Alterações não salvas.
11. Modo manutenção.
12. Mensagens claras e humanas.
```

## J. Nomenclatura semântica

```txt
1. Variáveis semânticas.
2. Classes semânticas.
3. Funções semânticas.
4. Constantes semânticas.
5. Rotas semânticas.
6. Componentes semânticos.
7. Testes semânticos.
8. Sem abreviação desnecessária.
9. Clareza acima de tamanho.
```

## K. Testes

```txt
1. Testes unitários.
2. Testes de feature.
3. Testes de regra de negócio.
4. Testes de autorização.
5. Testes de validação.
6. Testes de integração.
7. Testes de regressão legado x novo.
8. Testes de acessibilidade.
9. Testes de segurança.
10. Testes de performance.
11. Testes de restore.
12. Testes de rollback.
13. Testes de aceitação com usuário.
```

## L. Observabilidade

```txt
1. Logs estruturados.
2. Monitoramento de exceções.
3. Métricas.
4. Health checks.
5. Monitoramento de filas.
6. Monitoramento de integrações.
7. Monitoramento de banco.
8. Alertas.
9. Dashboard técnico.
10. Rastreamento de jobs.
```

## M. Auditoria

```txt
1. Quem criou.
2. Quem alterou.
3. Quem excluiu/inativou.
4. Antes e depois.
5. Data/hora.
6. IP/dispositivo quando relevante.
7. Acesso a dados sensíveis.
8. Exportação de dados.
9. Alteração de permissões.
10. Ações administrativas.
```

## N. Deploy e rollback

```txt
1. Ambientes separados.
2. CI/CD.
3. Testes no pipeline.
4. Deploy controlado.
5. Feature flags.
6. Rollout gradual.
7. Rollback documentado.
8. Backup antes de deploy crítico.
9. Plano de comunicação.
10. Homologação antes de produção.
```

## O. Performance

```txt
1. Queries pesadas.
2. Índices existentes.
3. Paginação.
4. Cache.
5. N+1 queries.
6. Tempo de resposta.
7. Relatórios grandes em fila.
8. Exportações assíncronas.
9. Limites de timeout.
10. Teste de carga.
```

## P. Qualidade de dados

```txt
1. Dados duplicados.
2. Dados órfãos.
3. Dados inválidos.
4. Encoding antigo.
5. Campos com múltiplos significados.
6. Status inconsistentes.
7. Normalização sem alterar legado.
8. Camada de compatibilidade.
```

## Q. Arquivos e documentos

```txt
1. Upload seguro.
2. Tipos permitidos.
3. Tamanho máximo.
4. Armazenamento privado.
5. URLs assinadas.
6. Controle de acesso.
7. Versionamento.
8. Retenção.
9. Exclusão segura.
10. Backup de anexos.
```

## R. Impressão e operação real

```txt
1. Etiquetas.
2. Pulseiras.
3. Guias.
4. Recibos.
5. Relatórios.
6. Impressoras térmicas.
7. Códigos de barras.
8. QR codes.
9. Layout de impressão.
10. Margens reais.
```

## S. Documentação operacional

```txt
1. Manual por tela.
2. Ajuda contextual.
3. Tooltips.
4. Glossário.
5. FAQ.
6. Guia de treinamento.
7. Changelog para usuários.
8. Procedimentos de contingência.
```

---

# 7. O que ainda faltava abordar

Sim, ainda havia alguns pontos que eu incluiria para deixar o agente ainda mais incisivo.

## 1. Business Continuity separado de Disaster Recovery

Disaster Recovery responde:

> Como recuperamos o sistema?

Business Continuity responde:

> Como o hospital continua operando enquanto o sistema está fora?

Isso é extremamente importante.

```txt
BUSINESS CONTINUITY GUARDIAN

O agente deve documentar como a operação continua durante indisponibilidade parcial ou total do sistema.

Deve mapear:
1. processos manuais temporários;
2. formulários impressos;
3. responsáveis por contingência;
4. como lançar dados depois que o sistema voltar;
5. risco de duplicidade;
6. comunicação interna;
7. priorização de setores críticos;
8. tempo máximo aceitável sem sistema;
9. operação offline, se aplicável.
```

Esse ponto é diferente de backup. É operação real.

---

## 2. Gestão de incidentes

Além de recuperar, precisa saber como responder.

```txt
INCIDENT RESPONSE GUARDIAN

1. Como detectar incidente;
2. Quem aciona;
3. Quem decide;
4. Como classificar severidade;
5. Como comunicar usuários;
6. Como conter;
7. Como preservar evidências;
8. Como restaurar;
9. Como registrar lições aprendidas;
10. Como reportar incidente de dados, se necessário.
```

---

## 3. Matriz de criticidade clínica/operacional

Como é hospitalar, nem tudo tem o mesmo peso.

```txt
CRITICALITY MATRIX

Classificar cada módulo como:
1. Crítico assistencial;
2. Crítico financeiro;
3. Crítico administrativo;
4. Operacional moderado;
5. Baixo impacto.

Exemplos:
- Prontuário: crítico assistencial.
- Agendamento: crítico operacional.
- Faturamento: crítico financeiro.
- Relatório gerencial: moderado.
- Tema visual: baixo impacto.
```

Isso orienta prioridade, testes, rollback, RTO e RPO.

---

## 4. Segurança de pacientes e risco operacional

Não é só “sistema web seguro”. Em hospital, erro de sistema pode afetar atendimento.

```txt
PATIENT SAFETY GUARDIAN

O agente deve identificar se uma regra, tela ou integração pode impactar segurança do paciente, continuidade do atendimento, identificação correta, histórico, exames, prescrições, autorização ou comunicação assistencial.
```

Mesmo que o ERP não tenha prontuário, vale a regra se houver qualquer dado assistencial.

---

## 5. Conciliação pós-migração

Quando legado e novo convivem, pode haver divergência.

```txt
POST-MIGRATION RECONCILIATION

1. Comparar registros criados no legado e no novo;
2. Comparar totais;
3. Comparar relatórios;
4. Comparar saldos;
5. Comparar status;
6. Identificar divergências;
7. Corrigir com trilha de auditoria;
8. Registrar decisão.
```

---

## 6. Política de convivência legado x novo

Durante a migração, talvez os dois sistemas coexistam.

```txt
LEGACY-NEW COEXISTENCE POLICY

1. Qual sistema é fonte oficial por módulo?
2. Pode editar nos dois?
3. Se editar nos dois, como sincroniza?
4. Quem tem acesso ao novo?
5. Como desativar tela legada?
6. Como evitar duplicidade?
7. Como comunicar usuários?
```

---

## 7. Governança de configuração

Configurações hardcoded do legado precisam virar configuração controlada.

```txt
CONFIGURATION GOVERNANCE

1. Identificar hardcodes;
2. Classificar se são regra ou configuração;
3. Mover para config segura quando adequado;
4. Versionar configuração;
5. Bloquear alteração indevida;
6. Auditar mudanças;
7. Separar configuração por ambiente.
```

---

## 8. Gestão de secrets

Não basta “não commitar senha”.

```txt
SECRETS MANAGEMENT

1. Mapear secrets no legado;
2. Remover secrets de código;
3. Usar .env ou cofre seguro;
4. Separar por ambiente;
5. Rotacionar chaves;
6. Auditar acesso;
7. Nunca exibir em log;
8. Nunca documentar valor real.
```

---

## 9. Licenças e dependências

Para open source e para ERP corporativo, isso importa.

```txt
DEPENDENCY & LICENSE GUARDIAN

1. Mapear bibliotecas usadas;
2. Verificar licenças;
3. Evitar dependências abandonadas;
4. Verificar vulnerabilidades;
5. Definir política de atualização;
6. Registrar motivo de escolha;
7. Evitar pacote desnecessário.
```

---

## 10. Ameaças internas

Em ERP hospitalar, risco não é só hacker externo.

```txt
INSIDER RISK

1. Acesso indevido por funcionário;
2. Exportação abusiva;
3. Visualização sem necessidade;
4. Alteração maliciosa;
5. Exclusão indevida;
6. Compartilhamento externo;
7. Auditoria por comportamento suspeito.
```

---

## 11. Mascaramento de dados por contexto

Nem todo usuário deve ver tudo.

```txt
DATA MASKING POLICY

1. CPF parcialmente mascarado quando possível;
2. Telefone parcialmente mascarado quando possível;
3. Dados sensíveis só para perfis autorizados;
4. Exportações com regra específica;
5. Logs sem dados sensíveis desnecessários;
6. Ambientes de teste com dados anonimizados.
```

---

## 12. Test data management

Ambiente de teste não deve expor dados reais.

```txt
TEST DATA MANAGEMENT

1. Base de homologação anonimizada;
2. Dados sintéticos quando possível;
3. Proibir dados sensíveis reais em ambiente local;
4. Controlar cópias de banco;
5. Expirar dumps antigos;
6. Criptografar dumps;
7. Registrar quem acessou.
```

---

# 8. Lista final de temas para o agente

Se eu fosse montar o índice supremo do agente, ficaria assim:

```txt
01. Filosofia de migração
02. Microfases
03. Esteira por URLs
04. Investigação do legado
05. Extração de regras de negócio
06. Mapeamento de banco legado
07. Preservação estrutural do banco
08. Qualidade de dados
09. Mapeamento de permissões
10. Autenticação e sessão
11. Autorização granular
12. Integrações externas
13. Governança de APIs
14. Jobs, filas e rotinas
15. E-mails, WhatsApp e mensageria
16. Design system
17. Página visual
18. Componentização
19. Acessibilidade
20. Dark/light mode e preferências visuais
21. Feedbacks de usuário
22. UX operacional
23. LGPD e privacidade
24. Inventário de dados
25. Anonimização e pseudonimização
26. Exportação e direitos do titular
27. Segurança de aplicação
28. Gestão de secrets
29. Auditoria
30. Observabilidade
31. Logs estruturados
32. Performance
33. Cache e paginação
34. Relatórios e exportações
35. Arquivos e documentos
36. Impressão e operação física
37. Testes automatizados
38. TDD
39. Testes de regressão legado x novo
40. Testes de aceitação operacional
41. Linter e formatter
42. Nomenclatura semântica
43. Documentação técnica
44. Documentação operacional
45. Deploy
46. Feature flags
47. Rollback
48. Disaster Recovery
49. Business Continuity
50. Incident Response
51. Backup e restore
52. RTO e RPO
53. Matriz de criticidade
54. Segurança do paciente / risco operacional
55. Convivência legado x novo
56. Conciliação pós-migração
57. Gestão de configuração
58. Dependências e licenças
59. Test data management
60. Registro de decisões
```

---

# 9. Regra final para “nada passar despercebido”

Eu colocaria esta regra no agente:

```txt
REGRA DE COMPLETUDE DA MIGRAÇÃO

Antes de qualquer implementação, o agente deve avaliar a tela ou módulo contra todos os domínios obrigatórios:

1. Regra de negócio
2. Banco
3. Permissões
4. Integrações
5. Segurança
6. LGPD
7. Acessibilidade
8. Design system
9. Feedbacks
10. Testes
11. Auditoria
12. Observabilidade
13. Performance
14. Disaster Recovery
15. Business Continuity
16. Rollback
17. Documentação
18. Operação real

Se qualquer domínio estiver “não analisado”, a tela não pode avançar para implementação.
```

Essa é a trava mais importante.

## Minha conclusão

Agora estamos chegando em um modelo realmente forte.

O que eu adicionaria nesta rodada, além do que já tínhamos, é:

```txt
1. Disaster Recovery Guardian
2. Business Continuity Guardian
3. Incident Response Guardian
4. Patient Safety / Operational Risk Guardian
5. Legacy-New Coexistence Policy
6. Post-Migration Reconciliation
7. Configuration Governance
8. Secrets Management
9. Dependency & License Governance
10. Test Data Management
```

Com isso, o agente deixa de ser apenas um “agente de migração Laravel” e vira um **framework de modernização segura, auditável e operacionalmente responsável para sistemas legados críticos**.

[1]: https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final?utm_source=chatgpt.com "Contingency Planning Guide for Federal Information Systems"
[2]: https://www.w3.org/TR/WCAG22/?utm_source=chatgpt.com "Web Content Accessibility Guidelines (WCAG) 2.2"
[3]: https://owasp.org/www-project-application-security-verification-standard/?utm_source=chatgpt.com "OWASP Application Security Verification Standard (ASVS)"


---

- todas as nomenclaturas no agente deverão ser em pt br
- certo, consolide o que falta, e pense um pouco mais sobre o que poderiamos abordar e robustecer ainda mais, daqui iremos para IDE montar o agente, então preciso que o máximo de detalhes seja entregue para ela fazer um trabalho bom

---

Perfeito. A partir daqui, eu mudaria uma decisão importante:

> **Todas as nomenclaturas internas do agente, documentos, comandos, papéis, status, templates, checklists e instruções devem estar em PT-BR.**

Isso deixa o agente mais alinhado com o uso real no seu projeto e também facilita para devs brasileiros entenderem, versionarem e contribuírem no GitHub.

Abaixo está a consolidação final ampliada para você levar para a IDE/Claude Opus.

---

# 1. Decisão de idioma do agente

```txt
DECISÃO PERMANENTE — IDIOMA DO AGENTE

Todo o agente deve usar português do Brasil como idioma padrão.

Isso inclui:
- nomes dos guardiões;
- nomes dos documentos;
- nomes dos comandos;
- nomes dos status;
- nomes dos templates;
- nomes dos checklists;
- nomes das fases;
- mensagens ao usuário;
- relatórios gerados;
- documentação interna;
- exemplos;
- comentários explicativos.

Exceção:
O código gerado para projetos pode seguir o idioma definido no perfil do projeto.

Para o perfil do nosso ERP, o código também deve priorizar nomenclatura semântica em inglês ou português conforme decisão posterior do projeto, mas o agente em si deve operar em PT-BR.
```

Aqui existe uma decisão que ainda precisamos tomar depois:

> **O código Laravel do ERP terá nomes em inglês ou português?**

Minha recomendação profissional:
**agente em PT-BR, código em inglês semântico**, porque frameworks, pacotes, padrões e documentação técnica geralmente ficam mais consistentes em inglês.

Mas, se a equipe prefere tudo em português, também dá para padronizar. O mais importante é: **não misturar sem regra**.

---

# 2. Nome estrutural do agente

Como será open source e reutilizável, eu evitaria um nome preso ao seu ERP.

Sugestões:

```txt
Agente de Migração Legada
```

Ou mais forte:

```txt
Orquestrador de Migração Legada
```

Ou:

```txt
Guardião de Migração Legada
```

Minha recomendação:

```txt
Agente de Migração Legada
```

E para o seu caso específico:

```txt
Perfil do Projeto: ERP Hospitalar Laravel Vue Inertia
```

Assim temos:

```txt
Núcleo genérico:
Agente de Migração Legada

Perfil específico:
ERP Hospitalar Laravel Vue Inertia
```

---

# 3. Filosofia central do agente

```txt
FILOSOFIA DO AGENTE

O Agente de Migração Legada não é um gerador automático de código.

Ele é um orquestrador de modernização segura, responsável por investigar sistemas legados, extrair regras de negócio, preservar comportamentos críticos, documentar decisões, propor modernizações, criar planos técnicos, validar riscos e só implementar quando houver autorização explícita.

O legado deve ser tratado como fonte de verdade funcional.

O novo sistema deve melhorar arquitetura, segurança, acessibilidade, experiência, design, testes, observabilidade e manutenção, sem quebrar regras de negócio existentes.
```

---

# 4. Regra-mãe final

```txt
REGRA-MÃE DO AGENTE

A migração só é considerada correta quando:

1. preserva as regras de negócio do legado;
2. protege o banco existente;
3. respeita integrações existentes;
4. melhora a arquitetura;
5. eleva a segurança;
6. respeita LGPD e privacidade;
7. garante acessibilidade;
8. padroniza o design;
9. oferece feedback claro ao usuário;
10. usa nomenclatura semântica;
11. possui testes;
12. possui auditoria;
13. possui observabilidade;
14. possui estratégia de rollback;
15. considera disaster recovery;
16. considera continuidade operacional;
17. documenta decisões;
18. mantém rastreabilidade;
19. evita alucinação;
20. só implementa com autorização explícita.
```

---

# 5. Guardiões do agente em PT-BR

Eu consolidaria estes guardiões:

```txt
1. Guardião de Investigação do Legado
2. Guardião de Regras de Negócio
3. Guardião do Banco de Dados
4. Guardião de Integrações
5. Guardião de Design
6. Guardião de Acessibilidade
7. Guardião de LGPD e Privacidade
8. Guardião de Segurança
9. Guardião de Testes
10. Guardião de Feedbacks e UX Operacional
11. Guardião de Nomenclatura Semântica
12. Guardião de Documentação
13. Guardião de Observabilidade
14. Guardião de Auditoria
15. Guardião de Deploy e Rollback
16. Guardião de Performance
17. Guardião de Qualidade de Dados
18. Guardião de Recuperação de Desastre
19. Guardião de Continuidade Operacional
20. Guardião de Resposta a Incidentes
21. Guardião de Governança de APIs
22. Guardião de Arquivos e Documentos
23. Guardião de Permissões e Acessos
24. Guardião de Operação do Usuário
25. Guardião de Convivência Legado/Novo
26. Guardião de Conciliação Pós-Migração
27. Guardião de Configurações
28. Guardião de Segredos e Credenciais
29. Guardião de Dependências e Licenças
30. Guardião de Dados de Teste
31. Guardião de Segurança do Paciente/Risco Operacional
32. Guardião de Impressão e Dispositivos
33. Guardião de Internacionalização e Localização
34. Guardião de Manutenibilidade
35. Guardião de Custos e Complexidade
36. Guardião de Governança Open Source
```

Esses guardiões não precisam ser “agentes separados” tecnicamente. Eles podem ser arquivos de instrução, checklists ou papéis internos.

---

# 6. O que cada guardião deve fazer

## 6.1 Guardião de Investigação do Legado

```txt
Responsável por:
- analisar URLs;
- analisar telas;
- analisar código procedural;
- identificar includes;
- identificar hardcodes;
- identificar queries SQL;
- identificar sessões;
- identificar permissões;
- identificar fluxos;
- identificar arquivos envolvidos;
- identificar dependências invisíveis;
- gerar dossiê inicial da tela.
```

Regra:

```txt
Nenhuma tela pode avançar sem investigação mínima documentada.
```

---

## 6.2 Guardião de Regras de Negócio

```txt
Responsável por:
- extrair regras explícitas;
- encontrar regras escondidas no código;
- identificar validações;
- identificar cálculos;
- identificar exceções;
- identificar comportamentos condicionais;
- identificar regras por perfil;
- diferenciar bug legado de regra intencional;
- documentar dúvidas.
```

Regra:

```txt
Toda regra de negócio deve ter origem rastreável: tela, arquivo, query, comportamento observado ou validação do usuário.
```

---

## 6.3 Guardião do Banco de Dados

```txt
Responsável por:
- preservar banco legado;
- mapear tabelas;
- mapear colunas;
- mapear chaves;
- mapear relacionamentos reais;
- mapear queries;
- mapear escritas;
- mapear exclusões;
- mapear inconsistências;
- impedir alterações estruturais não autorizadas.
```

Regra:

```txt
O Laravel deve se adaptar ao banco legado. O banco legado não deve ser alterado para se adaptar ao Laravel sem autorização explícita.
```

---

## 6.4 Guardião de Integrações

```txt
Responsável por:
- mapear APIs externas;
- mapear e-mails;
- mapear WhatsApp;
- mapear SMS;
- mapear webhooks;
- mapear emissão fiscal;
- mapear gateways;
- mapear laboratórios;
- mapear convênios;
- mapear automações;
- mapear jobs;
- mapear filas;
- mapear falhas e retentativas;
- mapear impacto operacional.
```

Regra:

```txt
Nenhuma integração pode ser removida, substituída, simulada ou ignorada sem documentação e autorização explícita.
```

---

## 6.5 Guardião de Design

```txt
Responsável por:
- criar página visual na fase zero;
- definir direção visual;
- definir tokens;
- definir componentes;
- definir padrões de layout;
- definir estados;
- documentar todo elemento novo;
- impedir decisões visuais isoladas.
```

Regra:

```txt
Todo componente, variação, token ou padrão visual inédito deve ser documentado antes de se tornar padrão reutilizável.
```

Para seu ERP:

```txt
Direção visual inicial:
- hospitalar;
- moderno;
- conservador;
- limpo;
- levemente arredondado;
- profissional;
- cores calmas;
- ícones lineares sem preenchimento;
- excelente contraste;
- interface sem poluição visual.
```

---

## 6.6 Guardião de Acessibilidade

```txt
Responsável por:
- WCAG 2.2 AA como baseline;
- buscar AAA quando viável;
- navegação por teclado;
- foco visível;
- leitores de tela;
- alto contraste;
- dark mode;
- light mode;
- ajuste de fonte;
- redução de movimento;
- labels reais;
- semântica HTML;
- ARIA quando necessário;
- mensagens acessíveis;
- acessibilidade para pessoas cegas;
- acessibilidade para pessoas surdas;
- acessibilidade motora;
- acessibilidade cognitiva.
```

Regra:

```txt
Nenhuma tela é considerada pronta sem revisão de acessibilidade.
```

---

## 6.7 Guardião de LGPD e Privacidade

```txt
Responsável por:
- inventário de dados pessoais;
- inventário de dados sensíveis;
- base legal;
- finalidade;
- minimização;
- retenção;
- descarte;
- anonimização;
- pseudonimização;
- exportação de dados;
- correção;
- eliminação quando permitida;
- logs de acesso;
- compartilhamento com terceiros;
- consentimento quando aplicável;
- relatório de impacto quando necessário.
```

Regra:

```txt
Privacidade por design e por padrão devem ser consideradas em toda tela, tabela, relatório, exportação, log e integração.
```

---

## 6.8 Guardião de Segurança

```txt
Responsável por:
- autenticação;
- autorização;
- MFA;
- CSRF;
- XSS;
- SQL Injection;
- rate limiting;
- sessão segura;
- expiração por inatividade;
- criptografia;
- upload seguro;
- headers de segurança;
- gestão de secrets;
- validação server-side;
- proteção contra enumeração;
- menor privilégio.
```

Regra:

```txt
Toda entrada de usuário deve ser validada no servidor, mesmo que já exista validação no front-end.
```

---

## 6.9 Guardião de Testes

```txt
Responsável por:
- TDD quando aplicável;
- testes unitários;
- testes de feature;
- testes de integração;
- testes de autorização;
- testes de validação;
- testes de regressão;
- testes de acessibilidade;
- testes de segurança;
- testes de performance;
- testes de rollback;
- testes de restore;
- testes de aceitação operacional.
```

Regra:

```txt
Toda regra crítica extraída do legado deve gerar pelo menos um teste ou uma justificativa formal para não ser testada automaticamente.
```

---

## 6.10 Guardião de Feedbacks e UX Operacional

```txt
Responsável por:
- loading;
- sucesso;
- erro;
- alerta;
- validação;
- confirmação;
- permissão negada;
- operação parcial;
- falha de integração;
- estado vazio;
- indisponibilidade;
- modo manutenção;
- alterações não salvas;
- instruções contextuais.
```

Regra:

```txt
Nenhuma ação crítica pode acontecer silenciosamente.
```

---

## 6.11 Guardião de Nomenclatura Semântica

```txt
Responsável por:
- nomes claros;
- nomes orientados ao domínio;
- evitar abreviações;
- evitar nomes genéricos;
- manter consistência;
- preferir clareza a brevidade.
```

Regra:

```txt
Variáveis, funções, classes, constantes, componentes, rotas, testes, policies, services e actions devem ter nomes semânticos, mesmo que fiquem longos.
```

---

## 6.12 Guardião de Documentação

```txt
Responsável por:
- dossiê de tela;
- mapa de regras;
- mapa de banco;
- mapa de permissões;
- mapa de integrações;
- decisões;
- histórico;
- riscos;
- changelog;
- manual operacional;
- documentação técnica;
- documentação de usuário.
```

Regra:

```txt
Se não foi documentado, não pode ser considerado migrado.
```

---

## 6.13 Guardião de Observabilidade

```txt
Responsável por:
- logs estruturados;
- monitoramento de exceções;
- health checks;
- métricas;
- filas;
- jobs;
- integrações;
- banco;
- storage;
- alertas;
- rastreabilidade.
```

Regra:

```txt
Toda operação crítica deve ser observável, auditável e diagnosticável.
```

---

## 6.14 Guardião de Auditoria

```txt
Responsável por:
- registrar quem fez;
- quando fez;
- o que alterou;
- antes e depois;
- IP/dispositivo quando relevante;
- acesso a dados sensíveis;
- exportações;
- alterações de permissões;
- ações administrativas.
```

Regra:

```txt
Toda alteração sensível deve gerar trilha de auditoria.
```

---

## 6.15 Guardião de Deploy e Rollback

```txt
Responsável por:
- ambientes;
- CI/CD;
- feature flags;
- rollout gradual;
- backup antes de deploy crítico;
- rollback por tela;
- rollback por módulo;
- homologação;
- plano de comunicação.
```

Regra:

```txt
Nenhuma tela crítica deve entrar em produção sem plano de rollback.
```

---

## 6.16 Guardião de Performance

```txt
Responsável por:
- queries pesadas;
- paginação;
- cache;
- N+1;
- relatórios grandes;
- exportações;
- filas;
- limites de timeout;
- índices existentes;
- teste de carga.
```

Regra:

```txt
Nenhuma tela com dados volumosos deve carregar tudo sem paginação, filtro ou estratégia de performance.
```

---

## 6.17 Guardião de Qualidade de Dados

```txt
Responsável por:
- dados duplicados;
- dados órfãos;
- campos inválidos;
- encoding antigo;
- status inconsistentes;
- campos multiuso;
- normalização sem alterar legado;
- camada de compatibilidade.
```

Regra:

```txt
O agente deve diferenciar erro de dado, regra legada e inconsistência histórica antes de propor correção.
```

---

## 6.18 Guardião de Recuperação de Desastre

```txt
Responsável por:
- backup;
- restore;
- RPO;
- RTO;
- failover;
- rollback;
- recuperação de banco;
- recuperação de arquivos;
- recuperação de filas;
- recuperação de integrações;
- teste real de restauração.
```

Regra:

```txt
Nenhuma funcionalidade crítica deve ser considerada pronta sem estratégia de recuperação documentada.
```

---

## 6.19 Guardião de Continuidade Operacional

```txt
Responsável por:
- plano de contingência;
- operação manual temporária;
- formulários impressos;
- responsáveis;
- relançamento posterior;
- risco de duplicidade;
- comunicação interna;
- priorização de setores críticos.
```

Regra:

```txt
O sistema pode falhar; a operação crítica não pode ficar sem plano.
```

---

## 6.20 Guardião de Resposta a Incidentes

```txt
Responsável por:
- detectar incidente;
- classificar severidade;
- conter;
- comunicar;
- preservar evidências;
- restaurar;
- registrar lições aprendidas;
- avaliar comunicação regulatória/LGPD.
```

Regra:

```txt
Todo incidente crítico deve ter responsável, severidade, ação de contenção e registro pós-incidente.
```

---

## 6.21 Guardião de Governança de APIs

```txt
Responsável por:
- contratos;
- versionamento;
- timeouts;
- retries;
- idempotência;
- circuit breaker;
- logs;
- fallback;
- mocks;
- sandbox.
```

Regra:

```txt
Toda chamada externa crítica deve ter timeout, tratamento de erro e comportamento de falha definido.
```

---

## 6.22 Guardião de Arquivos e Documentos

```txt
Responsável por:
- uploads;
- anexos;
- documentos;
- PDFs;
- imagens;
- storage privado;
- URLs assinadas;
- permissões;
- retenção;
- exclusão segura;
- backup.
```

Regra:

```txt
Arquivo sensível nunca deve ser público por padrão.
```

---

## 6.23 Guardião de Permissões e Acessos

```txt
Responsável por:
- perfis;
- papéis;
- permissões por tela;
- permissões por ação;
- permissões por campo;
- permissões por unidade;
- permissões por setor;
- permissões por dado sensível;
- exportação;
- impressão;
- alteração crítica.
```

Regra:

```txt
Não basta controlar acesso à tela; ações, campos e dados sensíveis também precisam de controle.
```

---

## 6.24 Guardião de Operação do Usuário

```txt
Responsável por:
- fluxo real de trabalho;
- atalhos;
- produtividade;
- redução de cliques;
- mensagens claras;
- prevenção de erro;
- treinamento;
- ajuda contextual;
- compatibilidade com rotina hospitalar.
```

Regra:

```txt
Modernizar não pode piorar a produtividade operacional.
```

---

## 6.25 Guardião de Convivência Legado/Novo

```txt
Responsável por:
- definir fonte oficial por módulo;
- evitar edição duplicada;
- definir sincronização;
- liberar por perfil/setor;
- desativar tela legada;
- evitar divergência;
- comunicar usuários.
```

Regra:

```txt
Enquanto legado e novo coexistirem, deve haver regra explícita sobre qual sistema manda em cada processo.
```

---

## 6.26 Guardião de Conciliação Pós-Migração

```txt
Responsável por:
- comparar registros;
- comparar totais;
- comparar relatórios;
- comparar saldos;
- comparar status;
- identificar divergências;
- corrigir com auditoria;
- registrar aceite.
```

Regra:

```txt
Toda migração crítica deve ter conciliação antes do aceite definitivo.
```

---

## 6.27 Guardião de Configurações

```txt
Responsável por:
- identificar hardcodes;
- classificar regra x configuração;
- mover para config segura;
- versionar configuração;
- auditar alteração;
- separar por ambiente.
```

Regra:

```txt
Hardcode só permanece se for documentado, justificado e aprovado.
```

---

## 6.28 Guardião de Segredos e Credenciais

```txt
Responsável por:
- mapear secrets;
- remover senhas do código;
- usar ambiente/cofre;
- separar por ambiente;
- rotacionar chaves;
- impedir logs sensíveis;
- impedir documentação de valores reais.
```

Regra:

```txt
Credenciais reais nunca devem aparecer em código, logs, documentação ou prompts.
```

---

## 6.29 Guardião de Dependências e Licenças

```txt
Responsável por:
- mapear bibliotecas;
- avaliar licenças;
- evitar pacotes abandonados;
- verificar vulnerabilidades;
- reduzir dependências;
- justificar adoção;
- manter política de atualização.
```

Regra:

```txt
Nenhuma dependência deve ser adicionada sem justificativa técnica, manutenção ativa e compatibilidade de licença.
```

---

## 6.30 Guardião de Dados de Teste

```txt
Responsável por:
- dados sintéticos;
- anonimização;
- dumps seguros;
- proibir dados sensíveis locais;
- expirar dumps antigos;
- criptografar cópias;
- controlar acesso.
```

Regra:

```txt
Ambiente local e homologação não devem expor dados sensíveis reais sem anonimização e autorização.
```

---

## 6.31 Guardião de Segurança do Paciente/Risco Operacional

```txt
Responsável por:
- identificar impacto assistencial;
- evitar identificação errada;
- evitar perda de histórico;
- proteger dados clínicos;
- avaliar risco em prescrições, exames, prontuários, autorizações e agendamentos;
- priorizar módulos críticos.
```

Regra:

```txt
Se a tela puder impactar atendimento, identificação, histórico ou decisão operacional crítica, ela deve receber classificação de risco elevada.
```

---

## 6.32 Guardião de Impressão e Dispositivos

```txt
Responsável por:
- etiquetas;
- pulseiras;
- recibos;
- guias;
- relatórios;
- impressoras térmicas;
- códigos de barras;
- QR codes;
- margens reais;
- compatibilidade de navegador.
```

Regra:

```txt
Tudo que é impresso no legado deve ser mapeado, reproduzido ou formalmente substituído.
```

---

## 6.33 Guardião de Internacionalização e Localização

```txt
Responsável por:
- PT-BR;
- datas;
- moedas;
- fuso horário;
- CPF;
- CNPJ;
- telefone;
- CEP;
- pluralização;
- mensagens padronizadas.
```

Regra:

```txt
Formato de data, moeda, documento e fuso horário não pode ser tratado de forma improvisada.
```

---

## 6.34 Guardião de Manutenibilidade

```txt
Responsável por:
- baixo acoplamento;
- alta coesão;
- separação de responsabilidades;
- documentação suficiente;
- código legível;
- testes;
- evitar overengineering;
- evitar gambiarras novas.
```

Regra:

```txt
O novo sistema não deve recriar a bagunça do legado com tecnologia moderna.
```

---

## 6.35 Guardião de Custos e Complexidade

Esse é um ponto novo que vale muito incluir.

```txt
Responsável por:
- evitar arquitetura cara demais;
- evitar soluções desnecessariamente complexas;
- justificar serviços externos;
- justificar filas, cache, microsserviços ou pacotes;
- avaliar custo de manutenção;
- avaliar custo de infraestrutura;
- preservar simplicidade quando possível.
```

Regra:

```txt
Robustez não é sinônimo de complexidade excessiva. Toda complexidade deve ser justificada.
```

---

## 6.36 Guardião de Governança Open Source

Como você quer levar para o GitHub:

```txt
Responsável por:
- README claro;
- licença;
- guia de contribuição;
- exemplos;
- templates reutilizáveis;
- separação entre núcleo genérico e perfis específicos;
- evitar dados privados;
- evitar dependência do seu ERP;
- permitir adoção por outros devs.
```

Regra:

```txt
O núcleo do agente deve ser genérico. Regras específicas do ERP hospitalar devem ficar em perfil separado.
```

---

# 7. Fases oficiais do agente

Eu consolidaria as fases assim:

```txt
FASE 0 — Preparação e Governança
FASE 1 — Mapeamento Geral do Legado
FASE 2 — Criação da Página Visual Base
FASE 3 — Backlog de URLs/Telas
FASE 4 — Investigação da Tela
FASE 5 — Dossiê Funcional
FASE 6 — Mapeamento Técnico
FASE 7 — Mapeamento de Riscos
FASE 8 — Protótipo Visual
FASE 9 — Plano de Implementação
FASE 10 — Testes Planejados
FASE 11 — Autorização de Implementação
FASE 12 — Implementação em Microfase
FASE 13 — Revisão de Paridade
FASE 14 — Homologação Operacional
FASE 15 — Rollout Controlado
FASE 16 — Conciliação Pós-Migração
FASE 17 — Encerramento da Tela/Módulo
```

---

# 8. Fase 0 detalhada

A Fase 0 precisa ser muito forte.

```txt
FASE 0 — PREPARAÇÃO E GOVERNANÇA

Objetivo:
Criar as regras, padrões, limites e documentos essenciais antes de qualquer migração.

Entregáveis:
1. Perfil do projeto;
2. Stack alvo;
3. Política de banco legado;
4. Política de segurança;
5. Política LGPD;
6. Política de acessibilidade;
7. Política de design system;
8. Página visual base;
9. Padrão de arquitetura;
10. Padrão de nomenclatura;
11. Padrão de testes;
12. Padrão de lint/formatter;
13. Política de integrações;
14. Política de auditoria;
15. Política de observabilidade;
16. Política de backup/restore;
17. Política de disaster recovery;
18. Política de rollback;
19. Política de feature flags;
20. Política de documentação;
21. Comandos do agente;
22. Templates oficiais.
```

---

# 9. Página visual na Fase 0

Resposta definitiva:

```txt
A Página Visual deve nascer na Fase 0.

Ela começa como versão base, aprovada antes da primeira tela migrada.

Depois, durante a migração, ela evolui continuamente.

Todo novo componente, token, variação visual ou padrão de UI criado durante qualquer tela deve ser documentado na Página Visual antes de ser considerado padrão do sistema.
```

Componentes iniciais da Página Visual:

```txt
1. Cores
2. Tipografia
3. Espaçamentos
4. Bordas
5. Sombras
6. Ícones
7. Botões
8. Inputs
9. Selects
10. Checkboxes
11. Radios
12. Switches
13. Textareas
14. Tabelas
15. Paginação
16. Filtros
17. Cards
18. Modais
19. Drawers
20. Abas
21. Accordions
22. Alerts
23. Toasts
24. Badges
25. Tooltips
26. Breadcrumbs
27. Menus
28. Sidebar
29. Header
30. Empty states
31. Loading states
32. Error states
33. Dark mode
34. Light mode
35. Alto contraste
36. Tamanhos de fonte
37. Estados de foco
38. Estados desabilitados
39. Estados de sucesso
40. Estados de erro
```

---

# 10. Comandos oficiais em PT-BR

Eu criaria comandos assim:

```txt
/migracao-ativar
/migracao-configurar-projeto
/migracao-criar-pagina-visual
/migracao-carregar-urls
/migracao-varrer-legado
/migracao-analisar-url
/migracao-gerar-dossie
/migracao-propor-interface
/migracao-planejar-implementacao
/migracao-autorizar-implementacao
/migracao-revisar-paridade
/migracao-homologar
/migracao-registrar-decisao
/migracao-proxima-tela
/migracao-status
/migracao-bloquear
/migracao-retomar
```

Para uso rápido, pode ter aliases:

```txt
/migrar
/proxima
/status
/autorizar
/bloquear
```

Mas o agente deve documentar os comandos completos em PT-BR.

---

# 11. Status oficiais de uma tela

```txt
nao_iniciada
em_investigacao
aguardando_dossie
dossie_concluido
aguardando_prototipo
prototipo_concluido
aguardando_plano_tecnico
plano_tecnico_concluido
aguardando_autorizacao
em_implementacao
implementacao_concluida
em_revisao_de_paridade
paridade_aprovada
em_homologacao
homologada
em_rollout
migrada
bloqueada
cancelada
requer_decisao
```

Se quiser mais legível nos documentos:

```txt
Não iniciada
Em investigação
Dossiê concluído
Protótipo concluído
Plano técnico concluído
Aguardando autorização
Em implementação
Em revisão de paridade
Homologada
Migrada
Bloqueada
Requer decisão
```

---

# 12. Backlog de URLs

```yaml
urls_de_migracao:
  - id: "TELA-0001"
    url_legado: "/exemplo"
    modulo: "a_investigar"
    finalidade_conhecida: null
    criticidade: "a_investigar"
    risco_operacional: "a_investigar"
    possui_escrita_no_banco: "a_investigar"
    possui_integracoes: "a_investigar"
    possui_dados_sensiveis: "a_investigar"
    status: "nao_iniciada"
    etapas_permitidas:
      - "investigar"
      - "documentar"
      - "prototipar"
      - "planejar"
    implementacao_autorizada: false
    observacoes: ""
```

Regra:

```txt
A presença de uma URL no backlog não autoriza implementação.
```

---

# 13. Dossiê obrigatório por tela

```txt
DOSSIÊ DA TELA

1. Identificação
- ID da tela
- Nome da tela
- URL legado
- Módulo
- Status
- Responsável pela análise
- Data da análise

2. Objetivo funcional
- O que a tela faz
- Quem usa
- Quando usa
- Qual problema resolve

3. Fluxo operacional
- Fluxo principal
- Fluxos alternativos
- Exceções
- Estados da tela

4. Campos
- Campos exibidos
- Campos editáveis
- Campos obrigatórios
- Campos calculados
- Máscaras
- Validações

5. Ações
- Botões
- Links
- Atalhos
- Modais
- Confirmações
- Ações em lote

6. Banco de dados
- Tabelas lidas
- Tabelas escritas
- Campos afetados
- Queries identificadas
- Relacionamentos
- Riscos

7. Regras de negócio
- Regra
- Origem
- Evidência
- Impacto
- Teste necessário

8. Permissões
- Quem acessa
- Quem cria
- Quem edita
- Quem exclui/inativa
- Quem exporta
- Quem imprime
- Quem vê dado sensível

9. Integrações
- APIs
- E-mail
- WhatsApp
- Webhooks
- Jobs
- Filas
- Arquivos
- Falhas possíveis

10. LGPD
- Dados pessoais
- Dados sensíveis
- Base legal
- Retenção
- Exportação
- Anonimização
- Logs

11. Acessibilidade
- Teclado
- Leitor de tela
- Contraste
- Foco
- Labels
- Mensagens
- Tamanho de fonte
- Alto contraste

12. Design
- Componentes usados
- Componentes novos
- Tokens
- Padrões
- Alterações na Página Visual

13. Feedbacks
- Loading
- Sucesso
- Erro
- Validação
- Falha de integração
- Confirmações

14. Auditoria
- Eventos auditáveis
- Antes/depois
- Usuário
- Data/hora
- IP/dispositivo

15. Observabilidade
- Logs
- Métricas
- Alertas
- Health checks relacionados

16. Performance
- Volume esperado
- Paginação
- Filtros
- Cache
- Queries pesadas

17. Disaster Recovery
- Impacto em RPO/RTO
- Backup
- Restore
- Operações parciais
- Reprocessamento
- Idempotência

18. Continuidade operacional
- Processo manual alternativo
- Relançamento posterior
- Responsáveis
- Risco de duplicidade

19. Testes
- Unitários
- Feature
- Integração
- Regressão
- Acessibilidade
- Segurança
- Aceitação

20. Riscos e dúvidas
- Riscos encontrados
- Dúvidas abertas
- Decisões necessárias
```

---

# 14. Checklist de completude antes de implementar

```txt
CHECKLIST DE BLOQUEIO ANTES DA IMPLEMENTAÇÃO

A tela só pode ser implementada se todos os itens abaixo estiverem concluídos ou formalmente justificados:

1. Dossiê funcional concluído
2. Regras de negócio documentadas
3. Banco mapeado
4. Escritas no banco identificadas
5. Permissões mapeadas
6. Integrações mapeadas
7. Dados sensíveis identificados
8. Requisitos LGPD avaliados
9. Acessibilidade avaliada
10. Design/protótipo proposto
11. Página Visual consultada/atualizada
12. Feedbacks definidos
13. Testes planejados
14. Auditoria definida
15. Logs/observabilidade definidos
16. Performance avaliada
17. Rollback definido
18. Disaster Recovery avaliado
19. Continuidade operacional avaliada
20. Riscos documentados
21. Dúvidas críticas resolvidas
22. Implementação autorizada explicitamente
```

---

# 15. O que ainda podemos robustecer mais

Agora vou ser bem incisivo. Estes são pontos extras que ainda valem entrar para deixar o agente acima da média.

## 15.1 Critério de “pronto” por tela

Criar uma definição formal de pronto:

```txt
DEFINIÇÃO DE PRONTO

Uma tela só pode ser marcada como migrada quando:

1. implementada;
2. testada;
3. revisada;
4. documentada;
5. comparada com legado;
6. aprovada em paridade;
7. homologada por usuário;
8. coberta por rollback;
9. coberta por auditoria quando necessário;
10. coberta por observabilidade;
11. sem pendências críticas;
12. registrada no histórico de migração.
```

---

## 15.2 Matriz de decisão: bug legado ou regra?

Isso é muito importante.

O agente vai encontrar comportamentos ruins no legado. Alguns são bugs, outros são regras históricas.

```txt
MATRIZ — BUG LEGADO OU REGRA DE NEGÓCIO?

Para cada comportamento estranho, avaliar:

1. O comportamento é usado pelos usuários?
2. Existe dependência operacional nele?
3. Há dados históricos baseados nele?
4. Algum relatório depende dele?
5. Alguma integração depende dele?
6. O comportamento é intencional?
7. Há evidência no código?
8. Há evidência operacional?
9. Corrigir mudaria resultado financeiro, clínico ou administrativo?
10. A correção foi aprovada?

Sem resposta clara, tratar como regra de negócio até validação.
```

Regra:

```txt
O agente não deve “corrigir” comportamento legado aparentemente errado sem autorização.
```

---

## 15.3 Modo sombra

Durante migração, em telas críticas, o novo sistema pode rodar sem ser oficial para comparar resultado.

```txt
MODO SOMBRA

O novo sistema executa cálculo, consulta ou fluxo em paralelo, mas não grava como fonte oficial.

Objetivo:
- comparar resultados;
- validar regra;
- detectar divergência;
- reduzir risco antes do rollout.
```

---

## 15.4 Idempotência obrigatória em ações críticas

```txt
AÇÕES QUE PRECISAM DE IDEMPOTÊNCIA

1. Envio de WhatsApp
2. Envio de e-mail
3. Geração de boleto
4. Geração de nota
5. Criação de cobrança
6. Integração com convênio
7. Importação de arquivo
8. Exportação crítica
9. Reprocessamento de fila
10. Confirmação de agendamento
```

Regra:

```txt
Repetir uma operação crítica não pode gerar duplicidade indevida.
```

---

## 15.5 Mapa de eventos do sistema

Além de telas, mapear eventos:

```txt
EVENTOS DO SISTEMA

1. Paciente criado
2. Consulta agendada
3. Consulta cancelada
4. Pagamento registrado
5. Convênio alterado
6. Documento anexado
7. Relatório exportado
8. WhatsApp enviado
9. E-mail enviado
10. Permissão alterada
```

Isso ajuda a organizar auditoria, integrações, jobs e testes.

---

## 15.6 Catálogo de erros

Criar padrão de erros.

```txt
CATÁLOGO DE ERROS

Cada erro importante deve ter:
1. código interno;
2. mensagem para usuário;
3. mensagem técnica;
4. severidade;
5. ação recomendada;
6. se deve gerar log;
7. se deve gerar alerta;
8. se envolve dado sensível;
9. se permite nova tentativa.
```

Exemplo:

```txt
ERR-AGD-001
Mensagem ao usuário:
Não foi possível confirmar o agendamento porque o horário já foi ocupado.

Ação:
Atualize a agenda e escolha outro horário.
```

---

## 15.7 Política de mensagens

```txt
POLÍTICA DE MENSAGENS

Toda mensagem deve ser:
1. clara;
2. humana;
3. objetiva;
4. acessível;
5. sem jargão técnico;
6. sem expor dado sensível;
7. orientada à próxima ação.
```

---

## 15.8 Matriz de severidade

```txt
SEVERIDADE

SEV-1 — Crítico
Interrompe operação assistencial, causa risco ao paciente, perda de dados ou indisponibilidade ampla.

SEV-2 — Alto
Afeta módulo importante, financeiro, agenda, integrações ou muitos usuários.

SEV-3 — Médio
Afeta fluxo secundário ou possui contorno operacional.

SEV-4 — Baixo
Erro visual, texto, ajuste sem impacto operacional relevante.
```

---

## 15.9 Política de decisões irreversíveis

```txt
DECISÕES IRREVERSÍVEIS OU SENSÍVEIS

Exigem aprovação explícita:
1. excluir dados;
2. alterar estrutura do banco;
3. substituir integração;
4. mudar regra financeira;
5. mudar regra clínica/assistencial;
6. desativar tela legado;
7. alterar permissão;
8. alterar política de retenção;
9. remover relatório;
10. alterar cálculo.
```

---

## 15.10 Registro de evidências

Para cada tela migrada:

```txt
EVIDÊNCIAS

1. print da tela legada;
2. print da tela nova;
3. dossiê;
4. testes;
5. resultado de paridade;
6. aceite do usuário;
7. logs de homologação;
8. pendências conhecidas.
```

---

## 15.11 Glossário do domínio

Todo ERP legado tem termos próprios.

```txt
GLOSSÁRIO DO DOMÍNIO

O agente deve criar e manter um glossário com:
1. termos do negócio;
2. siglas;
3. nomes usados no legado;
4. nomes novos aprovados;
5. sinônimos;
6. termos proibidos;
7. traduções técnicas.
```

Isso ajuda muito na nomenclatura semântica.

---

## 15.12 Mapa de permissões por ação

Não só por tela.

```txt
MAPA DE PERMISSÕES

Para cada tela:
- visualizar;
- criar;
- editar;
- excluir;
- inativar;
- exportar;
- imprimir;
- aprovar;
- cancelar;
- reprocessar;
- visualizar dado sensível;
- alterar configuração;
- executar integração.
```

---

## 15.13 Contratos de dados

Para entrada/saída:

```txt
CONTRATOS DE DADOS

1. Request esperado
2. Response esperado
3. Campos obrigatórios
4. Tipos
5. Formatos
6. Valores permitidos
7. Erros possíveis
8. Compatibilidade com legado
```

---

## 15.14 Política anti-alucinação

Essa precisa entrar explicitamente.

```txt
POLÍTICA ANTI-ALUCINAÇÃO

O agente não pode inventar:
1. regras de negócio;
2. tabelas;
3. campos;
4. permissões;
5. integrações;
6. fluxos;
7. cálculos;
8. credenciais;
9. status;
10. comportamentos.

Quando não souber, deve marcar como:
A INVESTIGAR.

Quando houver hipótese, deve marcar como:
HIPÓTESE NÃO VALIDADA.

Quando houver evidência, deve citar origem:
arquivo, tela, query, comportamento observado ou validação humana.
```

---

## 15.15 Política de perguntas ao usuário

Como você não quer travar tudo com pergunta, o agente deve perguntar só quando necessário.

```txt
POLÍTICA DE PERGUNTAS

O agente deve investigar primeiro.

Só deve perguntar ao usuário quando:
1. houver risco de decisão errada;
2. houver ambiguidade crítica;
3. precisar de autorização;
4. precisar de validação operacional;
5. precisar confirmar mudança de regra;
6. precisar aprovar visual;
7. precisar aprovar implementação.

Perguntas devem ser objetivas e agrupadas.
```

---

## 15.16 Política de autorização

```txt
IMPLEMENTAÇÃO BLOQUEADA POR PADRÃO

O agente pode:
- investigar;
- documentar;
- propor;
- planejar;
- prototipar.

O agente não pode:
- implementar;
- alterar banco;
- alterar regra;
- substituir integração;
- remover funcionalidade;
- excluir dados;
- desativar legado.

Sem autorização explícita.
```

---

## 15.17 Política de microcommits

Para orientar a IDE:

```txt
MICROCOMMITS

Toda implementação deve ser quebrada em pequenas unidades:

1. estrutura base;
2. model adaptado;
3. query/listagem;
4. filtros;
5. validação;
6. formulário;
7. permissões;
8. feedbacks;
9. testes;
10. auditoria;
11. documentação.

Não implementar grandes blocos de uma vez.
```

---

## 15.18 Política de revisão antes de merge

```txt
REVISÃO OBRIGATÓRIA

Antes de merge:
1. testes passando;
2. linter passando;
3. checklist da tela completo;
4. design system respeitado;
5. acessibilidade revisada;
6. LGPD revisada;
7. segurança revisada;
8. paridade revisada;
9. rollback documentado.
```

---

## 15.19 Política de logs sem dados sensíveis

```txt
LOGS SEGUROS

Logs devem ajudar diagnóstico sem vazar dados sensíveis.

Evitar logar:
1. CPF completo;
2. documentos;
3. dados clínicos;
4. tokens;
5. senhas;
6. payload sensível completo;
7. dados de cartão;
8. anexos privados.
```

---

## 15.20 Política de ambientes

```txt
AMBIENTES

1. Local
2. Desenvolvimento
3. Homologação
4. Staging
5. Produção

Cada ambiente deve ter:
- secrets próprios;
- banco próprio;
- permissões próprias;
- logs próprios;
- configuração própria;
- restrição de dados sensíveis.
```

---

# 16. Estrutura de repositório recomendada

```txt
agente-de-migracao-legada/
  README.md
  LICENSE
  CONTRIBUTING.md
  CODE_OF_CONDUCT.md
  CHANGELOG.md

  docs/
    00-visao-geral/
      filosofia.md
      regra-mae.md
      glossario.md
      politica-anti-alucinacao.md

    01-comandos/
      comandos-oficiais.md
      migracao-ativar.md
      migracao-carregar-urls.md
      migracao-analisar-url.md
      migracao-proxima-tela.md
      migracao-autorizar-implementacao.md

    02-guardioes/
      guardiao-investigacao-legado.md
      guardiao-regras-negocio.md
      guardiao-banco-dados.md
      guardiao-integracoes.md
      guardiao-design.md
      guardiao-acessibilidade.md
      guardiao-lgpd-privacidade.md
      guardiao-seguranca.md
      guardiao-testes.md
      guardiao-feedbacks-ux.md
      guardiao-nomenclatura.md
      guardiao-documentacao.md
      guardiao-observabilidade.md
      guardiao-auditoria.md
      guardiao-deploy-rollback.md
      guardiao-performance.md
      guardiao-qualidade-dados.md
      guardiao-recuperacao-desastre.md
      guardiao-continuidade-operacional.md
      guardiao-resposta-incidentes.md
      guardiao-governanca-apis.md
      guardiao-arquivos-documentos.md
      guardiao-permissoes-acessos.md
      guardiao-operacao-usuario.md
      guardiao-convivencia-legado-novo.md
      guardiao-conciliacao-pos-migracao.md
      guardiao-configuracoes.md
      guardiao-segredos-credenciais.md
      guardiao-dependencias-licencas.md
      guardiao-dados-teste.md
      guardiao-seguranca-paciente.md
      guardiao-impressao-dispositivos.md
      guardiao-internacionalizacao.md
      guardiao-manutenibilidade.md
      guardiao-custos-complexidade.md
      guardiao-governanca-open-source.md

    03-protocolos/
      protocolo-microfases.md
      protocolo-esteira-urls.md
      protocolo-dossie-tela.md
      protocolo-prototipo-visual.md
      protocolo-plano-implementacao.md
      protocolo-revisao-paridade.md
      protocolo-homologacao.md
      protocolo-rollout.md

    04-templates/
      perfil-projeto.template.md
      backlog-urls.template.yaml
      dossie-tela.template.md
      mapa-banco.template.md
      mapa-integracoes.template.md
      mapa-permissoes.template.md
      checklist-paridade.template.md
      plano-implementacao.template.md
      registro-decisao.template.md
      historico-migracao.template.md
      inventario-componentes.template.md
      inventario-dados.template.md
      plano-disaster-recovery.template.md
      plano-continuidade-operacional.template.md

    05-perfis/
      generico/
        perfil.md

      laravel-vue-inertia/
        perfil.md
        arquitetura.md
        testes.md
        lint-formatacao.md
        seguranca.md
        design-system.md

      erp-hospitalar-laravel-vue-inertia/
        perfil.md
        direcao-visual.md
        politica-banco-legado.md
        lgpd.md
        acessibilidade.md
        operacao-hospitalar.md
```

---

# 17. Prompt inicial para passar à IDE/Claude Opus

Você pode usar isso como instrução principal:

```txt
Quero que você desenvolva um projeto open source chamado "Agente de Migração Legada".

O objetivo é criar um agente/documentação operacional para conduzir migrações de sistemas legados para stacks modernas de forma segura, auditável, incremental e orientada por microfases.

Todas as nomenclaturas do agente devem estar em português do Brasil.

O agente não deve ser apenas um gerador de código. Ele deve investigar, documentar, extrair regras de negócio, mapear banco, mapear integrações, propor design, avaliar acessibilidade, LGPD, segurança, testes, rollback, disaster recovery, continuidade operacional e só implementar após autorização explícita.

O núcleo do agente deve ser genérico e reutilizável por outros desenvolvedores. Perfis específicos de tecnologia/projeto devem ficar separados.

Crie a estrutura de arquivos, documentos, templates, comandos e guardiões conforme o plano consolidado.

Prioridades:
1. Clareza extrema;
2. Robustez;
3. Microfases;
4. Anti-alucinação;
5. Segurança;
6. Documentação viva;
7. Reutilização open source;
8. Perfis configuráveis;
9. PT-BR em toda nomenclatura do agente.

Não implemente nada de forma superficial. Estruture como um framework de migração profissional.
```

---

# 18. Minha análise final: ainda falta algo?

Neste ponto, o que mais faltava já foi incluído. Mas eu adicionaria estes últimos refinamentos para deixar o agente ainda mais maduro:

```txt
1. Política anti-alucinação;
2. Matriz bug legado x regra de negócio;
3. Definição de pronto;
4. Modo sombra;
5. Catálogo de erros;
6. Matriz de severidade;
7. Registro de evidências;
8. Glossário do domínio;
9. Contratos de dados;
10. Política de perguntas;
11. Política de autorização;
12. Política de microcommits;
13. Política de revisão antes de merge;
14. Logs seguros;
15. Política de ambientes;
16. Governança open source;
17. Guardião de custos e complexidade.
```

Com isso, o agente fica muito mais forte do que um simples prompt de migração.

Ele vira um **sistema de governança para modernização de legados**.


---


- na hora da migração, tudo que for migrado tambem deverá ser em pt-br, inclusive os comentários, documentação, tudo.
- O código Laravel do ERP terá nomes em inglês ou português? pt-br
- tanto agente, quando código, quanto tudo, em pt br
- nome estrutural do agente: Agente de Migração Legada
- se lembra que comentei sobre uma lista de urls? então, provavelmente um humano irá esquecer de alguma url para colocar na migração, existe a possibilidade do agente montar esta lista formatada e indentada por hierarquia de botao e tema, exemplo visual:
operacional
        nucleo gestor
        ti
                usuarios
                pessoa fisica
deu para entender?
- uma fase só é concluída quando o agente diz, com isso finalizamos 100% esta fase, e oriente exatamente o que deve ser feito a partir disso
- deverá assim como teremos uma página para o guia de design, teremos uma página para stack e tudo que seja relevante para os designer, devs, devOps e tudo mais, essa página será uma super documentação robusta que somente e exclusivamente o time de dev terá acesso a 7 chaves, kkkk e elas terao permissao pode cargos, exempo, dev só vê coisas do dev, devOps só de devOps e assim por diante, é como se pedisse um login unico para acessar essa página, nao sei, vamos pesar em algo no padrao da industria.
- quando for usar o sistema de permissao por páginas tem que estudar a estrutura do projeeto, poor exemplo, no nosso erp a permissao é dada pelo sistema e vai um check no BD então o usuario passa a ter acesso aquela página, como eu já estava migrando eu criei um url_erp_laravel para poder ir permissionando no erp laravel novo que eu estava fazendo sem tirar as permissoes do antigo, entao é ter este cuidado de nao ir parando o funcionamento do antigo, ele deve funcionar até o novo estar 100% pronto para produção, entende?
- outra coisa, absolutamente tudo deve ter mascaras, exemplo, R$ 1.000.350,00, 10/08/2026, 08:25, esse tipo de coisa,
- os padroes de textos sempre devem ter suporte a caracteres especiais e acentuações tipo: ç á e outros...
- quando for criar a documentação para o github, quero que seja o mais claro possivel e simples na hora de dizer para que serve o agente e como começar a usar ele de for simples e direta, exemplo, inicie o agente e peça para ele começar a migração, todo o resto fluira automaticamente, apenas dependendo de suas validações e permissoes para continuar
- na página de design, absolutamente todos os elementos, funções, tudo que estiver lá deverá ter um id unico para facilitar a ia quando for usa-lo mais tarde
- na hora da investigação do perfil de design quero que pergunte tudo, por exemplo quer com micro animações ou sem? que com borda pontuda ou boleada, quanto de boleado? moderno, classico ou moderno conservador? esses tipos de perguntas para poder guiar a criação.
- quero que toda questão de cor, tipografia e tudo relacionado ao design seja facilmente ajustável e de forma sistema, exemplo eu entro no sistema e quero mudar a cor do site todo para rosa, eu só mudo a cor em um lugar no proprio sistema e ele já refletirá em tudo e isso quero que seja para cor, fontes, tudo que for legal mudar assim para customização, porque as vezes temos um outubro rosa e queremos entrar no clima, entende?
- 10. Comandos oficiais em PT-BR: na documentação do git hub quero que ensine de forma simples quando e como usar esses comandos
- 15.2 Matriz de decisão: bug legado ou regra? deve apresentar para o dev, em um breve resumo para facilitar a leitura e decisao do dev na hora de responder
- sempre inserir tooltips semanticos e no padrão do sistema
- sempre incluir descrições simple e amigáveis seguindo o padrao da industria, e para o usuario entender para que serve
- sempre incluir tutorial guiado e a possibilidade de pular o tutorial
- de alguma forma o agente deve funcionar como um guardiao de padronização do sistema, exemplo depois de tudo migrado e estar tudo certinho, vai que os devs começem a estragar tudo denovo fazendo de qualquer jeito, este agente analisa o projeto, talvez os commits, ou o repositório, nao sei, mas ele analisará e irá exportar um relatório, olha isso aqui é novo e precisa ser scaneado para padronização de ... e entao o dev liberar e o agente faz o trabalho dele, entende?

- uma página pública de FAQ, guia do usuário para entender o sistema, com fluxo de trabalho e importancia, toda aquela questão de treinamentos para educar o usuaria, deverá ser implementada de forma extensiva para estar ensinando ao usuaria a usar o sistema e isso é para o funcionamento de tudo, cada fluxo, exemplo, pra fazer isso, voce vai aqui, clica ali e o resultado é esse, entende?
- questão de segurança deve ser prioridade máxima em proteger dados sensiveis, nao vazar senhas, tokens e etc... temos que nos proteger de hacks mal intencionados
- 15.20 Política de ambientes: este é o correto, o que voce disse, mas pergunte para o dev, porque que nem no nosso caso, temos apenas o banco de produção, e mais nada, talvez um ambiente local, homologação e produção, mas como seria para alimentar esses dados, já que os nossos dados são gigantes e ficaria dificil, nao sei, vamos analisar uma forma segura de fazer isso sem afetar o ambiente de produção diretamente, foi só um comentário meu
- 18. Minha análise final: ainda falta algo? poed adicionar o que sugeriu e analise as coisas que falei acima, para continuarmos aprimorando esse planejamento


---



Perfeito. Agora o planejamento ficou muito mais maduro.

A partir do que você trouxe, eu atualizaria a visão do projeto assim:

> O **Agente de Migração Legada** não será apenas um agente para migrar sistemas antigos. Ele será um **guardião permanente de modernização, padronização, documentação, segurança, design, permissões, UX, acessibilidade, LGPD e governança contínua do sistema**.

E decisão fechada:

```txt
Tudo em PT-BR:
- agente;
- comandos;
- documentação;
- comentários;
- código;
- classes;
- funções;
- variáveis;
- constantes;
- componentes;
- rotas;
- mensagens;
- tooltips;
- guias;
- manuais;
- páginas internas;
- documentação do GitHub;
- documentação técnica;
- documentação pública.
```

---

# 1. Decisão permanente: tudo em PT-BR

```txt
DECISÃO PERMANENTE — IDIOMA TOTAL DO PROJETO

O Agente de Migração Legada deve operar 100% em português do Brasil.

Todo código gerado para o projeto migrado também deve seguir nomenclatura em português do Brasil, incluindo:

1. variáveis;
2. classes;
3. funções;
4. métodos;
5. constantes;
6. componentes;
7. rotas;
8. arquivos;
9. pastas;
10. comentários;
11. documentação técnica;
12. documentação de usuário;
13. mensagens;
14. tooltips;
15. textos de interface;
16. testes;
17. seeders;
18. factories;
19. policies;
20. services;
21. actions;
22. requests;
23. resources.

Regra:
Não misturar inglês e português sem justificativa técnica inevitável.
```

Exceções aceitáveis:

```txt
1. nomes obrigatórios do framework;
2. métodos herdados do Laravel;
3. contratos de bibliotecas externas;
4. APIs de terceiros;
5. termos técnicos inevitáveis já padronizados.
```

Exemplo:

```php
class CriarAgendamentoPacienteAction
{
    public function executar(array $dadosDoAgendamento): Agendamento
    {
        //
    }
}
```

Em vez de:

```php
class CreatePatientAppointmentAction
{
    public function handle(array $appointmentData): Appointment
    {
        //
    }
}
```

---

# 2. Nome estrutural confirmado

```txt
Nome oficial:
Agente de Migração Legada
```

Perfil específico do seu caso:

```txt
Perfil:
ERP Hospitalar Laravel Vue Inertia
```

Estrutura conceitual:

```txt
Agente de Migração Legada
  ├── Núcleo genérico
  ├── Perfis de tecnologia
  └── Perfis de projeto
```

---

# 3. Descoberta automática de URLs e hierarquia

Você trouxe um ponto excelente.

Sim, o agente deve conseguir montar uma lista de URLs automaticamente, porque um humano pode esquecer telas, botões, submenus, páginas escondidas e fluxos secundários.

Então teremos dois modos:

```txt
1. Modo lista manual
2. Modo descoberta automática
```

## Regra nova

```txt
REGRA PERMANENTE — DESCOBERTA DE TELAS E HIERARQUIA

O agente não deve depender apenas de URLs informadas manualmente pelo usuário.

Sempre que possível, ele deve investigar o sistema legado e montar automaticamente um mapa hierárquico de navegação, considerando:

1. menus principais;
2. submenus;
3. botões;
4. links internos;
5. abas;
6. modais;
7. telas acessadas por ações;
8. páginas sem menu direto;
9. páginas chamadas por parâmetros;
10. páginas administrativas;
11. páginas de relatório;
12. páginas de impressão;
13. páginas de exportação;
14. páginas de configuração;
15. páginas de integração;
16. rotas AJAX;
17. endpoints internos;
18. fluxos escondidos em botões.
```

## Exemplo de hierarquia desejada

```txt
Operacional
  Núcleo Gestor
    TI
      Usuários
      Pessoa Física
      Perfis de Acesso
      Permissões
    Atendimento
      Agenda
      Recepção
      Triagem
    Financeiro
      Contas a Receber
      Contas a Pagar
      Faturamento
```

## Como o agente deve montar isso

Ele deve investigar:

```txt
1. HTML dos menus;
2. links internos;
3. botões com navegação;
4. formulários;
5. ações JavaScript;
6. arquivos do legado;
7. includes de menu;
8. permissões no banco;
9. rotas registradas no Laravel novo, se já houver;
10. coluna como url_erp_laravel, se existir;
11. registros de permissão;
12. logs de acesso, se existirem.
```

## Arquivo gerado

```txt
/docs/migracao/mapa-hierarquico-legado.md
/docs/migracao/backlog-telas.yaml
```

Exemplo em YAML:

```yaml
mapa_hierarquico:
  - titulo: "Operacional"
    id: "MENU-OPERACIONAL"
    filhos:
      - titulo: "Núcleo Gestor"
        id: "MENU-NUCLEO-GESTOR"
        filhos:
          - titulo: "TI"
            id: "MENU-TI"
            filhos:
              - titulo: "Usuários"
                id: "TELA-USUARIOS"
                url_legado: "/operacional/nucleo-gestor/ti/usuarios"
                url_erp_laravel: "/erp/ti/usuarios"
                status: "a_investigar"
              - titulo: "Pessoa Física"
                id: "TELA-PESSOA-FISICA"
                url_legado: "/operacional/nucleo-gestor/ti/pessoa-fisica"
                url_erp_laravel: "/erp/ti/pessoa-fisica"
                status: "a_investigar"
```

## Regra importante

```txt
A lista manual de URLs é uma ajuda, não a fonte única.

O agente deve comparar:
1. URLs informadas pelo usuário;
2. URLs encontradas no menu;
3. URLs encontradas em botões;
4. URLs encontradas no código;
5. URLs encontradas no banco de permissões;
6. URLs existentes no Laravel novo.

Depois deve gerar uma lista de possíveis telas esquecidas.
```

---

# 4. Fase só termina com declaração formal de 100%

Excelente regra.

O agente deve parar e declarar claramente quando uma fase terminou.

## Regra nova

```txt
REGRA PERMANENTE — ENCERRAMENTO FORMAL DE FASE

Nenhuma fase pode ser considerada concluída implicitamente.

Ao terminar uma fase, o agente deve declarar:

"Com isso, finalizamos 100% a Fase X — [nome da fase]."

Depois deve informar:

1. o que foi concluído;
2. quais arquivos foram criados ou atualizados;
3. quais decisões foram registradas;
4. quais pendências existem, se houver;
5. quais riscos foram identificados;
6. o que deve ser feito agora;
7. qual é a próxima fase;
8. se precisa de autorização humana para avançar.
```

Exemplo:

```txt
Com isso, finalizamos 100% a Fase 4 — Investigação da Tela.

Resumo:
- tela analisada;
- regras documentadas;
- banco mapeado;
- permissões identificadas;
- integrações encontradas;
- riscos registrados.

Próximo passo:
revisar o dossiê funcional e autorizar a criação do protótipo visual.

Comando sugerido:
/migracao-propor-interface TELA-USUARIOS
```

---

# 5. Super documentação interna protegida

Você quer uma página para design, mas também uma página maior para stack, padrões, devs, DevOps, segurança, etc.

Isso é excelente.

Eu criaria duas áreas diferentes:

```txt
1. Central Pública de Ajuda
2. Central Interna de Governança Técnica
```

## 5.1 Central Pública de Ajuda

Para usuários finais.

Conteúdo:

```txt
- FAQ;
- guias de uso;
- tutoriais;
- fluxo de trabalho;
- explicações simples;
- vídeos ou imagens, se houver;
- passo a passo;
- ajuda por módulo;
- glossário amigável;
- perguntas frequentes;
- onboarding.
```

## 5.2 Central Interna de Governança Técnica

Para time técnico.

Nome sugerido:

```txt
Central de Governança Técnica
```

Ou:

```txt
Painel Interno de Padrões do Sistema
```

Conteúdo:

```txt
1. Guia de design;
2. Design system;
3. tokens visuais;
4. stack;
5. arquitetura;
6. banco;
7. permissões;
8. integrações;
9. DevOps;
10. deploy;
11. rollback;
12. disaster recovery;
13. LGPD;
14. segurança;
15. auditoria;
16. observabilidade;
17. padrões de código;
18. padrões de nomenclatura;
19. padrões de testes;
20. documentação de APIs;
21. documentação de filas;
22. documentação de jobs;
23. mapa de módulos;
24. mapa de componentes;
25. mapa de rotas;
26. decisões arquiteturais;
27. histórico de mudanças;
28. relatórios do agente.
```

## Regra de acesso

```txt
REGRA PERMANENTE — CENTRAL INTERNA PROTEGIDA

A Central de Governança Técnica deve ser privada, protegida por autenticação, autorização granular e permissões por cargo.

Nenhum usuário comum deve acessar documentação técnica, segredos, arquitetura interna, mapas sensíveis, permissões, integrações, rotas administrativas, chaves, logs ou informações de infraestrutura.
```

## Permissões por perfil

Exemplo:

```txt
Desenvolvedor:
- vê arquitetura;
- vê componentes;
- vê padrões de código;
- vê design system;
- vê testes;
- não vê secrets reais;
- não vê configurações críticas de produção.

DevOps:
- vê deploy;
- vê ambientes;
- vê filas;
- vê logs técnicos;
- vê disaster recovery;
- vê observabilidade;
- não vê dados sensíveis de pacientes.

Designer:
- vê design system;
- vê tokens;
- vê componentes visuais;
- vê acessibilidade visual;
- não vê banco;
- não vê integrações sensíveis.

Segurança:
- vê auditoria;
- vê LGPD;
- vê permissões;
- vê riscos;
- vê logs de segurança;
- vê relatórios de vulnerabilidade.

Administrador técnico:
- vê tudo, exceto secrets em texto puro.

Usuário final:
- não vê a central interna.
```

## Sobre “login único”

O padrão ideal:

```txt
1. autenticação normal do ERP;
2. permissões por cargo;
3. RBAC;
4. opcionalmente MFA para acesso técnico;
5. trilha de auditoria para acesso à central;
6. logs de quem acessou documentação sensível.
```

Regra:

```txt
A Central Interna de Governança Técnica deve ser tratada como área sensível do sistema.
```

---

# 6. Cuidado com permissões do legado e `url_erp_laravel`

Você explicou algo muito importante: no seu ERP, a permissão é dada pelo sistema, com check no banco, e você criou `url_erp_laravel` para permissionar o novo sem tirar permissões do antigo.

Isso deve virar regra permanente.

```txt
REGRA PERMANENTE — CONVIVÊNCIA DE PERMISSÕES LEGADO/NOVO

Durante a migração, o sistema legado deve continuar funcionando normalmente até o novo estar 100% pronto para produção.

O agente não pode remover, sobrescrever, desativar ou quebrar permissões do legado.

Quando existir uma coluna, tabela ou estrutura como `url_erp_laravel`, ela deve ser tratada como camada paralela de permissão para o novo ERP Laravel.

O agente deve estudar a estrutura real de permissões do projeto antes de propor qualquer mudança.
```

## O agente deve mapear

```txt
1. como o legado valida permissão;
2. quais tabelas guardam permissões;
3. quais colunas controlam URL;
4. qual é a URL antiga;
5. qual é a URL nova;
6. se existe `url_erp_laravel`;
7. se a permissão é por usuário, perfil, cargo, grupo ou módulo;
8. se a permissão controla tela, botão, ação ou campo;
9. se existe cache de permissões;
10. se existem permissões herdadas.
```

## Regra de coexistência

```txt
O novo sistema deve usar permissões paralelas quando necessário, sem interromper o acesso ao legado.

A migração de permissões deve ser incremental, rastreável e reversível.
```

---

# 7. Máscaras, formatação e localização

Outro ponto excelente.

Tudo que for dado formatável precisa ter padrão.

```txt
REGRA PERMANENTE — MÁSCARAS E FORMATAÇÃO PT-BR

Todo dado exibido, digitado, exportado ou impresso deve seguir máscara, formatação e localização adequadas ao português do Brasil.
```

## Exemplos obrigatórios

```txt
Moeda:
R$ 1.000.350,00

Data:
10/08/2026

Hora:
08:25

Data e hora:
10/08/2026 08:25

CPF:
000.000.000-00

CNPJ:
00.000.000/0000-00

CEP:
00000-000

Telefone:
(22) 99999-9999

Percentual:
15,50%

Número decimal:
1.234,56

Peso:
72,5 kg

Medidas:
1,75 m
```

## Regra

```txt
Não exibir dados brutos ao usuário quando houver padrão de formatação esperado.
```

## Também deve valer para

```txt
1. tabelas;
2. formulários;
3. relatórios;
4. PDFs;
5. exports;
6. prints;
7. tooltips;
8. mensagens;
9. logs operacionais;
10. guias de usuário.
```

---

# 8. Suporte completo a acentuação e caracteres especiais

```txt
REGRA PERMANENTE — ACENTUAÇÃO E CARACTERES ESPECIAIS

Todo o sistema deve suportar corretamente caracteres especiais e acentuação do português do Brasil, incluindo:

1. ç;
2. á;
3. à;
4. â;
5. ã;
6. é;
7. ê;
8. í;
9. ó;
10. ô;
11. õ;
12. ú;
13. ü;
14. letras maiúsculas acentuadas;
15. nomes próprios;
16. caracteres especiais comuns em endereços, documentos e descrições.
```

## O agente deve verificar

```txt
1. charset UTF-8;
2. collation do banco;
3. encoding de arquivos;
4. exports CSV;
5. PDFs;
6. e-mails;
7. WhatsApp;
8. APIs;
9. logs;
10. imports.
```

Regra:

```txt
Nenhuma migração deve quebrar textos acentuados existentes no legado.
```

---

# 9. Documentação do GitHub simples e clara

Você quer algo simples para começar. Perfeito.

O README precisa ser muito direto.

## Primeira seção do README

```md
# Agente de Migração Legada

O Agente de Migração Legada ajuda desenvolvedores a modernizar sistemas legados com segurança, documentação, testes, padronização e controle por fases.

Ele não migra tudo automaticamente sem supervisão.

Ele investiga o sistema legado, cria documentação, identifica regras de negócio, mapeia banco, permissões, integrações, riscos, propõe melhorias e só implementa quando você autoriza.

## Como começar

1. Instale ou copie este agente no seu projeto.
2. Inicie o agente com:

/migracao-ativar

3. Informe a URL inicial do sistema legado ou peça para o agente descobrir as telas.
4. O agente irá conduzir a migração por etapas.
5. Você só precisa validar decisões e autorizar avanços quando solicitado.
```

## Explicação simples

```md
## Para que serve?

Serve para migrar sistemas antigos para uma estrutura moderna sem perder regras de negócio, permissões, integrações, dados, segurança e padrões visuais.

## Como funciona?

O agente trabalha em microfases:

1. investiga;
2. documenta;
3. propõe;
4. planeja;
5. pede autorização;
6. implementa;
7. testa;
8. revisa;
9. homologa.

## Ele codifica sozinho?

Não por padrão.

A implementação só acontece depois de autorização explícita.
```

---

# 10. IDs únicos na página de design

Regra confirmada e fortalecida.

```txt
REGRA PERMANENTE — IDS ÚNICOS DE DESIGN

Todos os elementos da Página Visual devem possuir ID único, estável e semântico.

Isso inclui:
1. cores;
2. fontes;
3. espaçamentos;
4. botões;
5. inputs;
6. tabelas;
7. modais;
8. tooltips;
9. ícones;
10. cards;
11. estados;
12. animações;
13. layouts;
14. componentes;
15. variações;
16. tokens;
17. funções de interface;
18. padrões de UX.
```

Exemplo:

```txt
COR-PRIMARIA-001
COR-SUCESSO-001
TIPOGRAFIA-TITULO-PAGINA-001
BOTAO-PRIMARIO-001
BOTAO-DESTRUTIVO-001
INPUT-TEXTO-001
TABELA-PADRAO-001
MODAL-CONFIRMACAO-001
TOOLTIP-AJUDA-001
ESTADO-CARREGANDO-001
ESTADO-VAZIO-001
ANIMACAO-ENTRADA-SUAVE-001
```

Regra:

```txt
O agente deve sempre referenciar componentes pelo ID quando for reutilizar ou alterar algo.
```

---

# 11. Investigação do perfil de design

Antes de criar a página visual, o agente deve entrevistar o responsável.

```txt
REGRA PERMANENTE — ENTREVISTA DE DESIGN

Antes de criar a Página Visual base, o agente deve conduzir uma entrevista de design completa para entender direção visual, experiência, acessibilidade, marca, operação e preferências de customização.
```

## Perguntas obrigatórias

```txt
1. O sistema deve parecer mais moderno, clássico ou moderno conservador?
2. O público usa o sistema por muitas horas seguidas?
3. O visual deve ser mais denso ou mais espaçado?
4. Cantos retos, levemente arredondados ou muito arredondados?
5. Qual nível de arredondamento desejado?
6. Deve ter micro animações?
7. Se sim, discretas ou perceptíveis?
8. Deve haver modo reduzido de animação?
9. Ícones com traçado ou preenchidos?
10. Ícones sempre acompanhados de texto?
11. O sistema deve transmitir mais seriedade, acolhimento, velocidade ou sofisticação?
12. Cores mais frias, quentes ou neutras?
13. Deve haver tema sazonal, como Outubro Rosa?
14. O usuário poderá customizar cores pelo sistema?
15. O usuário poderá customizar fonte?
16. O sistema terá alto contraste?
17. O sistema terá ajuste de tamanho de fonte?
18. O sistema terá dark mode?
19. O sistema terá light mode?
20. O sistema respeitará preferência do sistema operacional?
21. Layout com sidebar fixa ou recolhível?
22. Header fixo ou não?
23. Tabelas mais compactas ou confortáveis?
24. Botões grandes ou moderados?
25. Feedback por toast, alerta inline ou ambos?
26. Fluxos terão tutorial guiado?
27. Usuário pode pular tutorial?
28. O sistema terá ajuda contextual?
29. O sistema terá tooltips?
30. O sistema será usado em desktop, tablet, celular ou todos?
```

---

# 12. Customização centralizada de tema

Esse ponto é muito importante e muito bom.

Você quer mudar uma cor em um lugar e refletir no sistema inteiro.

Isso deve virar uma funcionalidade estrutural.

```txt
REGRA PERMANENTE — CUSTOMIZAÇÃO CENTRALIZADA DO DESIGN

Toda cor, fonte, espaçamento, borda, sombra, raio, densidade, animação e preferência visual deve ser controlada por tokens centralizados.

Nenhuma tela deve usar valores visuais fixos e isolados sem passar pelo sistema de tokens.
```

## O sistema deve permitir

```txt
1. alterar cor primária;
2. alterar cor secundária;
3. alterar cor de destaque;
4. alterar fonte;
5. alterar tamanho base da fonte;
6. alterar arredondamento;
7. alterar densidade da interface;
8. ativar tema sazonal;
9. ativar Outubro Rosa;
10. ativar Novembro Azul;
11. ativar alto contraste;
12. ativar dark mode;
13. ativar light mode;
14. ativar modo automático;
15. reduzir animações.
```

## Exemplo de conceito

```txt
Painel de Aparência
  - Cor primária
  - Cor secundária
  - Fonte principal
  - Raio de borda
  - Densidade
  - Tema ativo
  - Alto contraste
  - Modo escuro
```

## Regra

```txt
A customização deve ser sistêmica, não manual por tela.
```

## Cuidado

Nem todo usuário deve poder mexer nisso.

```txt
Permissão necessária:
configurar_aparencia_sistema
```

E toda alteração deve ser auditada:

```txt
Usuário X alterou cor primária de #0057A8 para #D63384 em 01/10/2026 08:00.
```

---

# 13. Comandos oficiais explicados no GitHub

Cada comando deve ter:

```txt
1. nome;
2. quando usar;
3. o que ele faz;
4. o que ele não faz;
5. exemplo;
6. próximo passo esperado.
```

Exemplo:

```md
## /migracao-ativar

Use este comando para iniciar o agente no projeto.

### Quando usar

Use no início da migração ou quando quiser retomar o fluxo principal.

### O que faz

- carrega as regras do agente;
- identifica o perfil do projeto;
- verifica documentos existentes;
- mostra o próximo passo recomendado.

### O que não faz

- não implementa código;
- não altera banco;
- não remove permissões.

### Exemplo

/migracao-ativar
```

---

# 14. Matriz bug legado x regra com resumo para dev

Você quer facilitar a decisão do dev. Perfeito.

O agente deve mostrar um resumo curto antes de pedir decisão.

## Exemplo

```txt
COMPORTAMENTO ENCONTRADO

Na tela de Agendamento, o sistema permite salvar consulta sem telefone do paciente.

Possíveis interpretações:
1. Pode ser uma regra antiga para permitir cadastro rápido.
2. Pode ser um bug por falta de validação.
3. Pode ser necessário em casos de emergência.

Impacto se alterarmos:
- usuários podem ser impedidos de salvar agendamentos incompletos;
- relatórios podem melhorar;
- fluxo operacional pode ficar mais lento.

Pergunta para decisão:
Deseja manter esse comportamento no novo sistema ou transformar telefone em campo obrigatório?
```

## Regra

```txt
O agente deve explicar em linguagem simples o impacto da decisão antes de pedir resposta.
```

---

# 15. Tooltips semânticos e padronizados

```txt
REGRA PERMANENTE — TOOLTIPS SEMÂNTICOS

Todo campo, botão, ação ou informação que possa gerar dúvida deve possuir tooltip semântico, acessível e padronizado.

Tooltips devem:
1. explicar para que serve;
2. ser curtos;
3. usar linguagem amigável;
4. não substituir label;
5. ser acessíveis por teclado;
6. funcionar com leitor de tela quando necessário;
7. seguir o padrão visual do sistema.
```

Exemplo:

```txt
Campo: Convênio
Tooltip:
Selecione o convênio que será usado neste atendimento.
```

---

# 16. Descrições simples e amigáveis

```txt
REGRA PERMANENTE — DESCRIÇÕES AMIGÁVEIS

Telas, módulos, campos e ações devem possuir descrições simples e amigáveis, explicando sua finalidade de forma clara para o usuário.
```

Exemplo:

```txt
Usuários
Gerencie as pessoas que podem acessar o sistema e suas permissões.
```

Em vez de:

```txt
CRUD de usuários.
```

---

# 17. Tutorial guiado com opção de pular

Excelente.

```txt
REGRA PERMANENTE — TUTORIAL GUIADO

Fluxos importantes devem possuir tutorial guiado, com opção de pular, rever depois e não mostrar novamente.
```

## Deve existir

```txt
1. tutorial por módulo;
2. tutorial por fluxo crítico;
3. tutorial para primeira visita;
4. botão “Pular tutorial”;
5. botão “Ver novamente”;
6. registro de tutorial concluído por usuário;
7. conteúdo simples e amigável;
8. acessibilidade no tutorial.
```

## Exemplo

```txt
Bem-vindo ao módulo de Agendamento.

Aqui você pode visualizar horários, cadastrar consultas, cancelar atendimentos e enviar confirmações aos pacientes.

[Começar tutorial] [Pular]
```

---

# 18. Agente como guardião contínuo de padronização

Esse é um dos pontos mais importantes que você trouxe.

O agente não deve morrer depois da migração.

Ele deve continuar analisando o projeto.

## Novo modo

```txt
Modo Guardião Contínuo
```

## Função

```txt
Após a migração, o agente deve continuar atuando como guardião de padronização, analisando alterações, commits, novos arquivos, novos componentes, novas rotas, novas telas e novos padrões introduzidos no sistema.
```

## Ele deve detectar

```txt
1. componente novo não documentado;
2. rota nova sem permissão;
3. tela nova sem dossiê;
4. campo novo sem tooltip;
5. texto sem padrão;
6. cor hardcoded;
7. classe fora do padrão;
8. função com nome genérico;
9. variável semântica ruim;
10. falta de teste;
11. falta de acessibilidade;
12. falta de auditoria;
13. falta de máscara;
14. falta de LGPD;
15. API nova sem governança;
16. integração nova sem inventário;
17. pacote novo sem justificativa;
18. alteração de permissão sem registro;
19. alteração de design sem atualizar Página Visual.
```

## Fluxo

```txt
1. agente analisa repositório ou commits;
2. gera relatório;
3. aponta violações;
4. classifica severidade;
5. sugere correções;
6. pede autorização;
7. aplica correções se autorizado;
8. atualiza documentação.
```

## Comando sugerido

```txt
/migracao-auditar-padroes
```

Ou:

```txt
/guardiao-analisar
```

## Relatório exemplo

```txt
Relatório do Guardião de Padronização

Foram encontrados 7 pontos de atenção:

1. Novo componente BotaoExportar.vue não está documentado na Página Visual.
2. Rota /financeiro/exportar não possui permissão mapeada.
3. Campo valor_total não possui máscara monetária.
4. Cor #ff0000 foi usada diretamente no componente.
5. Função processarDados() possui nome genérico.
6. Nova chamada de API não está no Inventário de Integrações.
7. Tela nova não possui tutorial guiado.

Recomendação:
corrigir antes do merge.
```

## Regra

```txt
O agente deve atuar antes, durante e depois da migração como guardião de qualidade contínua.
```

---

# 19. Central pública de FAQ e guia do usuário

Sim, deve existir de forma extensiva.

```txt
REGRA PERMANENTE — CENTRAL PÚBLICA DE AJUDA

O sistema deve possuir uma área pública ou interna de ajuda para orientar usuários sobre o uso do sistema, fluxos de trabalho, importância das ações, perguntas frequentes e tutoriais.
```

## Conteúdo

```txt
1. FAQ;
2. guia por módulo;
3. tutorial por fluxo;
4. passo a passo;
5. vídeos/imagens se houver;
6. glossário;
7. boas práticas de uso;
8. dúvidas frequentes;
9. explicação de permissões;
10. explicação de erros comuns;
11. treinamentos;
12. novidades;
13. changelog amigável;
14. botão de ajuda em cada tela.
```

## Exemplo de guia

```txt
Como cadastrar um paciente

1. Acesse o menu Operacional > Atendimento > Pacientes.
2. Clique em Novo Paciente.
3. Preencha os dados obrigatórios.
4. Confira CPF, telefone e data de nascimento.
5. Clique em Salvar.
6. Após salvar, o paciente ficará disponível para agendamentos.

Resultado esperado:
o paciente será cadastrado e poderá ser vinculado a consultas, convênios e atendimentos.
```

## Regra

```txt
Toda funcionalidade importante deve ter documentação de uso simples e acessível.
```

---

# 20. Segurança como prioridade máxima

Reforçando:

```txt
REGRA PERMANENTE — SEGURANÇA MÁXIMA

Segurança é prioridade máxima no Agente de Migração Legada.

O agente deve proteger:
1. senhas;
2. tokens;
3. chaves de API;
4. dados sensíveis;
5. dados pessoais;
6. dados de saúde;
7. permissões;
8. logs;
9. arquivos;
10. integrações;
11. banco;
12. sessões;
13. backups;
14. ambientes;
15. documentação interna.
```

## Proibições

```txt
É proibido:
1. salvar senha em código;
2. exibir token em log;
3. colocar credencial em documentação;
4. usar dados reais sensíveis em ambiente inseguro;
5. expor stack trace ao usuário;
6. criar rota sem autorização;
7. deixar arquivo sensível público;
8. exportar dados sem permissão;
9. ignorar validação server-side;
10. usar permissões genéricas demais.
```

---

# 21. Política de ambientes com banco de produção existente

Você fez uma observação muito realista: no mundo ideal existem local, dev, homologação, staging e produção. Mas na prática, muitas empresas têm só produção.

Então o agente precisa perguntar e adaptar.

## Regra nova

```txt
REGRA PERMANENTE — AMBIENTES REAIS DO PROJETO

O agente não deve presumir que o projeto possui todos os ambientes ideais.

Antes de definir a estratégia, deve perguntar e documentar:

1. existe ambiente local?
2. existe desenvolvimento?
3. existe homologação?
4. existe staging?
5. existe produção?
6. existe apenas banco de produção?
7. o banco é muito grande?
8. pode clonar dados?
9. pode anonimizar dados?
10. existe backup?
11. existe janela de manutenção?
12. existe equipe de infraestrutura?
13. existe restrição legal para cópia de dados?
```

## Para caso como o seu

Estratégia possível:

```txt
1. nunca desenvolver diretamente contra produção sem camada de proteção;
2. criar ambiente local com schema reduzido;
3. usar subset anonimizado quando possível;
4. usar dados sintéticos para testes;
5. criar conexão somente leitura para investigação;
6. bloquear escrita durante análise;
7. usar feature flags;
8. usar homologação com dados reduzidos;
9. criar rotina de anonimização;
10. documentar riscos se só houver produção.
```

## Regra importante

```txt
Se só existir banco de produção, o agente deve operar em modo conservador, com leitura controlada e escrita bloqueada até autorização explícita e estratégia segura.
```

---

# 22. Consolidação do que você adicionou agora

Esses itens entram oficialmente no planejamento:

```txt
1. Todo agente e todo código em PT-BR.
2. Nome oficial: Agente de Migração Legada.
3. Descoberta automática de URLs e hierarquia.
4. Mapa hierárquico por tema, menu, botão e tela.
5. Encerramento formal de fase com “100% concluída”.
6. Central Interna de Governança Técnica.
7. Central Pública de Ajuda e Treinamento.
8. Permissões por cargo na documentação interna.
9. Cuidado com coexistência das permissões legado/novo.
10. Suporte a `url_erp_laravel`.
11. Máscaras obrigatórias.
12. Formatação PT-BR obrigatória.
13. Suporte total a acentuação.
14. README do GitHub simples e direto.
15. IDs únicos para tudo no design system.
16. Entrevista completa de perfil de design.
17. Customização visual centralizada por tokens.
18. Documentação dos comandos no GitHub.
19. Matriz bug legado x regra explicada ao dev.
20. Tooltips semânticos.
21. Descrições amigáveis.
22. Tutorial guiado com opção de pular.
23. Agente como guardião contínuo pós-migração.
24. FAQ e guias de usuário extensivos.
25. Segurança máxima contra vazamento e ataques.
26. Estratégia realista para ambientes e banco de produção.
```

---

# 23. Novos guardiões que eu adicionaria por causa dessa rodada

Além dos anteriores, eu adicionaria:

```txt
1. Guardião de Descoberta de Telas
2. Guardião de Encerramento de Fases
3. Guardião de Central Técnica Interna
4. Guardião de Ajuda e Treinamento
5. Guardião de Máscaras e Localização
6. Guardião de Customização Visual
7. Guardião Contínuo de Padronização
8. Guardião de Coexistência de Permissões
9. Guardião de Experiência Guiada
10. Guardião de Acentuação e Codificação
```

---

# 24. Mais pontos que ainda podemos robustecer

Pensando mais profundamente, eu adicionaria estes blocos finais.

## 24.1 Governança de menus e navegação

Como o agente vai descobrir hierarquia, ele também deve padronizar navegação.

```txt
REGRA — GOVERNANÇA DE NAVEGAÇÃO

Menus, submenus, breadcrumbs, títulos e rotas devem seguir a mesma hierarquia conceitual.

Se a tela está em:
Operacional > Núcleo Gestor > TI > Usuários

Então a documentação, rota, permissão e breadcrumb devem refletir essa estrutura.
```

---

## 24.2 Breadcrumbs obrigatórios

```txt
Toda tela interna deve possuir breadcrumb acessível e semântico.
```

Exemplo:

```txt
Operacional > Núcleo Gestor > TI > Usuários
```

---

## 24.3 Busca global

Em ERPs grandes, uma busca global ajuda muito.

```txt
O agente deve avaliar se o sistema precisa de busca global para encontrar telas, pacientes, documentos, relatórios ou configurações.
```

---

## 24.4 Favoritos e atalhos

Para produtividade:

```txt
O sistema deve considerar favoritos, atalhos e telas recentes para usuários que operam muitas rotinas.
```

---

## 24.5 Histórico recente do usuário

```txt
O sistema pode registrar as últimas telas acessadas, respeitando LGPD e permissões.
```

---

## 24.6 Mapa de jornada do usuário

Para telas críticas:

```txt
O agente deve documentar a jornada real do usuário:
1. de onde ele vem;
2. o que ele faz;
3. para onde vai;
4. o que espera como resultado.
```

---

## 24.7 Prevenção de erro humano

```txt
O sistema deve prevenir erros antes de punir o usuário com mensagens.

Exemplos:
- confirmar ações destrutivas;
- alertar duplicidade;
- bloquear datas inválidas;
- destacar campos obrigatórios;
- avisar inconsistências antes de salvar.
```

---

## 24.8 Salvamento automático ou rascunho

Em formulários longos:

```txt
O agente deve avaliar se faz sentido autosave, rascunho ou aviso de saída com alterações não salvas.
```

---

## 24.9 Ações em lote com segurança

```txt
Toda ação em lote deve ter:
1. confirmação;
2. resumo do impacto;
3. permissão específica;
4. auditoria;
5. rollback quando possível.
```

---

## 24.10 Exportações seguras

```txt
Toda exportação deve:
1. respeitar permissão;
2. registrar auditoria;
3. aplicar máscara quando necessário;
4. evitar dados sensíveis desnecessários;
5. permitir rastreabilidade.
```

---

## 24.11 Política de impressão segura

```txt
Impressões com dados sensíveis devem:
1. exigir permissão;
2. registrar quem imprimiu;
3. evitar exposição indevida;
4. usar layout padronizado;
5. respeitar máscaras.
```

---

## 24.12 Revisão de textos da interface

```txt
O agente deve revisar textos para:
1. clareza;
2. tom amigável;
3. ausência de erro ortográfico;
4. consistência;
5. acessibilidade;
6. linguagem operacional.
```

---

## 24.13 Modo demonstração ou treinamento

Para educar usuários:

```txt
Avaliar criação de modo treinamento com dados fictícios, separado da produção.
```

Isso é ótimo para hospital/ERP.

---

## 24.14 Política de anexos sensíveis

Além de arquivos:

```txt
Anexos com dados sensíveis devem ter:
1. permissão;
2. auditoria;
3. storage privado;
4. expiração de link;
5. bloqueio de acesso público;
6. backup;
7. retenção.
```

---

## 24.15 Rastreabilidade de decisão visual

```txt
Toda decisão visual importante deve registrar:
1. motivo;
2. alternativa considerada;
3. impacto;
4. quem aprovou;
5. ID do token/componente.
```

---

## 24.16 Relatório de dívida técnica

O agente contínuo deve gerar:

```txt
RELATÓRIO DE DÍVIDA TÉCNICA

1. código fora do padrão;
2. componente duplicado;
3. função genérica;
4. ausência de testes;
5. ausência de documentação;
6. rota sem permissão;
7. query pesada;
8. integração frágil;
9. design divergente.
```

---

## 24.17 Score de maturidade por módulo

Para visualizar qualidade:

```txt
Módulo Usuários
- Regras documentadas: 100%
- Testes: 85%
- Acessibilidade: 90%
- LGPD: 100%
- Design system: 100%
- Auditoria: 80%
- Observabilidade: 70%
```

Isso ajuda muito na governança.

---

## 24.18 Checklist antes de produção

```txt
CHECKLIST GO-LIVE

1. homologação aprovada;
2. paridade aprovada;
3. backup realizado;
4. rollback testado;
5. permissões conferidas;
6. logs ativos;
7. alertas ativos;
8. usuários treinados;
9. FAQ disponível;
10. suporte preparado;
11. feature flag pronta;
12. plano de comunicação enviado.
```

---

## 24.19 Plano de suporte pós-go-live

```txt
Após colocar em produção:
1. monitorar erros;
2. acompanhar usuários;
3. registrar dúvidas;
4. corrigir rapidamente;
5. atualizar FAQ;
6. atualizar tutoriais;
7. revisar métricas;
8. fazer reunião de lições aprendidas.
```

---

## 24.20 Política de “não quebrar operação”

Regra final fortíssima:

```txt
REGRA — NÃO QUEBRAR A OPERAÇÃO

Nenhuma modernização visual, técnica ou arquitetural pode prejudicar a operação real do usuário.

Se uma melhoria deixar o fluxo mais bonito, mas mais lento, confuso ou arriscado, ela deve ser revista.
```

---

# 25. Arquivos novos que entram no repositório

```txt
docs/
  00-visao-geral/
    decisao-idioma-pt-br.md
    regra-mae.md
    politica-anti-alucinacao.md

  01-descoberta-legado/
    descoberta-automatica-telas.md
    mapa-hierarquico-legado.md
    backlog-telas.md

  02-governanca-fases/
    encerramento-formal-fases.md
    definicao-de-pronto.md
    criterios-avanco.md

  03-permissoes/
    coexistencia-permissoes-legado-novo.md
    url-erp-laravel.md
    mapa-permissoes-por-acao.md

  04-design/
    entrevista-perfil-design.md
    pagina-visual.md
    tokens-customizaveis.md
    ids-unicos-design.md
    temas-sazonais.md

  05-interface-usuario/
    mascaras-formatacao-pt-br.md
    tooltips-semanticos.md
    descricoes-amigaveis.md
    tutoriais-guiados.md
    breadcrumbs.md
    busca-global.md

  06-documentacao/
    central-publica-ajuda.md
    central-interna-governanca-tecnica.md
    permissoes-documentacao-interna.md

  07-guardiao-continuo/
    auditoria-padroes-repositorio.md
    relatorio-divida-tecnica.md
    relatorio-novos-componentes.md
    relatorio-commits.md

  08-seguranca/
    seguranca-maxima.md
    logs-seguros.md
    protecao-secrets.md
    protecao-dados-sensiveis.md

  09-ambientes/
    ambientes-reais-projeto.md
    banco-producao-como-unica-fonte.md
    dados-anonimizados.md
    modo-somente-leitura.md

  10-go-live/
    checklist-go-live.md
    suporte-pos-go-live.md
    plano-comunicacao.md
```

---

# 26. Prompt atualizado para a IDE/Claude Opus

Você pode levar este bloco para a IDE:

```txt
Estamos construindo um projeto open source chamado "Agente de Migração Legada".

Todas as nomenclaturas do agente, documentação, comandos, templates e exemplos devem estar em português do Brasil.

Além disso, para o perfil do nosso ERP, todo código gerado também deve estar em português do Brasil, incluindo classes, funções, variáveis, constantes, componentes, rotas, comentários, documentação, testes e mensagens.

O agente deve ser um orquestrador de migração segura e também um guardião contínuo de padronização.

Ele deve:
1. investigar sistemas legados;
2. descobrir automaticamente telas e URLs;
3. montar mapa hierárquico por menus, botões, temas e módulos;
4. gerar backlog de telas;
5. preservar permissões do legado;
6. respeitar estruturas como `url_erp_laravel`;
7. manter legado funcionando até o novo estar pronto;
8. gerar dossiês;
9. mapear regras de negócio;
10. mapear banco;
11. mapear integrações;
12. mapear LGPD;
13. mapear acessibilidade;
14. mapear segurança;
15. propor interface;
16. criar Página Visual com IDs únicos;
17. criar Central Interna de Governança Técnica;
18. criar Central Pública de Ajuda;
19. gerar tutoriais guiados;
20. aplicar tooltips semânticos;
21. aplicar máscaras e formatações PT-BR;
22. suportar acentuação e caracteres especiais;
23. criar sistema de tokens customizáveis;
24. permitir temas sazonais;
25. proteger dados sensíveis;
26. auditar ações;
27. planejar rollback;
28. planejar disaster recovery;
29. planejar continuidade operacional;
30. atuar após a migração como guardião contínuo de padronização.

O agente não pode implementar, alterar banco, remover permissão, substituir integração, excluir dados ou mudar regra de negócio sem autorização explícita.

Toda fase deve ser encerrada formalmente com:
"Com isso, finalizamos 100% a Fase X — [nome da fase]."

Depois deve orientar exatamente o próximo passo.

Crie a estrutura de arquivos, documentos, comandos, templates, protocolos e guardiões para esse agente.
```

---

# 27. Minha análise: ainda falta algo?

Agora estamos muito próximos de um planejamento de altíssimo nível.

O que eu adicionaria como últimos blocos para ficar ainda mais completo:

```txt
1. Governança de menus e breadcrumbs;
2. busca global;
3. favoritos e atalhos;
4. histórico recente;
5. prevenção de erro humano;
6. autosave/rascunho quando aplicável;
7. ações em lote seguras;
8. exportações seguras;
9. impressão segura;
10. revisão de textos;
11. modo treinamento;
12. score de maturidade por módulo;
13. relatório de dívida técnica;
14. checklist go-live;
15. plano pós-go-live;
16. política de não quebrar operação.
```

Com isso, o Agente de Migração Legada vira algo realmente robusto para você levar para a IDE.

A próxima etapa ideal é transformar tudo isso em um **documento mestre único**, tipo:

```txt
ESPECIFICACAO_COMPLETA_AGENTE_DE_MIGRACAO_LEGADA.md
```

Esse documento seria a base principal para a IDE criar todos os arquivos do projeto.



---


- pergunta: a melhor forma de escreve este agente, para a ia da ide interpretar tudo com o mais alto nivvel de entendimento é qual? é o mais acertivo
- só para enfatizar, quero que tudo seja feito super micro fases e tudo perfeitamente cadenciado por listas de conclusão para o agente nao se perder ou perder contexto, ou esquecer de algo, nao, tudo tem que ser feito com o mais alto nivel de precisao cirurgica, para o sistema ser migrado completamente sem nenhuma falha por falta de contexto.
- Nome estrutural confirmado: agora que o projeto evoluiu, precisamos de um nome mais adequado, sugira alguns
- o tempo que o tool tip vai demorar para aparecer, deverá poder ser configurado via sistema
- o agente em uso deverá gerar um arquivo relatório de aprimoramento para agente genérico ou especializado, conforme for sendo utilizado, o agente tem que aprender e evoluir, com isso um relatório deve ser gerado e aprimorado, para no final da semana eu pedir para a IA examinar este relatório e fazer melhorias no agente matriz que estará no git hub e isso ela deve relatar exemplo, isso é para melhorar o agente genérico, isso é para melhorar o agente para laravel, isso é para o vue e etc... porque a ideia é esse agente servir para várias stacks e ele ir aprendendo e aprimorando cada vez mais conforme o uso do dev no dia a dia.
- falando em atalhos, quero que haja atalhos estilo: alt + c = colapsa e descolapsa tudo, atalhos de navegação e a tecla de atalho deve vir ao lado do botão no menu com o texto clarinho
- o menu deve ter duas versões onde serão dinamicos (tudo que faz em um, reflete no outro, para nunca estarem desatualizados) teremos um menu vertical e um horizontal onde o usuario vai escolher na área de preferencias
- o agente deve analisar qual é a forma de armazenamento de imagens, exemplo, o legado usa imagem local ou em nuvem tipo r2 ou s3? sempre adotar a politica de limpeza, exemplo se excluir uma imagem no sistema, entende-se que ela deve ser excluida da nuvem tambem
- 
- 


---



Sim. Agora estamos chegando no ponto mais importante: **não basta ter boas ideias para o agente; precisamos escrevê-lo no formato certo para a IA da IDE interpretar com precisão máxima, sem perder contexto e sem pular etapas.**

A melhor forma é estruturar o agente como um **sistema operacional de migração**, dividido em arquivos pequenos, objetivos, com regras, checklists, gates, comandos e templates. Não recomendo jogar um prompt gigante único e esperar que a IA siga tudo perfeitamente.

O melhor modelo é:

```txt
1. Documento mestre curto e forte
2. Regras permanentes
3. Guardiões separados
4. Protocolos por fase
5. Templates obrigatórios
6. Checklists de conclusão
7. Comandos oficiais
8. Memória de decisões
9. Relatórios de evolução do agente
10. Perfis por stack/projeto
```

---

# 1. Melhor forma de escrever o agente para a IA da IDE entender

A forma mais acertiva é escrever como **documentação operacional executável por IA**, não como texto explicativo solto.

Ou seja, cada arquivo deve responder:

```txt
1. Qual é o objetivo?
2. Quando usar?
3. O que o agente deve fazer?
4. O que o agente não pode fazer?
5. Qual checklist precisa cumprir?
6. Qual arquivo deve atualizar?
7. Quando a fase termina?
8. Qual comando vem depois?
```

## Estrutura ideal

```txt
/agente
  00-nucleo/
    regra-mae.md
    politica-anti-alucinacao.md
    politica-microfases.md
    politica-autorizacao.md
    politica-idioma-pt-br.md

  01-comandos/
    migracao-ativar.md
    migracao-descobrir-telas.md
    migracao-analisar-tela.md
    migracao-propor-interface.md
    migracao-planejar-implementacao.md
    migracao-autorizar-implementacao.md
    migracao-auditar-padroes.md

  02-fases/
    fase-00-preparacao.md
    fase-01-descoberta-legado.md
    fase-02-mapa-hierarquico.md
    fase-03-dossie-tela.md
    fase-04-prototipo-visual.md
    fase-05-plano-tecnico.md
    fase-06-implementacao-microfase.md
    fase-07-revisao-paridade.md
    fase-08-homologacao.md
    fase-09-go-live.md
    fase-10-guardiao-continuo.md

  03-guardioes/
    guardiao-design.md
    guardiao-banco.md
    guardiao-integracoes.md
    guardiao-permissoes.md
    guardiao-seguranca.md
    guardiao-lgpd.md
    guardiao-acessibilidade.md
    guardiao-testes.md
    guardiao-recuperacao-desastre.md
    guardiao-imagens-arquivos.md
    guardiao-evolucao-agente.md

  04-templates/
    dossie-tela.template.md
    checklist-fase.template.md
    relatorio-paridade.template.md
    relatorio-aprimoramento-agente.template.md
    mapa-hierarquico.template.yaml
    inventario-integracoes.template.yaml

  05-perfis/
    generico/
    laravel/
    vue/
    inertia/
    erp-hospitalar/
```

Essa separação ajuda a IA a não “engolir” tudo de uma vez.

---

# 2. Regra absoluta: super microfases

Sua ideia está perfeita: tudo deve ser feito em **super microfases cadenciadas**, com lista de conclusão.

Eu criaria esta regra permanente:

```txt
REGRA PERMANENTE — SUPER MICROFASES

O agente deve executar qualquer trabalho em unidades extremamente pequenas, sequenciais e verificáveis.

É proibido executar grandes blocos de migração de uma vez.

Cada microfase deve ter:
1. objetivo específico;
2. escopo limitado;
3. entradas necessárias;
4. ações permitidas;
5. ações proibidas;
6. arquivos que podem ser alterados;
7. checklist de conclusão;
8. evidências produzidas;
9. riscos encontrados;
10. próxima microfase sugerida.

O agente nunca deve avançar por suposição.
Se faltar informação crítica, deve marcar como "A INVESTIGAR" ou solicitar validação humana.
```

## Exemplo de microfase real

Em vez de:

```txt
Migrar tela de usuários.
```

O agente deve quebrar assim:

```txt
Microfase 1 — Identificar URL da tela de usuários
Microfase 2 — Capturar menu e breadcrumb
Microfase 3 — Identificar botões da tela
Microfase 4 — Identificar filtros
Microfase 5 — Identificar tabela/listagem
Microfase 6 — Identificar modais
Microfase 7 — Identificar ações de escrita
Microfase 8 — Identificar permissões
Microfase 9 — Identificar integrações
Microfase 10 — Identificar regras de negócio
Microfase 11 — Gerar dossiê parcial
Microfase 12 — Revisar lacunas
Microfase 13 — Gerar protótipo
Microfase 14 — Planejar implementação
Microfase 15 — Aguardar autorização
```

Isso reduz muito risco de perda de contexto.

---

# 3. Checklist obrigatório de encerramento de microfase

Cada microfase precisa terminar com algo assim:

```txt
CHECKLIST DE CONCLUSÃO DA MICROFASE

- [ ] Objetivo da microfase cumprido
- [ ] Escopo respeitado
- [ ] Nenhuma ação proibida executada
- [ ] Evidências registradas
- [ ] Arquivos atualizados
- [ ] Pendências marcadas como A INVESTIGAR
- [ ] Riscos registrados
- [ ] Próxima microfase indicada
```

E a frase obrigatória:

```txt
Com isso, finalizamos 100% a Microfase X — [nome da microfase].
```

Para fase maior:

```txt
Com isso, finalizamos 100% a Fase X — [nome da fase].
```

Isso precisa virar uma regra de comportamento do agente.

---

# 4. Novo nome do projeto

Como o projeto evoluiu, “Agente de Migração Legada” ainda é bom, mas talvez esteja pequeno para o que ele virou. Agora ele não é só migração. Ele também é governança, padronização, auditoria, design, segurança e evolução contínua.

Sugestões melhores:

## Opção 1 — **Orquestrador de Migração Legada**

Muito bom para o conceito de coordenar fases, agentes, checklists e decisões.

```txt
Orquestrador de Migração Legada
```

Ponto forte: transmite controle e processo.

---

## Opção 2 — **Guardião de Modernização Legada**

Mais forte na ideia de proteger o sistema durante e depois da migração.

```txt
Guardião de Modernização Legada
```

Ponto forte: transmite segurança, governança e continuidade.

---

## Opção 3 — **Núcleo de Modernização Legada**

Mais institucional e open source.

```txt
Núcleo de Modernização Legada
```

Ponto forte: parece um framework/base reutilizável.

---

## Opção 4 — **Legado360**

Nome mais curto, memorável e com cara de produto.

```txt
Legado360
```

Ponto forte: cobre migração, governança, auditoria, design, segurança e evolução.

---

## Opção 5 — **MigraGuard**

Mais comercial e direto.

```txt
MigraGuard
```

Ponto forte: fácil de lembrar, mas mistura PT-BR com inglês.

---

## Opção 6 — **MigraNúcleo**

```txt
MigraNúcleo
```

Ponto forte: bom equilíbrio entre migração e estrutura.

---

## Minha recomendação

Para GitHub open source em PT-BR, eu escolheria:

```txt
Orquestrador de Migração Legada
```

E o nome curto do repositório:

```txt
orquestrador-migracao-legada
```

Por quê?

Porque “agente” parece uma coisa única.
“Orquestrador” passa melhor a ideia de múltiplos guardiões, fases, checklists, comandos, relatórios e perfis.

Sugestão final:

```txt
Nome oficial:
Orquestrador de Migração Legada

Descrição:
Um framework em PT-BR para conduzir migrações de sistemas legados com microfases, documentação, segurança, testes, design system, LGPD, acessibilidade, permissões, integrações e governança contínua.
```

---

# 5. Tooltip com tempo configurável

Perfeito. Isso entra no Guardião de UX e no sistema de preferências.

```txt
REGRA PERMANENTE — CONFIGURAÇÃO DE TOOLTIPS

O tempo de exibição dos tooltips deve ser configurável via sistema.

A configuração deve permitir definir:
1. atraso para aparecer;
2. atraso para desaparecer;
3. ativar/desativar tooltips;
4. modo reduzido para usuários experientes;
5. modo educativo para usuários iniciantes;
6. preferência por usuário;
7. padrão global do sistema.
```

Exemplo:

```txt
Preferências > Interface > Tooltips

- Exibir tooltips: Sim/Não
- Tempo para aparecer: 500ms
- Tempo para desaparecer: 200ms
- Modo: compacto / educativo
```

Regra:

```txt
Tooltips devem ser configuráveis sem alterar código.
```

---

# 6. Relatório de aprimoramento do agente

Esse ponto é excelente. Ele transforma o agente em algo evolutivo.

O agente deve gerar um arquivo contínuo de aprendizado:

```txt
/docs/evolucao-agente/RELATORIO_APRIMORAMENTO_AGENTE.md
```

Ou por semana:

```txt
/docs/evolucao-agente/2026-08-semana-02.md
```

## Regra permanente

```txt
REGRA PERMANENTE — EVOLUÇÃO DO AGENTE

Durante o uso real, o agente deve registrar oportunidades de melhoria encontradas na prática.

Essas melhorias devem ser classificadas por escopo:

1. melhoria para o núcleo genérico;
2. melhoria para Laravel;
3. melhoria para Vue;
4. melhoria para Inertia;
5. melhoria para ERP hospitalar;
6. melhoria para design system;
7. melhoria para permissões;
8. melhoria para LGPD;
9. melhoria para acessibilidade;
10. melhoria para segurança;
11. melhoria para DevOps;
12. melhoria para documentação;
13. melhoria para testes;
14. melhoria para integrações.
```

## Exemplo de relatório

```md
# Relatório de Aprimoramento do Agente

## Data
16/05/2026

## Origem da melhoria
Migração da tela: Usuários

## Problema encontrado
O agente não possuía uma etapa específica para verificar se uma nova URL Laravel deveria ser vinculada à coluna `url_erp_laravel`.

## Classificação
- [ ] Núcleo genérico
- [x] Perfil Laravel
- [ ] Perfil Vue
- [x] Perfil ERP hospitalar
- [x] Permissões

## Sugestão
Adicionar ao Guardião de Permissões uma checagem obrigatória para estruturas paralelas de permissão entre legado e novo sistema.

## Impacto
Evita quebrar permissões do legado durante a migração incremental.

## Prioridade
Alta

## Deve virar melhoria no GitHub?
Sim.
```

## Fluxo semanal

```txt
1. agente registra aprendizados durante a semana;
2. dev revisa o relatório;
3. IA analisa o relatório;
4. IA propõe melhorias;
5. melhorias são aplicadas ao agente matriz no GitHub;
6. melhorias específicas vão para perfis específicos.
```

Isso é muito bom para evolução open source.

---

# 7. Atalhos de teclado

Sim, isso deve entrar no sistema como padrão de produtividade e acessibilidade.

```txt
REGRA PERMANENTE — ATALHOS DE TECLADO

O sistema deve oferecer atalhos de teclado configuráveis, documentados e acessíveis.

Atalhos devem aparecer ao lado do item de menu ou botão, com texto discreto.
```

## Exemplo

```txt
Colapsar tudo        Alt + C
Expandir tudo        Alt + E
Buscar               Ctrl + K
Salvar               Ctrl + S
Novo registro        Alt + N
Voltar               Alt + V
Ajuda                F1
```

## Sua regra específica

```txt
Alt + C = colapsa e descolapsa tudo
```

Eu ajustaria:

```txt
Alt + C
Alternar colapso/expansão geral
```

## Configuração

```txt
Preferências > Atalhos

- Ativar atalhos: Sim/Não
- Mostrar atalhos nos menus: Sim/Não
- Personalizar atalhos: Sim/Não
```

## Cuidado

Atalhos precisam evitar conflito com navegador e sistema operacional.

Regra:

```txt
O agente deve validar se o atalho proposto conflita com atalhos comuns do navegador, sistema operacional ou leitores de tela.
```

---

# 8. Menu vertical e horizontal dinâmicos

Ótimo.

Isso deve ser tratado como uma única fonte de verdade de navegação.

```txt
REGRA PERMANENTE — FONTE ÚNICA DE NAVEGAÇÃO

O sistema pode ter menu vertical e menu horizontal, mas ambos devem ser renderizados a partir da mesma estrutura de navegação.

Nenhum menu deve ser mantido manualmente separado do outro.
```

## O usuário escolhe nas preferências

```txt
Preferências > Interface > Menu

- Vertical
- Horizontal
- Automático por tamanho de tela
```

## Estrutura única

```yaml
navegacao:
  - id: "MENU-OPERACIONAL"
    titulo: "Operacional"
    icone: "icone-operacional"
    permissao: "visualizar_operacional"
    filhos:
      - id: "MENU-NUCLEO-GESTOR"
        titulo: "Núcleo Gestor"
        filhos:
          - id: "MENU-TI"
            titulo: "TI"
            filhos:
              - id: "TELA-USUARIOS"
                titulo: "Usuários"
                rota: "usuarios.index"
                atalho: "Alt+U"
```

## Regra

```txt
Toda alteração no menu deve refletir automaticamente:
1. no menu vertical;
2. no menu horizontal;
3. nos breadcrumbs;
4. na busca global;
5. no mapa de permissões;
6. na documentação da navegação.
```

Isso evita inconsistência.

---

# 9. Análise de armazenamento de imagens

Muito importante.

O agente deve investigar como o legado armazena imagens e arquivos.

```txt
REGRA PERMANENTE — INVENTÁRIO DE ARMAZENAMENTO DE IMAGENS E ARQUIVOS

Antes de migrar qualquer funcionalidade que use imagens, anexos ou arquivos, o agente deve identificar a estratégia de armazenamento usada pelo legado.
```

## O agente deve descobrir

```txt
1. imagens são salvas localmente?
2. imagens ficam em pasta pública?
3. imagens ficam em pasta privada?
4. imagens ficam no banco?
5. imagens ficam em S3?
6. imagens ficam em Cloudflare R2?
7. imagens ficam em outro storage?
8. existe CDN?
9. existe thumbnail?
10. existe compressão?
11. existe conversão de formato?
12. existe política de nome de arquivo?
13. existe exclusão física?
14. existe soft delete?
15. existe backup dos arquivos?
16. existe controle de acesso?
17. existe expiração de link?
```

---

# 10. Política de limpeza de imagens e arquivos

Você está certo: se excluir uma imagem no sistema, normalmente deve excluir do storage também. Mas isso precisa ser feito com cuidado.

## Regra

```txt
REGRA PERMANENTE — LIMPEZA DE ARQUIVOS

Toda funcionalidade que cria, substitui ou exclui arquivos deve possuir política clara de limpeza, retenção, auditoria e recuperação.

Quando uma imagem ou arquivo for removido do sistema, o agente deve verificar se:
1. o arquivo deve ser excluído fisicamente;
2. o arquivo deve ser mantido por retenção legal;
3. o arquivo deve ser apenas desvinculado;
4. o arquivo é usado por outro registro;
5. o arquivo possui versões;
6. o arquivo está em backup;
7. o arquivo é sensível;
8. a exclusão deve ser auditada.
```

## Cuidado importante

Nem sempre excluir no sistema significa apagar imediatamente da nuvem.

Exemplo:

```txt
Se for foto de perfil comum:
pode excluir fisicamente após verificar uso.

Se for documento hospitalar:
talvez precise reter por regra legal.

Se for anexo de atendimento:
talvez não possa excluir fisicamente.

Se for imagem de produto temporária:
pode excluir do storage.
```

## Política recomendada

```txt
1. usar soft delete lógico no banco quando necessário;
2. registrar exclusão;
3. colocar arquivo em fila de exclusão;
4. verificar se outro registro usa o mesmo arquivo;
5. excluir do storage após segurança;
6. manter logs;
7. permitir recuperação quando aplicável.
```

## Exemplo de fluxo

```txt
Usuário remove imagem.

Sistema:
1. desvincula imagem do registro;
2. registra auditoria;
3. agenda job de limpeza;
4. job verifica se arquivo não é usado em outro lugar;
5. se puder, remove do storage;
6. registra resultado.
```

Isso evita apagar arquivo ainda usado.

---

# 11. Guardião de imagens, arquivos e storage

Eu adicionaria um guardião específico:

```txt
Guardião de Imagens, Arquivos e Storage
```

Responsável por:

```txt
1. mapear storage legado;
2. mapear storage novo;
3. definir política de upload;
4. definir política de exclusão;
5. definir política de retenção;
6. definir política de backup;
7. definir política de acesso;
8. definir URLs assinadas;
9. definir thumbnails;
10. definir compressão;
11. definir formatos permitidos;
12. definir antivírus/varredura;
13. impedir arquivos públicos indevidos;
14. limpar arquivos órfãos;
15. auditar alterações.
```

---

# 12. Como escrever o agente de forma mais “interpretável” para IA

Aqui está o ponto central.

Eu usaria sempre este formato nos arquivos:

```md
# Nome da regra/fase/guardião

## Objetivo

Explique em 2 ou 3 linhas.

## Quando usar

Liste situações.

## Entradas esperadas

Liste dados necessários.

## Ações obrigatórias

Liste com checkboxes.

## Ações proibidas

Liste com checkboxes.

## Arquivos que devem ser atualizados

Liste caminhos.

## Checklist de conclusão

Liste critérios objetivos.

## Frase obrigatória de encerramento

"Com isso, finalizamos 100%..."

## Próximo passo

Indique o comando seguinte.
```

Esse formato é muito melhor do que texto corrido.

## Exemplo real

```md
# Fase 03 — Descoberta de Telas

## Objetivo

Descobrir automaticamente as telas, URLs, menus, botões e fluxos acessíveis do sistema legado.

## Ações obrigatórias

- [ ] Ler URLs fornecidas manualmente.
- [ ] Investigar menus principais.
- [ ] Investigar submenus.
- [ ] Identificar botões que levam a outras telas.
- [ ] Identificar links internos.
- [ ] Identificar rotas escondidas em JavaScript.
- [ ] Comparar URLs encontradas com permissões no banco.
- [ ] Gerar mapa hierárquico.
- [ ] Gerar backlog de telas.
- [ ] Marcar telas incertas como A INVESTIGAR.

## Ações proibidas

- [ ] Não implementar telas.
- [ ] Não alterar banco.
- [ ] Não remover permissões.
- [ ] Não assumir que a lista manual está completa.

## Checklist de conclusão

- [ ] Mapa hierárquico criado.
- [ ] Backlog de telas criado.
- [ ] Telas esquecidas sinalizadas.
- [ ] URLs duplicadas tratadas.
- [ ] Pendências documentadas.

## Encerramento obrigatório

Com isso, finalizamos 100% a Fase 03 — Descoberta de Telas.

## Próximo passo

Executar:
/migracao-analisar-tela [ID_DA_TELA]
```

Esse é o nível de clareza que a IDE precisa.

---

# 13. Nova lista de guardiões adicionados nesta rodada

```txt
1. Guardião de Evolução do Agente
2. Guardião de Atalhos de Teclado
3. Guardião de Navegação e Menus
4. Guardião de Imagens, Arquivos e Storage
5. Guardião de Limpeza de Arquivos
6. Guardião de Preferências do Usuário
7. Guardião de Microfases
```

---

# 14. Atualização dos comandos

Adicionar:

```txt
/migracao-descobrir-telas
/migracao-gerar-mapa-hierarquico
/migracao-auditar-padroes
/migracao-gerar-relatorio-aprimoramento
/migracao-analisar-storage
/migracao-analisar-atalhos
/migracao-analisar-navegacao
/migracao-revisar-microfase
```

## Documentação simples no GitHub

Exemplo:

```md
## /migracao-descobrir-telas

Use quando quiser que o agente encontre automaticamente as telas do sistema legado.

Ele analisa menus, submenus, botões, links, permissões e URLs para montar um mapa hierárquico.

Não implementa nada.
Não altera banco.
Não altera permissões.

Exemplo:

/migracao-descobrir-telas
```

---

# 15. Regra de precisão cirúrgica

Eu colocaria esta regra no topo do agente:

```txt
REGRA PERMANENTE — PRECISÃO CIRÚRGICA

O agente deve trabalhar com precisão máxima, sem pressa, sem assumir informações inexistentes e sem avançar etapas sem checklist concluído.

Toda migração deve ser:
1. pequena;
2. rastreável;
3. documentada;
4. verificável;
5. reversível quando possível;
6. autorizada;
7. testada;
8. revisada.

O agente deve preferir avançar lentamente com segurança do que rapidamente com risco.
```

---

# 16. Regra de preservação de contexto

```txt
REGRA PERMANENTE — PRESERVAÇÃO DE CONTEXTO

O agente deve manter arquivos de memória operacional para não depender apenas do contexto da conversa.

Arquivos obrigatórios:
1. decisões;
2. histórico de migração;
3. backlog de telas;
4. mapa hierárquico;
5. inventário de componentes;
6. inventário de permissões;
7. inventário de integrações;
8. inventário de banco;
9. inventário de storage;
10. relatório de aprimoramento do agente.
```

Isso é fundamental. A IA perde contexto; os arquivos mantêm o projeto vivo.

---

# 17. Regra de conclusão por lista

```txt
REGRA PERMANENTE — LISTAS DE CONCLUSÃO

Toda fase, microfase, tela, módulo e revisão deve possuir lista de conclusão.

O agente só pode marcar como concluído o que tiver checklist atendido.

Itens não verificados devem ficar como:
- Pendente;
- A investigar;
- Bloqueado;
- Requer decisão.
```

---

# 18. Atualização do prompt para a IDE

Você pode passar assim:

```txt
Estamos construindo o projeto "Orquestrador de Migração Legada".

O objetivo é criar um framework/agente em PT-BR para conduzir migrações de sistemas legados com precisão cirúrgica, super microfases, checklists, guardiões, documentação viva e governança contínua.

A IA da IDE deve estruturar o agente em arquivos pequenos, claros e altamente interpretáveis, nunca como um prompt gigante único.

Cada arquivo deve conter:
1. objetivo;
2. quando usar;
3. entradas esperadas;
4. ações obrigatórias;
5. ações proibidas;
6. arquivos que atualiza;
7. checklist de conclusão;
8. frase obrigatória de encerramento;
9. próximo passo.

Todo o agente deve operar em PT-BR.

Para o perfil do nosso ERP, todo código gerado também deve estar em PT-BR.

O agente deve trabalhar em super microfases. Nada pode ser feito em blocos grandes. Cada microfase deve ser concluída com checklist e frase:
"Com isso, finalizamos 100% a Microfase X — [nome]."

Cada fase deve ser concluída com:
"Com isso, finalizamos 100% a Fase X — [nome]."

O agente deve preservar contexto em arquivos, incluindo decisões, histórico, backlog, mapa hierárquico, inventários e relatórios de aprimoramento.

O agente deve descobrir telas automaticamente, não depender apenas de lista manual de URLs.

O agente deve gerar mapa hierárquico por temas, menus, submenus, botões e URLs.

O agente deve atuar também após a migração como guardião contínuo, analisando commits, novos arquivos, novos componentes, novas rotas, padrões quebrados e oportunidades de melhoria.

O agente deve gerar relatórios de aprimoramento para evoluir o núcleo genérico e perfis específicos como Laravel, Vue, Inertia, ERP hospitalar, design, segurança, permissões e integrações.

Implemente a estrutura documental do agente com comandos, fases, guardiões, templates e políticas.
```

---

# 19. Minha recomendação final sobre o nome

Eu usaria:

```txt
Orquestrador de Migração Legada
```

E manteria internamente o conceito:

```txt
OML
```

Exemplo:

```txt
OML — Orquestrador de Migração Legada
```

Repositório:

```txt
orquestrador-migracao-legada
```

Porém, se você quiser algo mais curto e marcante:

```txt
Legado360
```

Minha escolha profissional:

```txt
Orquestrador de Migração Legada
```

Minha escolha com cara de produto:

```txt
Legado360
```

---

# 20. O que esta rodada adicionou definitivamente

```txt
1. Escrita do agente em arquivos pequenos e interpretáveis.
2. Super microfases obrigatórias.
3. Checklists de conclusão por microfase.
4. Novo nome sugerido: Orquestrador de Migração Legada.
5. Tooltips com tempo configurável.
6. Relatório de aprimoramento do agente.
7. Evolução semanal do agente matriz.
8. Classificação de melhorias por núcleo genérico e perfis específicos.
9. Atalhos de teclado com exibição no menu.
10. Menus vertical e horizontal a partir da mesma fonte.
11. Preferência de menu por usuário.
12. Análise de armazenamento de imagens.
13. Política de limpeza de arquivos.
14. Guardião de imagens, arquivos e storage.
15. Preservação de contexto via arquivos.
16. Precisão cirúrgica como regra permanente.
```

Com isso, o projeto fica muito mais preparado para a IDE executar sem se perder.



---


nome oficial: OML — Orquestrador de Migração Legada
- o sistema deve ser totalmente responsivo para mobile, tablet e desktop
- 


---


Fechado.

```txt
Nome oficial do projeto:
OML — Orquestrador de Migração Legada
```

E entra mais uma regra permanente:

```txt
REGRA PERMANENTE — RESPONSIVIDADE TOTAL

Todo sistema migrado pelo OML deve ser totalmente responsivo e funcional em:

1. mobile;
2. tablet;
3. desktop;
4. telas grandes;
5. diferentes densidades de tela;
6. diferentes orientações, quando aplicável.

A responsividade não deve ser apenas visual. O fluxo operacional precisa continuar claro, seguro e utilizável em cada dispositivo.
```

## O que o OML deve exigir em cada tela

```txt
CHECKLIST DE RESPONSIVIDADE

1. Layout adaptado para mobile, tablet e desktop.
2. Menu adequado para cada tamanho de tela.
3. Tabelas com estratégia responsiva.
4. Formulários confortáveis no mobile.
5. Botões com área de toque adequada.
6. Modais adaptados para telas pequenas.
7. Tooltips com alternativa acessível em mobile.
8. Filtros utilizáveis no mobile.
9. Ações importantes sempre acessíveis.
10. Textos sem quebra ruim.
11. Cards e grids reorganizados por breakpoint.
12. Scrolls previsíveis.
13. Cabeçalhos e rodapés adaptados.
14. Atalhos de teclado não obrigatórios para operar.
15. Teste visual em mobile, tablet e desktop.
```

## Regra importante para ERP

```txt
Modernizar para responsivo não pode esconder ações críticas nem dificultar a operação.

Se uma tela for complexa demais para mobile, o OML deve propor uma adaptação operacional segura, como:
1. visão resumida;
2. ações prioritárias;
3. filtros recolhidos;
4. tabela em cards;
5. navegação por abas;
6. botão de ações agrupadas;
7. aviso quando determinada operação for recomendada no desktop.
```

## Atualização na Página Visual

A Página Visual também precisa documentar responsividade:

```txt
PÁGINA VISUAL — SEÇÃO OBRIGATÓRIA DE RESPONSIVIDADE

1. Breakpoints oficiais.
2. Comportamento do menu vertical.
3. Comportamento do menu horizontal.
4. Comportamento de tabelas.
5. Comportamento de formulários.
6. Comportamento de modais.
7. Comportamento de filtros.
8. Comportamento de cards.
9. Comportamento de botões.
10. Padrões para mobile, tablet e desktop.
```

## Novo guardião

```txt
Guardião de Responsividade
```

Responsável por garantir que toda tela, componente, formulário, tabela, modal, menu, tutorial, tooltip e página de documentação funcione corretamente em mobile, tablet e desktop.

Esse item entra oficialmente no OML.


---

perfeito, agora consolide tudo o que discutimos para eu passar para a ide gerar o agente.

---


Abaixo está a **consolidação mestre** para você passar para a IDE gerar o agente.

Você pode copiar e colar como prompt principal.

---

# Especificação Mestre — OML

## Nome oficial

```txt
OML — Orquestrador de Migração Legada
```

## Objetivo do projeto

Criar um agente/framework em PT-BR para conduzir migrações de sistemas legados para stacks modernas com **precisão cirúrgica**, **super microfases**, **checklists obrigatórios**, **documentação viva**, **governança contínua**, **segurança**, **LGPD**, **acessibilidade**, **padronização visual**, **testes**, **rollback**, **disaster recovery** e **preservação total das regras de negócio**.

O OML não deve ser apenas um gerador de código. Ele deve ser um **orquestrador de migração e guardião contínuo de qualidade**.

---

# 1. Regras permanentes do OML

## 1.1 Idioma obrigatório

Todo o OML deve ser escrito em **português do Brasil**.

Isso inclui:

```txt
- nome dos comandos;
- documentação;
- comentários;
- templates;
- relatórios;
- nomes dos guardiões;
- nomes das fases;
- nomes dos status;
- exemplos;
- mensagens;
- checklists;
- arquivos;
- instruções internas;
- documentação do GitHub.
```

Para o perfil do nosso ERP, **todo código gerado também deve estar em PT-BR**, incluindo:

```txt
- classes;
- funções;
- métodos;
- variáveis;
- constantes;
- componentes;
- rotas;
- arquivos;
- pastas;
- comentários;
- testes;
- mensagens;
- tooltips;
- documentação técnica;
- documentação de usuário.
```

Exceções permitidas apenas quando forem nomes obrigatórios do framework, bibliotecas externas ou contratos de terceiros.

---

## 1.2 Regra-mãe

```txt
A migração só é considerada correta quando:

1. preserva as regras de negócio do legado;
2. protege o banco existente;
3. respeita permissões existentes;
4. respeita integrações existentes;
5. mantém o legado funcionando até o novo estar pronto;
6. melhora a arquitetura;
7. eleva a segurança;
8. respeita LGPD e privacidade;
9. garante acessibilidade;
10. garante responsividade;
11. padroniza design e componentes;
12. oferece feedback claro ao usuário;
13. usa nomenclatura semântica;
14. possui testes;
15. possui auditoria;
16. possui observabilidade;
17. possui estratégia de rollback;
18. considera disaster recovery;
19. considera continuidade operacional;
20. documenta decisões;
21. mantém rastreabilidade;
22. evita alucinação;
23. só implementa com autorização explícita.
```

---

## 1.3 Precisão cirúrgica

```txt
O OML deve trabalhar com precisão máxima, sem pressa, sem assumir informações inexistentes e sem avançar etapas sem checklist concluído.

Toda migração deve ser:

1. pequena;
2. rastreável;
3. documentada;
4. verificável;
5. reversível quando possível;
6. autorizada;
7. testada;
8. revisada.
```

O OML deve preferir avançar lentamente com segurança do que rapidamente com risco.

---

## 1.4 Super microfases obrigatórias

Nada deve ser feito em blocos grandes.

Cada tarefa deve ser quebrada em microfases muito pequenas, com objetivo claro, checklist e encerramento formal.

Cada microfase deve conter:

```txt
1. objetivo específico;
2. escopo limitado;
3. entradas necessárias;
4. ações permitidas;
5. ações proibidas;
6. arquivos que podem ser alterados;
7. checklist de conclusão;
8. evidências produzidas;
9. riscos encontrados;
10. próxima microfase sugerida.
```

Cada microfase deve terminar com:

```txt
Com isso, finalizamos 100% a Microfase X — [nome da microfase].
```

Cada fase deve terminar com:

```txt
Com isso, finalizamos 100% a Fase X — [nome da fase].
```

Após encerrar uma fase ou microfase, o agente deve orientar exatamente o próximo passo.

---

## 1.5 Política anti-alucinação

O OML não pode inventar:

```txt
- regras de negócio;
- tabelas;
- campos;
- permissões;
- integrações;
- fluxos;
- cálculos;
- credenciais;
- status;
- comportamentos;
- URLs;
- relações entre tabelas;
- decisões operacionais.
```

Quando não souber, deve marcar como:

```txt
A INVESTIGAR
```

Quando for hipótese, deve marcar como:

```txt
HIPÓTESE NÃO VALIDADA
```

Quando houver evidência, deve registrar a origem:

```txt
- tela;
- URL;
- arquivo;
- query;
- banco;
- comportamento observado;
- validação humana;
- integração;
- log;
- documentação existente.
```

---

## 1.6 Implementação bloqueada por padrão

O OML pode, sem autorização:

```txt
- investigar;
- documentar;
- propor;
- prototipar;
- planejar;
- gerar checklists;
- mapear riscos.
```

O OML não pode, sem autorização explícita:

```txt
- implementar;
- alterar banco;
- alterar regra de negócio;
- remover funcionalidade;
- substituir integração;
- excluir dados;
- remover permissões;
- desativar legado;
- modificar estrutura de produção.
```

---

# 2. Como a IDE deve estruturar o agente

A IDE não deve criar um prompt gigante único.

Ela deve criar um projeto documental modular, com arquivos pequenos, claros e altamente interpretáveis por IA.

Cada arquivo deve seguir esta estrutura:

```md
# Nome da regra, fase, comando ou guardião

## Objetivo

Explique o objetivo de forma clara.

## Quando usar

Explique quando este arquivo deve ser aplicado.

## Entradas esperadas

Liste quais informações são necessárias.

## Ações obrigatórias

Liste em checklist.

## Ações proibidas

Liste em checklist.

## Arquivos que devem ser atualizados

Liste os caminhos.

## Checklist de conclusão

Liste os critérios objetivos.

## Frase obrigatória de encerramento

"Com isso, finalizamos 100%..."

## Próximo passo

Indique o comando ou fase seguinte.
```

---

# 3. Estrutura recomendada do repositório

```txt
oml-orquestrador-migracao-legada/
  README.md
  LICENSE
  CONTRIBUTING.md
  CODE_OF_CONDUCT.md
  CHANGELOG.md

  docs/
    00-visao-geral/
      introducao.md
      filosofia.md
      regra-mae.md
      decisao-idioma-pt-br.md
      politica-anti-alucinacao.md
      politica-autorizacao.md
      politica-super-microfases.md
      politica-preservacao-contexto.md
      definicao-de-pronto.md
      glossario.md

    01-comandos/
      comandos-oficiais.md
      migracao-ativar.md
      migracao-configurar-projeto.md
      migracao-descobrir-telas.md
      migracao-carregar-urls.md
      migracao-gerar-mapa-hierarquico.md
      migracao-analisar-tela.md
      migracao-gerar-dossie.md
      migracao-propor-interface.md
      migracao-planejar-implementacao.md
      migracao-autorizar-implementacao.md
      migracao-revisar-paridade.md
      migracao-homologar.md
      migracao-auditar-padroes.md
      migracao-gerar-relatorio-aprimoramento.md
      migracao-status.md
      migracao-proxima-tela.md
      migracao-bloquear.md
      migracao-retomar.md

    02-fases/
      fase-00-preparacao-governanca.md
      fase-01-mapeamento-geral-legado.md
      fase-02-descoberta-telas.md
      fase-03-mapa-hierarquico.md
      fase-04-pagina-visual-base.md
      fase-05-investigacao-tela.md
      fase-06-dossie-funcional.md
      fase-07-mapeamento-tecnico.md
      fase-08-mapeamento-riscos.md
      fase-09-prototipo-visual.md
      fase-10-plano-implementacao.md
      fase-11-planejamento-testes.md
      fase-12-autorizacao-implementacao.md
      fase-13-implementacao-microfase.md
      fase-14-revisao-paridade.md
      fase-15-homologacao-operacional.md
      fase-16-rollout-controlado.md
      fase-17-conciliacao-pos-migracao.md
      fase-18-encerramento-tela-modulo.md
      fase-19-guardiao-continuo.md

    03-guardioes/
      guardiao-investigacao-legado.md
      guardiao-descoberta-telas.md
      guardiao-regras-negocio.md
      guardiao-banco-dados.md
      guardiao-permissoes-acessos.md
      guardiao-coexistencia-permissoes.md
      guardiao-integracoes.md
      guardiao-governanca-apis.md
      guardiao-design.md
      guardiao-customizacao-visual.md
      guardiao-acessibilidade.md
      guardiao-responsividade.md
      guardiao-lgpd-privacidade.md
      guardiao-seguranca.md
      guardiao-testes.md
      guardiao-feedbacks-ux.md
      guardiao-tooltips.md
      guardiao-tutoriais-guiados.md
      guardiao-nomenclatura-semantica.md
      guardiao-documentacao.md
      guardiao-central-ajuda.md
      guardiao-central-tecnica-interna.md
      guardiao-observabilidade.md
      guardiao-auditoria.md
      guardiao-deploy-rollback.md
      guardiao-performance.md
      guardiao-qualidade-dados.md
      guardiao-recuperacao-desastre.md
      guardiao-continuidade-operacional.md
      guardiao-resposta-incidentes.md
      guardiao-arquivos-documentos-storage.md
      guardiao-limpeza-arquivos.md
      guardiao-impressao-dispositivos.md
      guardiao-internacionalizacao-localizacao.md
      guardiao-mascaras-formatacao.md
      guardiao-acento-codificacao.md
      guardiao-menus-navegacao.md
      guardiao-atalhos-teclado.md
      guardiao-manutenibilidade.md
      guardiao-custos-complexidade.md
      guardiao-dados-teste.md
      guardiao-dependencias-licencas.md
      guardiao-segredos-credenciais.md
      guardiao-seguranca-paciente-risco-operacional.md
      guardiao-convivencia-legado-novo.md
      guardiao-conciliacao-pos-migracao.md
      guardiao-configuracoes.md
      guardiao-governanca-open-source.md
      guardiao-evolucao-agente.md
      guardiao-continuo-padronizacao.md

    04-protocolos/
      protocolo-super-microfases.md
      protocolo-esteira-urls.md
      protocolo-descoberta-automatica-telas.md
      protocolo-mapa-hierarquico.md
      protocolo-dossie-tela.md
      protocolo-prototipo-visual.md
      protocolo-plano-implementacao.md
      protocolo-revisao-paridade.md
      protocolo-homologacao.md
      protocolo-rollout.md
      protocolo-go-live.md
      protocolo-pos-go-live.md
      protocolo-guardiao-continuo.md

    05-templates/
      perfil-projeto.template.md
      backlog-telas.template.yaml
      mapa-hierarquico.template.yaml
      dossie-tela.template.md
      mapa-banco.template.md
      mapa-permissoes.template.md
      mapa-integracoes.template.md
      inventario-componentes.template.md
      inventario-dados.template.md
      inventario-storage.template.md
      checklist-fase.template.md
      checklist-microfase.template.md
      checklist-paridade.template.md
      plano-implementacao.template.md
      plano-testes.template.md
      plano-rollback.template.md
      plano-disaster-recovery.template.md
      plano-continuidade-operacional.template.md
      relatorio-aprimoramento-agente.template.md
      relatorio-divida-tecnica.template.md
      registro-decisao.template.md
      historico-migracao.template.md

    06-perfis/
      generico/
        perfil.md

      laravel/
        perfil.md
        arquitetura.md
        testes.md
        lint-formatacao.md
        seguranca.md
        banco-legado.md

      vue/
        perfil.md
        componentes.md
        acessibilidade.md
        responsividade.md

      inertia/
        perfil.md
        padroes.md

      erp-hospitalar-laravel-vue-inertia/
        perfil.md
        direcao-visual.md
        politica-banco-legado.md
        permissoes-url-erp-laravel.md
        operacao-hospitalar.md
        lgpd.md
        acessibilidade.md
        seguranca.md
        disaster-recovery.md
        continuidade-operacional.md

  memoria/
    decisoes.md
    historico-migracao.md
    backlog-telas.yaml
    mapa-hierarquico-legado.yaml
    inventario-componentes.md
    inventario-permissoes.md
    inventario-integracoes.md
    inventario-banco.md
    inventario-storage.md
    relatorio-aprimoramento-agente.md
    riscos.md
    pendencias.md
```

---

# 4. Comandos oficiais em PT-BR

A documentação do GitHub deve explicar de forma simples quando e como usar cada comando.

```txt
/migracao-ativar
/migracao-configurar-projeto
/migracao-descobrir-telas
/migracao-carregar-urls
/migracao-gerar-mapa-hierarquico
/migracao-analisar-tela
/migracao-gerar-dossie
/migracao-propor-interface
/migracao-planejar-implementacao
/migracao-autorizar-implementacao
/migracao-revisar-paridade
/migracao-homologar
/migracao-proxima-tela
/migracao-status
/migracao-bloquear
/migracao-retomar
/migracao-auditar-padroes
/migracao-gerar-relatorio-aprimoramento
```

Cada comando deve documentar:

```txt
1. quando usar;
2. o que faz;
3. o que não faz;
4. arquivos que atualiza;
5. exemplo de uso;
6. próximo passo esperado.
```

Exemplo:

```md
## /migracao-descobrir-telas

Use quando quiser que o OML encontre automaticamente telas do sistema legado.

Ele analisa menus, submenus, botões, links, permissões e URLs para montar um mapa hierárquico.

Não implementa nada.
Não altera banco.
Não altera permissões.

Exemplo:

/migracao-descobrir-telas
```

---

# 5. Fases oficiais do OML

```txt
FASE 00 — Preparação e Governança
FASE 01 — Mapeamento Geral do Legado
FASE 02 — Descoberta Automática de Telas
FASE 03 — Mapa Hierárquico
FASE 04 — Página Visual Base
FASE 05 — Investigação da Tela
FASE 06 — Dossiê Funcional
FASE 07 — Mapeamento Técnico
FASE 08 — Mapeamento de Riscos
FASE 09 — Protótipo Visual
FASE 10 — Plano de Implementação
FASE 11 — Planejamento de Testes
FASE 12 — Autorização de Implementação
FASE 13 — Implementação em Microfase
FASE 14 — Revisão de Paridade
FASE 15 — Homologação Operacional
FASE 16 — Rollout Controlado
FASE 17 — Conciliação Pós-Migração
FASE 18 — Encerramento da Tela ou Módulo
FASE 19 — Guardião Contínuo
```

---

# 6. Descoberta automática de telas e URLs

O OML não deve depender apenas de uma lista manual de URLs.

Ele deve descobrir telas automaticamente analisando:

```txt
1. menus principais;
2. submenus;
3. botões;
4. links internos;
5. breadcrumbs;
6. abas;
7. modais;
8. ações JavaScript;
9. formulários;
10. rotas AJAX;
11. endpoints internos;
12. includes de menu;
13. permissões no banco;
14. coluna url_erp_laravel, quando existir;
15. logs de acesso, quando existirem;
16. arquivos do legado;
17. páginas de relatório;
18. páginas de impressão;
19. páginas de exportação;
20. páginas administrativas escondidas.
```

O resultado deve ser um mapa hierárquico.

Exemplo:

```txt
Operacional
  Núcleo Gestor
    TI
      Usuários
      Pessoa Física
      Perfis de Acesso
      Permissões
    Atendimento
      Agenda
      Recepção
      Triagem
    Financeiro
      Contas a Receber
      Contas a Pagar
      Faturamento
```

A lista manual de URLs é apenas uma ajuda, não a fonte única.

O OML deve comparar:

```txt
- URLs informadas pelo humano;
- URLs encontradas no menu;
- URLs encontradas em botões;
- URLs encontradas no código;
- URLs encontradas no banco de permissões;
- URLs já existentes no Laravel novo.
```

Depois deve gerar uma lista de possíveis telas esquecidas.

---

# 7. Backlog de telas

Exemplo de estrutura:

```yaml
telas:
  - id: "TELA-0001"
    titulo: "Usuários"
    modulo: "Operacional > Núcleo Gestor > TI"
    url_legado: "/operacional/nucleo-gestor/ti/usuarios"
    url_erp_laravel: "/erp/ti/usuarios"
    finalidade_conhecida: null
    criticidade: "a_investigar"
    risco_operacional: "a_investigar"
    possui_escrita_no_banco: "a_investigar"
    possui_integracoes: "a_investigar"
    possui_dados_sensiveis: "a_investigar"
    status: "nao_iniciada"
    etapas_permitidas:
      - "investigar"
      - "documentar"
      - "prototipar"
      - "planejar"
    implementacao_autorizada: false
    observacoes: ""
```

Regra:

```txt
A presença de uma URL no backlog não autoriza implementação.
```

---

# 8. Coexistência legado/novo e permissões

O legado deve continuar funcionando até o novo estar 100% pronto.

O OML deve estudar a estrutura de permissões do projeto antes de propor qualquer alteração.

No nosso ERP, existe a estrutura `url_erp_laravel`, usada para permissionar o novo ERP sem remover as permissões do antigo.

Regra:

```txt
O OML não pode remover, sobrescrever, desativar ou quebrar permissões do legado.

Quando existir uma estrutura como `url_erp_laravel`, ela deve ser tratada como camada paralela de permissão para o novo ERP Laravel.
```

O OML deve mapear:

```txt
1. como o legado valida permissão;
2. quais tabelas guardam permissões;
3. quais colunas controlam URL;
4. qual é a URL antiga;
5. qual é a URL nova;
6. se existe url_erp_laravel;
7. se a permissão é por usuário, perfil, cargo, grupo ou módulo;
8. se a permissão controla tela, botão, ação ou campo;
9. se existe cache de permissões;
10. se existem permissões herdadas.
```

---

# 9. Página Visual Base

A Página Visual deve nascer na Fase 04, antes da primeira tela migrada.

Ela começa como versão base, aprovada antes da primeira tela, e evolui durante a migração.

Todo novo componente, token, variação visual ou padrão de UI deve ser documentado antes de virar padrão.

Tudo deve ter ID único.

Exemplos de IDs:

```txt
COR-PRIMARIA-001
COR-SUCESSO-001
TIPOGRAFIA-TITULO-PAGINA-001
BOTAO-PRIMARIO-001
BOTAO-DESTRUTIVO-001
INPUT-TEXTO-001
TABELA-PADRAO-001
MODAL-CONFIRMACAO-001
TOOLTIP-AJUDA-001
ESTADO-CARREGANDO-001
ESTADO-VAZIO-001
ANIMACAO-ENTRADA-SUAVE-001
```

A Página Visual deve conter:

```txt
1. cores;
2. tipografia;
3. espaçamentos;
4. bordas;
5. sombras;
6. ícones;
7. botões;
8. inputs;
9. selects;
10. checkboxes;
11. radios;
12. switches;
13. textareas;
14. tabelas;
15. paginação;
16. filtros;
17. cards;
18. modais;
19. drawers;
20. abas;
21. accordions;
22. alerts;
23. toasts;
24. badges;
25. tooltips;
26. breadcrumbs;
27. menus;
28. sidebar;
29. header;
30. empty states;
31. loading states;
32. error states;
33. dark mode;
34. light mode;
35. alto contraste;
36. tamanhos de fonte;
37. estados de foco;
38. estados desabilitados;
39. estados de sucesso;
40. estados de erro;
41. responsividade;
42. atalhos de teclado;
43. tutoriais guiados.
```

---

# 10. Entrevista de design

Antes de criar a Página Visual, o OML deve perguntar:

```txt
1. O sistema deve parecer moderno, clássico ou moderno conservador?
2. O público usa o sistema por muitas horas seguidas?
3. O visual deve ser mais denso ou mais espaçado?
4. Cantos retos, levemente arredondados ou muito arredondados?
5. Qual nível de arredondamento desejado?
6. Deve ter micro animações?
7. As micro animações devem ser discretas ou perceptíveis?
8. Deve haver modo reduzido de animação?
9. Ícones com traçado ou preenchidos?
10. Ícones sempre acompanhados de texto?
11. O sistema deve transmitir seriedade, acolhimento, velocidade ou sofisticação?
12. Cores mais frias, quentes ou neutras?
13. Deve haver tema sazonal, como Outubro Rosa?
14. O usuário poderá customizar cores pelo sistema?
15. O usuário poderá customizar fonte?
16. O sistema terá alto contraste?
17. O sistema terá ajuste de tamanho de fonte?
18. O sistema terá dark mode?
19. O sistema terá light mode?
20. O sistema respeitará preferência do sistema operacional?
21. Layout com sidebar fixa ou recolhível?
22. Header fixo ou não?
23. Tabelas compactas ou confortáveis?
24. Botões grandes ou moderados?
25. Feedback por toast, alerta inline ou ambos?
26. Fluxos terão tutorial guiado?
27. Usuário pode pular tutorial?
28. Sistema terá ajuda contextual?
29. Sistema terá tooltips?
30. Sistema será usado em desktop, tablet, celular ou todos?
```

Para o nosso ERP, a direção visual inicial é:

```txt
- hospitalar;
- moderno;
- conservador;
- limpo;
- levemente arredondado;
- profissional;
- cores calmas;
- ícones lineares sem preenchimento;
- excelente contraste;
- interface sem poluição visual.
```

---

# 11. Customização visual centralizada

Toda cor, fonte, espaçamento, borda, sombra, raio, densidade, animação e preferência visual deve ser controlada por tokens centralizados.

Nada de cor hardcoded em tela.

O sistema deve permitir configurar:

```txt
1. cor primária;
2. cor secundária;
3. cor de destaque;
4. fonte principal;
5. tamanho base da fonte;
6. arredondamento;
7. densidade da interface;
8. tema sazonal;
9. Outubro Rosa;
10. Novembro Azul;
11. alto contraste;
12. dark mode;
13. light mode;
14. modo automático;
15. redução de animações.
```

As alterações devem ser auditadas.

Exemplo:

```txt
Usuário X alterou a cor primária de #0057A8 para #D63384 em 01/10/2026 08:00.
```

---

# 12. Responsividade total

Todo sistema migrado pelo OML deve ser responsivo para:

```txt
1. mobile;
2. tablet;
3. desktop;
4. telas grandes;
5. diferentes densidades de tela;
6. diferentes orientações.
```

A responsividade não deve ser apenas visual. O fluxo operacional precisa continuar claro, seguro e utilizável.

Checklist:

```txt
1. layout adaptado;
2. menu adequado;
3. tabelas responsivas;
4. formulários confortáveis;
5. botões com boa área de toque;
6. modais adaptados;
7. tooltips com alternativa mobile;
8. filtros utilizáveis;
9. ações importantes acessíveis;
10. textos sem quebra ruim;
11. cards e grids reorganizados;
12. scroll previsível;
13. cabeçalho e rodapé adaptados;
14. atalhos de teclado não obrigatórios;
15. teste visual em mobile, tablet e desktop.
```

---

# 13. Menus vertical e horizontal

O sistema deve ter dois tipos de menu:

```txt
1. menu vertical;
2. menu horizontal.
```

O usuário escolhe nas preferências.

Ambos devem ser renderizados a partir da mesma fonte de navegação.

Regra:

```txt
Toda alteração no menu deve refletir automaticamente:

1. no menu vertical;
2. no menu horizontal;
3. nos breadcrumbs;
4. na busca global;
5. no mapa de permissões;
6. na documentação da navegação.
```

---

# 14. Atalhos de teclado

O sistema deve oferecer atalhos de teclado configuráveis, documentados e acessíveis.

Os atalhos devem aparecer ao lado do botão ou item de menu com texto discreto.

Exemplos:

```txt
Colapsar/expandir tudo     Alt + C
Buscar                     Ctrl + K
Salvar                     Ctrl + S
Novo registro              Alt + N
Voltar                     Alt + V
Ajuda                      F1
```

Regra:

```txt
O OML deve validar se o atalho proposto conflita com atalhos comuns do navegador, sistema operacional ou leitores de tela.
```

O usuário deve poder configurar:

```txt
1. ativar atalhos;
2. desativar atalhos;
3. mostrar atalhos nos menus;
4. ocultar atalhos;
5. personalizar atalhos, se o projeto permitir.
```

---

# 15. Tooltips

Todo campo, botão, ação ou informação que possa gerar dúvida deve possuir tooltip semântico, acessível e padronizado.

Tooltips devem:

```txt
1. explicar para que serve;
2. ser curtos;
3. usar linguagem amigável;
4. não substituir label;
5. ser acessíveis por teclado;
6. funcionar com leitor de tela quando necessário;
7. seguir padrão visual do sistema.
```

O tempo de exibição deve ser configurável via sistema:

```txt
1. atraso para aparecer;
2. atraso para desaparecer;
3. ativar/desativar tooltips;
4. modo compacto;
5. modo educativo;
6. preferência por usuário;
7. padrão global.
```

Exemplo:

```txt
Campo: Convênio
Tooltip: Selecione o convênio que será usado neste atendimento.
```

---

# 16. Descrições amigáveis

Telas, módulos, campos e ações devem ter descrições simples.

Exemplo bom:

```txt
Usuários
Gerencie as pessoas que podem acessar o sistema e suas permissões.
```

Exemplo ruim:

```txt
CRUD de usuários.
```

---

# 17. Tutorial guiado

Fluxos importantes devem ter tutorial guiado com opção de pular.

Deve existir:

```txt
1. tutorial por módulo;
2. tutorial por fluxo crítico;
3. tutorial para primeira visita;
4. botão “Pular tutorial”;
5. botão “Ver novamente”;
6. registro de tutorial concluído por usuário;
7. conteúdo simples;
8. acessibilidade.
```

---

# 18. Central Pública de Ajuda

O sistema deve possuir uma área de ajuda para usuários finais.

Conteúdo:

```txt
1. FAQ;
2. guia por módulo;
3. tutorial por fluxo;
4. passo a passo;
5. glossário amigável;
6. dúvidas frequentes;
7. treinamentos;
8. novidades;
9. changelog amigável;
10. botão de ajuda em cada tela.
```

Exemplo:

```txt
Como cadastrar um paciente

1. Acesse Operacional > Atendimento > Pacientes.
2. Clique em Novo Paciente.
3. Preencha os dados obrigatórios.
4. Confira CPF, telefone e data de nascimento.
5. Clique em Salvar.

Resultado esperado:
o paciente ficará disponível para agendamentos, convênios e atendimentos.
```

---

# 19. Central Interna de Governança Técnica

Além da Página Visual, deve existir uma central interna para o time técnico.

Essa área deve ser protegida por autenticação, autorização granular e permissões por cargo.

Conteúdo:

```txt
1. guia de design;
2. design system;
3. tokens visuais;
4. stack;
5. arquitetura;
6. banco;
7. permissões;
8. integrações;
9. DevOps;
10. deploy;
11. rollback;
12. disaster recovery;
13. LGPD;
14. segurança;
15. auditoria;
16. observabilidade;
17. padrões de código;
18. padrões de nomenclatura;
19. padrões de testes;
20. documentação de APIs;
21. documentação de filas;
22. documentação de jobs;
23. mapa de módulos;
24. mapa de componentes;
25. mapa de rotas;
26. decisões arquiteturais;
27. histórico de mudanças;
28. relatórios do OML.
```

Permissões por cargo:

```txt
Designer:
- vê design system;
- vê tokens;
- vê componentes;
- não vê banco;
- não vê integrações sensíveis.

Desenvolvedor:
- vê arquitetura;
- vê componentes;
- vê padrões de código;
- vê testes;
- não vê secrets reais.

DevOps:
- vê deploy;
- vê ambientes;
- vê filas;
- vê logs técnicos;
- vê disaster recovery;
- não vê dados sensíveis de pacientes.

Segurança:
- vê auditoria;
- vê LGPD;
- vê permissões;
- vê riscos;
- vê relatórios de vulnerabilidade.

Administrador técnico:
- vê tudo, exceto secrets em texto puro.
```

---

# 20. Máscaras e formatação PT-BR

Todo dado exibido, digitado, exportado ou impresso deve seguir máscara e formatação adequadas ao Brasil.

Exemplos:

```txt
Moeda: R$ 1.000.350,00
Data: 10/08/2026
Hora: 08:25
Data e hora: 10/08/2026 08:25
CPF: 000.000.000-00
CNPJ: 00.000.000/0000-00
CEP: 00000-000
Telefone: (22) 99999-9999
Percentual: 15,50%
Número decimal: 1.234,56
Peso: 72,5 kg
Medida: 1,75 m
```

Isso vale para:

```txt
1. tabelas;
2. formulários;
3. relatórios;
4. PDFs;
5. exports;
6. prints;
7. tooltips;
8. mensagens;
9. guias de usuário.
```

---

# 21. Acentuação e caracteres especiais

O sistema deve suportar corretamente:

```txt
ç, á, à, â, ã, é, ê, í, ó, ô, õ, ú, ü
```

E também:

```txt
1. nomes próprios;
2. endereços;
3. descrições;
4. documentos;
5. relatórios;
6. exports CSV;
7. PDFs;
8. e-mails;
9. WhatsApp;
10. APIs;
11. logs;
12. imports.
```

O OML deve verificar:

```txt
1. UTF-8;
2. collation do banco;
3. encoding de arquivos;
4. exports;
5. imports;
6. integrações.
```

---

# 22. Acessibilidade

O sistema deve buscar acessibilidade máxima.

Baseline:

```txt
WCAG 2.2 AA
```

Buscar AAA quando viável.

O OML deve avaliar:

```txt
1. navegação por teclado;
2. foco visível;
3. leitores de tela;
4. contraste adequado;
5. alto contraste;
6. dark mode;
7. light mode;
8. ajuste de fonte;
9. redução de movimento;
10. labels reais;
11. semântica HTML;
12. ARIA quando necessário;
13. mensagens acessíveis;
14. acessibilidade para pessoas cegas;
15. acessibilidade para pessoas surdas;
16. acessibilidade motora;
17. acessibilidade cognitiva.
```

---

# 23. LGPD e privacidade

O sistema deve adotar privacidade por design e por padrão.

O OML deve mapear:

```txt
1. dados pessoais;
2. dados pessoais sensíveis;
3. base legal;
4. finalidade;
5. minimização;
6. retenção;
7. descarte;
8. anonimização;
9. pseudonimização;
10. exportação de dados;
11. correção;
12. eliminação quando permitida;
13. logs de acesso;
14. compartilhamento com terceiros;
15. consentimento quando aplicável;
16. relatório de impacto quando necessário.
```

Em sistema hospitalar, o OML não deve presumir que dados podem ser excluídos fisicamente. Deve avaliar obrigação legal, regulatória, assistencial e contábil.

---

# 24. Segurança máxima

Segurança é prioridade máxima.

O OML deve proteger:

```txt
1. senhas;
2. tokens;
3. chaves de API;
4. dados sensíveis;
5. dados pessoais;
6. dados de saúde;
7. permissões;
8. logs;
9. arquivos;
10. integrações;
11. banco;
12. sessões;
13. backups;
14. ambientes;
15. documentação interna.
```

É proibido:

```txt
1. salvar senha em código;
2. exibir token em log;
3. colocar credencial em documentação;
4. usar dados reais sensíveis em ambiente inseguro;
5. expor stack trace ao usuário;
6. criar rota sem autorização;
7. deixar arquivo sensível público;
8. exportar dados sem permissão;
9. ignorar validação server-side;
10. usar permissões genéricas demais.
```

---

# 25. Integrações

O OML deve mapear todas as integrações.

Inclui:

```txt
1. APIs externas;
2. e-mail;
3. WhatsApp;
4. SMS;
5. webhooks;
6. gateways;
7. emissão fiscal;
8. laboratórios;
9. convênios;
10. armazenamento externo;
11. filas;
12. jobs;
13. timeouts;
14. retentativas;
15. idempotência;
16. logs;
17. fallback;
18. sandbox;
19. contratos de API.
```

Nenhuma integração pode ser removida, substituída, simulada ou ignorada sem documentação e autorização explícita.

---

# 26. Imagens, arquivos e storage

O OML deve investigar como o legado armazena imagens e arquivos.

Deve descobrir:

```txt
1. imagens locais;
2. pasta pública;
3. pasta privada;
4. imagens no banco;
5. S3;
6. Cloudflare R2;
7. outro storage;
8. CDN;
9. thumbnails;
10. compressão;
11. conversão de formato;
12. política de nome de arquivo;
13. exclusão física;
14. soft delete;
15. backup;
16. controle de acesso;
17. expiração de link.
```

Política de limpeza:

```txt
Toda funcionalidade que cria, substitui ou exclui arquivos deve possuir política clara de limpeza, retenção, auditoria e recuperação.
```

Ao remover uma imagem ou arquivo, o sistema deve verificar:

```txt
1. se deve excluir fisicamente;
2. se deve manter por retenção legal;
3. se deve apenas desvincular;
4. se é usado por outro registro;
5. se possui versões;
6. se está em backup;
7. se é sensível;
8. se a exclusão deve ser auditada.
```

Fluxo recomendado:

```txt
1. usuário remove imagem;
2. sistema desvincula do registro;
3. registra auditoria;
4. agenda job de limpeza;
5. job verifica se o arquivo não é usado em outro lugar;
6. remove do storage, se permitido;
7. registra resultado.
```

---

# 27. Banco legado

O banco legado deve ser preservado.

Regra:

```txt
O Laravel deve se adaptar ao banco legado. O banco legado não deve ser alterado para se adaptar ao Laravel sem autorização explícita.
```

É proibido sem autorização:

```txt
1. alterar tabela;
2. remover tabela;
3. renomear tabela;
4. alterar coluna;
5. remover coluna;
6. alterar tipo;
7. alterar constraint;
8. apagar dados;
9. alterar registros reais.
```

O OML deve mapear:

```txt
1. tabelas lidas;
2. tabelas escritas;
3. campos afetados;
4. chaves;
5. relacionamentos reais;
6. queries;
7. exclusões;
8. inconsistências;
9. dados duplicados;
10. dados órfãos.
```

---

# 28. Ambientes reais

O OML não deve presumir que o projeto possui local, dev, homologação, staging e produção.

Deve perguntar:

```txt
1. existe ambiente local?
2. existe desenvolvimento?
3. existe homologação?
4. existe staging?
5. existe produção?
6. existe apenas banco de produção?
7. o banco é muito grande?
8. pode clonar dados?
9. pode anonimizar dados?
10. existe backup?
11. existe janela de manutenção?
12. existe equipe de infraestrutura?
13. existe restrição legal para cópia de dados?
```

Se só existir banco de produção, o OML deve operar em modo conservador:

```txt
1. leitura controlada;
2. escrita bloqueada;
3. conexão somente leitura quando possível;
4. dados sintéticos para testes;
5. subset anonimizado quando possível;
6. homologação com dados reduzidos;
7. documentação dos riscos.
```

---

# 29. Disaster Recovery

O OML deve possuir Guardião de Recuperação de Desastre.

Deve considerar:

```txt
1. backup;
2. restore;
3. RPO;
4. RTO;
5. failover;
6. rollback;
7. recuperação de banco;
8. recuperação de arquivos;
9. recuperação de filas;
10. recuperação de integrações;
11. teste real de restauração.
```

Checklist:

```txt
1. existe política de backup?
2. frequência definida?
3. backups criptografados?
4. backups fora do servidor principal?
5. teste periódico de restore?
6. RPO definido?
7. RTO definido?
8. rollback de deploy?
9. rollback por tela?
10. estratégia para falha de fila?
11. estratégia para falha de integração?
12. operações parciais tratadas?
13. idempotência?
14. auditoria de restauração?
15. plano de comunicação?
16. responsável por rollback?
17. modo manutenção?
18. health checks?
19. plano contra corrupção de dados?
20. plano contra erro humano?
21. plano contra ransomware?
22. plano para perda de arquivos?
```

---

# 30. Continuidade operacional

Além de recuperar o sistema, o hospital/empresa precisa continuar operando durante falhas.

O OML deve mapear:

```txt
1. processos manuais temporários;
2. formulários impressos;
3. responsáveis por contingência;
4. como lançar dados depois que o sistema voltar;
5. risco de duplicidade;
6. comunicação interna;
7. priorização de setores críticos;
8. tempo máximo aceitável sem sistema;
9. operação offline, se aplicável.
```

Regra:

```txt
O sistema pode falhar; a operação crítica não pode ficar sem plano.
```

---

# 31. Dossiê obrigatório por tela

Cada tela deve gerar um dossiê com:

```txt
1. Identificação
- ID da tela
- Nome da tela
- URL legado
- URL Laravel nova
- Módulo
- Status
- Responsável pela análise
- Data

2. Objetivo funcional
- O que faz
- Quem usa
- Quando usa
- Qual problema resolve

3. Fluxo operacional
- Fluxo principal
- Fluxos alternativos
- Exceções
- Estados

4. Campos
- Exibidos
- Editáveis
- Obrigatórios
- Calculados
- Máscaras
- Validações

5. Ações
- Botões
- Links
- Atalhos
- Modais
- Confirmações
- Ações em lote

6. Banco
- Tabelas lidas
- Tabelas escritas
- Campos afetados
- Queries
- Relacionamentos
- Riscos

7. Regras de negócio
- Regra
- Origem
- Evidência
- Impacto
- Teste necessário

8. Permissões
- Quem acessa
- Quem cria
- Quem edita
- Quem exclui/inativa
- Quem exporta
- Quem imprime
- Quem vê dado sensível

9. Integrações
- APIs
- E-mail
- WhatsApp
- Webhooks
- Jobs
- Filas
- Arquivos
- Falhas possíveis

10. LGPD
- Dados pessoais
- Dados sensíveis
- Base legal
- Retenção
- Exportação
- Anonimização
- Logs

11. Acessibilidade
- Teclado
- Leitor de tela
- Contraste
- Foco
- Labels
- Mensagens
- Fonte
- Alto contraste

12. Design
- Componentes usados
- Componentes novos
- Tokens
- Padrões
- IDs da Página Visual

13. Responsividade
- Mobile
- Tablet
- Desktop
- Tabelas
- Modais
- Menus
- Filtros

14. Feedbacks
- Loading
- Sucesso
- Erro
- Validação
- Falha de integração
- Confirmações

15. Auditoria
- Eventos auditáveis
- Antes/depois
- Usuário
- Data/hora
- IP/dispositivo

16. Observabilidade
- Logs
- Métricas
- Alertas
- Health checks

17. Performance
- Volume esperado
- Paginação
- Filtros
- Cache
- Queries pesadas

18. Disaster Recovery
- RPO/RTO
- Backup
- Restore
- Operações parciais
- Reprocessamento
- Idempotência

19. Continuidade operacional
- Processo manual alternativo
- Relançamento posterior
- Responsáveis
- Risco de duplicidade

20. Testes
- Unitários
- Feature
- Integração
- Regressão
- Acessibilidade
- Segurança
- Aceitação

21. Riscos e dúvidas
- Riscos encontrados
- Dúvidas abertas
- Decisões necessárias
```

---

# 32. Checklist obrigatório antes de implementar

A tela só pode ser implementada se todos os itens estiverem concluídos ou formalmente justificados:

```txt
1. dossiê funcional concluído;
2. regras de negócio documentadas;
3. banco mapeado;
4. escritas identificadas;
5. permissões mapeadas;
6. integrações mapeadas;
7. dados sensíveis identificados;
8. LGPD avaliada;
9. acessibilidade avaliada;
10. responsividade planejada;
11. design/protótipo proposto;
12. Página Visual consultada/atualizada;
13. feedbacks definidos;
14. tooltips definidos;
15. tutoriais definidos quando aplicável;
16. testes planejados;
17. auditoria definida;
18. logs/observabilidade definidos;
19. performance avaliada;
20. rollback definido;
21. disaster recovery avaliado;
22. continuidade operacional avaliada;
23. riscos documentados;
24. dúvidas críticas resolvidas;
25. implementação autorizada explicitamente.
```

---

# 33. Matriz bug legado x regra de negócio

O OML deve apresentar um resumo simples para o dev decidir.

Exemplo:

```txt
COMPORTAMENTO ENCONTRADO

Na tela de Agendamento, o sistema permite salvar consulta sem telefone do paciente.

Possíveis interpretações:
1. Pode ser uma regra antiga para cadastro rápido.
2. Pode ser um bug por falta de validação.
3. Pode ser necessário em casos de emergência.

Impacto se alterarmos:
- usuários podem ser impedidos de salvar agendamentos incompletos;
- relatórios podem melhorar;
- fluxo operacional pode ficar mais lento.

Pergunta:
Deseja manter esse comportamento no novo sistema ou transformar telefone em campo obrigatório?
```

Regra:

```txt
O OML não deve corrigir comportamento legado aparentemente errado sem autorização.
```

---

# 34. Testes

Toda regra crítica deve gerar teste ou justificativa formal.

Tipos:

```txt
1. unitários;
2. feature;
3. integração;
4. autorização;
5. validação;
6. regressão legado x novo;
7. acessibilidade;
8. segurança;
9. performance;
10. rollback;
11. restore;
12. aceitação operacional.
```

---

# 35. Auditoria

Toda ação sensível deve gerar trilha de auditoria.

Registrar:

```txt
1. quem criou;
2. quem alterou;
3. quem excluiu/inativou;
4. antes e depois;
5. data/hora;
6. IP/dispositivo quando relevante;
7. acesso a dados sensíveis;
8. exportações;
9. alteração de permissões;
10. ações administrativas.
```

---

# 36. Observabilidade

Toda operação crítica deve ser observável.

Incluir:

```txt
1. logs estruturados;
2. monitoramento de exceções;
3. métricas;
4. health checks;
5. monitoramento de filas;
6. monitoramento de integrações;
7. monitoramento de banco;
8. alertas;
9. dashboard técnico;
10. rastreamento de jobs.
```

Logs não devem vazar dados sensíveis.

Evitar logar:

```txt
1. CPF completo;
2. documentos;
3. dados clínicos;
4. tokens;
5. senhas;
6. payload sensível completo;
7. dados de cartão;
8. anexos privados.
```

---

# 37. Performance

O OML deve avaliar:

```txt
1. queries pesadas;
2. índices existentes;
3. paginação;
4. cache;
5. N+1 queries;
6. tempo de resposta;
7. relatórios grandes;
8. exportações assíncronas;
9. filas;
10. limites de timeout;
11. teste de carga.
```

Regra:

```txt
Nenhuma tela com muitos dados deve carregar tudo sem paginação, filtro ou estratégia de performance.
```

---

# 38. Guardião Contínuo

Depois da migração, o OML continua atuando como guardião de padronização.

Ele deve analisar:

```txt
1. commits;
2. novos arquivos;
3. novos componentes;
4. novas rotas;
5. novas permissões;
6. novas integrações;
7. novos pacotes;
8. novas telas;
9. alterações de design;
10. quebras de padrão.
```

Deve detectar:

```txt
1. componente novo não documentado;
2. rota nova sem permissão;
3. tela nova sem dossiê;
4. campo novo sem tooltip;
5. texto sem padrão;
6. cor hardcoded;
7. classe fora do padrão;
8. função com nome genérico;
9. variável ruim;
10. falta de teste;
11. falta de acessibilidade;
12. falta de auditoria;
13. falta de máscara;
14. falta de LGPD;
15. API nova sem inventário;
16. integração nova sem inventário;
17. pacote novo sem justificativa;
18. alteração de design sem atualizar Página Visual.
```

Relatório exemplo:

```txt
Relatório do Guardião de Padronização

Foram encontrados 7 pontos de atenção:

1. Novo componente BotaoExportar.vue não está documentado na Página Visual.
2. Rota /financeiro/exportar não possui permissão mapeada.
3. Campo valor_total não possui máscara monetária.
4. Cor #ff0000 foi usada diretamente no componente.
5. Função processarDados() possui nome genérico.
6. Nova chamada de API não está no Inventário de Integrações.
7. Tela nova não possui tutorial guiado.

Recomendação:
corrigir antes do merge.
```

---

# 39. Relatório de aprimoramento do agente

O OML deve gerar continuamente um relatório para melhorar o agente matriz no GitHub.

Arquivo:

```txt
memoria/relatorio-aprimoramento-agente.md
```

Cada melhoria deve ser classificada como:

```txt
1. núcleo genérico;
2. Laravel;
3. Vue;
4. Inertia;
5. ERP hospitalar;
6. design system;
7. permissões;
8. LGPD;
9. acessibilidade;
10. segurança;
11. DevOps;
12. documentação;
13. testes;
14. integrações.
```

Exemplo:

```md
# Relatório de Aprimoramento do Agente

## Data
16/05/2026

## Origem da melhoria
Migração da tela: Usuários

## Problema encontrado
O OML não possuía etapa específica para verificar se uma nova URL Laravel deveria ser vinculada à coluna `url_erp_laravel`.

## Classificação
- [ ] Núcleo genérico
- [x] Perfil Laravel
- [ ] Perfil Vue
- [x] Perfil ERP hospitalar
- [x] Permissões

## Sugestão
Adicionar ao Guardião de Permissões uma checagem obrigatória para estruturas paralelas de permissão entre legado e novo sistema.

## Impacto
Evita quebrar permissões do legado durante a migração incremental.

## Prioridade
Alta

## Deve virar melhoria no GitHub?
Sim.
```

---

# 40. README do GitHub

O README deve ser simples e direto.

Modelo:

```md
# OML — Orquestrador de Migração Legada

O OML ajuda desenvolvedores a modernizar sistemas legados com segurança, documentação, testes, padronização e controle por fases.

Ele não migra tudo automaticamente sem supervisão.

Ele investiga o sistema legado, cria documentação, identifica regras de negócio, mapeia banco, permissões, integrações, riscos, propõe melhorias e só implementa quando você autoriza.

## Para que serve?

Serve para migrar sistemas antigos para uma estrutura moderna sem perder regras de negócio, permissões, integrações, dados, segurança e padrões visuais.

## Como começar

1. Instale ou copie o OML no seu projeto.
2. Inicie com:

/migracao-ativar

3. Informe uma URL inicial ou peça para o OML descobrir as telas.
4. O OML conduzirá a migração por etapas.
5. Você validará decisões e autorizará avanços quando necessário.

## Ele codifica sozinho?

Não por padrão.

A implementação só acontece depois de autorização explícita.
```

---

# 41. Prompt final para a IDE

Copie e cole este bloco na IDE:

```txt
Crie um projeto chamado "OML — Orquestrador de Migração Legada".

O OML deve ser um framework/agente em português do Brasil para conduzir migrações de sistemas legados com precisão cirúrgica, super microfases, checklists, guardiões, documentação viva e governança contínua.

Todas as nomenclaturas do agente devem estar em PT-BR.

Para o perfil do nosso ERP, todo código gerado também deve estar em PT-BR, incluindo classes, funções, variáveis, métodos, constantes, componentes, rotas, comentários, testes, mensagens, documentação e tooltips.

O OML não é apenas um gerador de código. Ele deve investigar, documentar, mapear regras de negócio, mapear banco, mapear permissões, mapear integrações, propor interface, validar acessibilidade, LGPD, segurança, performance, testes, rollback, disaster recovery e continuidade operacional.

O OML deve trabalhar em super microfases. Nada deve ser feito em blocos grandes.

Cada arquivo do agente deve conter:

1. objetivo;
2. quando usar;
3. entradas esperadas;
4. ações obrigatórias;
5. ações proibidas;
6. arquivos que atualiza;
7. checklist de conclusão;
8. frase obrigatória de encerramento;
9. próximo passo.

Toda microfase deve terminar com:

"Com isso, finalizamos 100% a Microfase X — [nome da microfase]."

Toda fase deve terminar com:

"Com isso, finalizamos 100% a Fase X — [nome da fase]."

O OML deve preservar contexto em arquivos, incluindo decisões, histórico, backlog, mapa hierárquico, inventários e relatórios de aprimoramento.

O OML deve descobrir telas automaticamente, não depender apenas de lista manual de URLs.

O OML deve gerar mapa hierárquico por temas, menus, submenus, botões e URLs.

O OML deve respeitar a convivência entre legado e novo sistema. O legado deve continuar funcionando até o novo estar 100% pronto.

O OML deve estudar a estrutura de permissões real do projeto antes de propor mudanças. Quando existir estrutura como `url_erp_laravel`, ela deve ser tratada como camada paralela de permissão para o novo ERP.

O OML deve criar Página Visual com IDs únicos para todos os elementos, tokens, componentes, estados, padrões, funções visuais e variações.

O OML deve criar Central Interna de Governança Técnica com permissões por cargo.

O OML deve criar Central Pública de Ajuda, FAQ, guias de uso, tutoriais guiados e documentação amigável para usuários.

O OML deve garantir responsividade total para mobile, tablet e desktop.

O OML deve garantir máscaras e formatações PT-BR para moeda, data, hora, CPF, CNPJ, CEP, telefone, percentual, números e medidas.

O OML deve garantir suporte a acentuação e caracteres especiais.

O OML deve garantir acessibilidade, dark mode, light mode, alto contraste, tamanho de fonte, redução de movimento e suporte a leitores de tela.

O OML deve garantir segurança máxima, protegendo senhas, tokens, dados sensíveis, dados pessoais, dados de saúde, logs, arquivos, backups, integrações e documentação interna.

O OML deve mapear imagens, arquivos e storage, incluindo storage local, S3, R2, CDN, banco, pastas públicas, pastas privadas, thumbnails, compressão, backup e política de limpeza.

O OML deve atuar após a migração como guardião contínuo, analisando commits, novos arquivos, componentes, rotas, permissões, integrações e padrões quebrados.

O OML deve gerar relatório de aprimoramento do agente para evoluir o núcleo genérico e perfis específicos como Laravel, Vue, Inertia, ERP hospitalar, design, segurança, permissões e integrações.

Crie a estrutura completa de diretórios, documentos, comandos, fases, guardiões, protocolos e templates conforme esta especificação.
```

---

Com isso, você tem uma especificação consolidada para a IDE gerar a base do **OML — Orquestrador de Migração Legada**.

