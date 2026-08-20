# Protocolo de Decomissionamento e Enxugamento Pós-Entrega

## Objetivo
Definir, **após uma migração concluída ou um projeto finalizado**, o que **manter**, o que **aposentar** e o que **remover** — para o sistema não acumular módulos órfãos, scaffolds mortos, andaimes de migração e ferramentas que perderam sentido.

## Quando usar
- Migração: quando todas as telas de um módulo (ou do sistema) estão migradas e homologadas (após Fase 17/18).
- Construção: quando o escopo planejado foi entregue e estabilizou.
- Periodicamente, como parte do [guardião contínuo](../02-fases/fase-19-guardiao-continuo.md).

> Princípio: **nada some sem rastro**. Toda remoção é decidida, registrada e reversível por histórico.

---

## Parte A — Decomissionar o legado (só migração)

1. **Confirmar paridade e conciliação** completas (Fases 14 e 17) do que o legado fazia.
2. **Definir período de convivência** (legado em leitura/standby) antes de desligar — alinhar com [convivência legado×novo](../03-guardioes/guardiao-convivencia-legado-novo.md) e [continuidade operacional](../03-guardioes/guardiao-continuidade-operacional.md).
3. **Retenção de dados:** quanto tempo manter o banco/arquivos do legado (obrigações legais, auditoria, LGPD — ver [LGPD](../03-guardioes/guardiao-lgpd-privacidade.md)).
4. **Backup final** do legado, com [disaster recovery](../03-guardioes/guardiao-recuperacao-desastre.md), **antes** de desligar.
5. **Desligamento faseado:** read-only → standby → desligado → arquivado. Registrar cada passo em `memoria/historico-migracao.md`.

---

## Parte B — Enxugar o projeto novo (módulos órfãos)

### O que caça
| Tipo de órfão | Exemplo | Ação default |
|---|---|---|
| **Scaffold morto** | Model/Controller gerado e nunca usado (`scaffolds-suspeitos.md`) | Remover após confirmar sem uso |
| **Feature não adotada** | Tela construída que ninguém acessa (zero uso) | Avaliar com o dev: manter, esconder ou remover |
| **Andaime de migração** | Scripts de import, telas-ponte, *feature flags* de rollout já 100% | Remover após go-live consolidado |
| **Código morto** | Funções/rotas/imports sem referência | Remover (auto-limpeza) |
| **Dependência órfã** | Lib instalada e não usada | Remover (alinha com `composer/npm audit`) |
| **Conteúdo temporário** | Dados de teste, `.skip`/`xfail`, TODOs datados vencidos | Remover/limpar |

> Cruzar com o [Mapa de Uso × Backlog](../03-guardioes/guardiao-mapa-uso-backlog.md): só é "órfão" o que **não** está no backlog **nem** em uso.

### Regra de decisão (manter × aposentar × remover)
- **Manter** se: está em uso, no backlog, é exigência legal/auditoria, ou é infraestrutura transversal (a11y, tema, observabilidade).
- **Aposentar (esconder/marcar deprecated)** se: sem uso atual, mas com chance real de retorno ou risco de remoção — **ou o legado dela ainda está no ar**. Como se faz: [Parte C](#parte-c--como-aposentar-uma-tela-os-dois-informativos).
- **Remover** se: comprovadamente sem uso, sem referência, sem valor futuro — **e** com backup/histórico.

---

## Parte C — Como APOSENTAR uma tela (os dois informativos)

Aplica-se quando a decisão foi **aposentar**, não remover — tipicamente porque a tela já tem
substituta mas a **versão legada dela continua em produção**, governada pela mesma linha do
catálogo de permissões. Nesse caso apagar só o lado novo não fecha porta nenhuma: quem tem a
permissão continua entrando pelo legado, e ainda se perde o registro de que a tela existiu.

> 🔑 **A regra é: dois informativos, sempre os dois.** Um só não resolve, porque as duas
> pessoas que precisam saber nunca são a mesma.

| Onde | Quem lê | Por que sem ele não funciona |
|---|---|---|
| **Na própria página** | quem ainda abre a tela por URL ou favorito | é onde a pessoa está prestes a confiar num número velho |
| **Na área de permissões do TI** | quem monta grupo e quem libera acesso novo | é a única lista onde a tela aposentada ainda aparece — o problema de uma tela morta é justamente **ninguém abrir**, então o aviso da página nunca alcança quem continua distribuindo a permissão dela |

### Passos

1. **Registrar** a tela numa lista única (chave = identificador da tela no sistema novo), com:
   motivo **medido**, tela substituta, data, caminho do legado que continua no ar, os pontos de
   código a remover no dia da limpeza, e — o campo que decide se a exclusão será limpa ou
   destrutiva — **o que precisa ser preservado antes** (`guardar`). `guardar: null` é uma
   afirmação forte e só se escreve depois de olhar.
2. **Tirar dos menus** (menu lateral e painel do módulo). Rota e permissões ficam **intactas**:
   quem precisa conferir um histórico continua chegando por URL.
3. **Informativo na página**, montado no *layout* e alimentado pela lista — nunca escrito à mão
   dentro de cada página, senão marcar a próxima tela vira "lembrar de repetir do jeito certo".
4. **Selo na área de permissões**, na mesma linha do nome da tela, nas telas de grupo E de
   usuário — mais um **filtro "em desuso"** ao lado dos filtros que já existem lá. O selo
   avisa quem passa por acaso; o filtro é o que **fecha o levantamento de limpeza**, porque
   num catálogo de centenas de telas achar as aposentadas uma a uma é o que faz o trabalho
   nunca terminar. O filtro se esconde quando não há nenhuma marcada.
   ⚠️ Conferir o que a marcação em lote ("marcar visíveis/todas") faz com o filtro ligado:
   se ela opera sobre o que está VISÍVEL, ligar o filtro e clicar concede todas as
   aposentadas de uma vez — o oposto da intenção de quem foi ali limpar.
5. **Não bloquear e não esconder** o conteúdo. Quem chegou ali foi conferir alguma coisa;
   tirar a tela da frente troca um incômodo por uma pergunta sem resposta.

### Sinalização
O sinal visual é o **padrão** (hachura/listra), não a cor: cor sozinha colide com a paleta da
marca, com o vermelho de erro e com o verde de sucesso, e desaparece para quem não distingue
matiz.

### 🔴 Efeito colateral obrigatório de conferir
Tirar do menu **mata o breadcrumb** em qualquer projeto cuja trilha seja montada a partir do
menu. Passe o título da página explicitamente ao layout, ou a tela fica sem trilha nenhuma.

---

## Salvaguardas (não remover por engano)
- **Olhar o alvo antes:** se o que se encontra contradiz a descrição de "órfão" (ex.: rota usada por job/integração externa), **parar e reportar**, não remover (ver [guardião de integrações](../03-guardioes/guardiao-integracoes.md)).
- **Nunca** remover algo que outra app **lê** enquanto outra **escreve** (régua dos sujeitos de escrita — ver [banco de dados](../03-guardioes/guardiao-banco-dados.md)).
- Toda remoção entra como tarefa no [`/push`](protocolo-push.md), commitada separadamente e descrita.

## Saída
- `memoria/decisoes.md`: o que foi mantido/aposentado/removido e por quê.
- `memoria/historico-migracao.md`: passos de decomissionamento do legado.
- Relatório de enxugamento (reaproveitar [dívida técnica](../05-templates/relatorio-divida-tecnica.template.md)).

## Checklist
- [ ] Legado: paridade+conciliação ok, retenção definida, backup final, desligamento faseado registrado
- [ ] Órfãos do projeto novo identificados via Mapa de Uso × Backlog + scaffolds suspeitos
- [ ] Cada item classificado: manter / aposentar / remover (com motivo)
- [ ] Aposentados: registrados na lista única (com `guardar`), fora dos menus, e com os **dois** informativos — na página E na área de permissões do TI
- [ ] Aposentados: breadcrumb conferido depois de sair do menu
- [ ] Salvaguardas aplicadas (alvo inspecionado; nada que terceiros leiam foi removido às cegas)
- [ ] Remoções com backup/histórico e commitadas separadamente
- [ ] Decisões registradas em `decisoes.md` / `historico-migracao.md`

## Relacionado
- [Fase 17 — Conciliação](../02-fases/fase-17-conciliacao-pos-migracao.md), [Fase 18 — Encerramento](../02-fases/fase-18-encerramento-tela-modulo.md), [Fase 19 — Guardião Contínuo](../02-fases/fase-19-guardiao-continuo.md)
- [Guardião de Limpeza de Arquivos](../03-guardioes/guardiao-limpeza-arquivos.md), [Auto-limpeza/Refatoração](../00-visao-geral/politica-auto-limpeza-refatoracao.md)
- [Mapa de Uso × Backlog](../03-guardioes/guardiao-mapa-uso-backlog.md), [Protocolo Pós Go-Live](protocolo-pos-go-live.md)
