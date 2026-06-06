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
- **Aposentar (esconder/marcar deprecated)** se: sem uso atual, mas com chance real de retorno ou risco de remoção.
- **Remover** se: comprovadamente sem uso, sem referência, sem valor futuro — **e** com backup/histórico.

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
- [ ] Salvaguardas aplicadas (alvo inspecionado; nada que terceiros leiam foi removido às cegas)
- [ ] Remoções com backup/histórico e commitadas separadamente
- [ ] Decisões registradas em `decisoes.md` / `historico-migracao.md`

## Relacionado
- [Fase 17 — Conciliação](../02-fases/fase-17-conciliacao-pos-migracao.md), [Fase 18 — Encerramento](../02-fases/fase-18-encerramento-tela-modulo.md), [Fase 19 — Guardião Contínuo](../02-fases/fase-19-guardiao-continuo.md)
- [Guardião de Limpeza de Arquivos](../03-guardioes/guardiao-limpeza-arquivos.md), [Auto-limpeza/Refatoração](../00-visao-geral/politica-auto-limpeza-refatoracao.md)
- [Mapa de Uso × Backlog](../03-guardioes/guardiao-mapa-uso-backlog.md), [Protocolo Pós Go-Live](protocolo-pos-go-live.md)
