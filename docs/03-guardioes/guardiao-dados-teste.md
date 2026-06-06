# Guardião de Dados de Teste

## Missão
Dados sintéticos, anonimização, dumps seguros, proibir dados sensíveis locais, expirar dumps antigos, criptografar cópias.

## Regra
Ambiente local e homologação não devem expor dados sensíveis reais sem anonimização.

---

## Dado fake para validação controlada (sujeito 3 do `guardiao-banco-dados.md`)
O agente **pode** criar dado sintético para validar um fluxo end-to-end (validação/cálculo/fluxo) **sem esperar o Gate 2**, desde que:
- seja **sempre sintético** — nunca sobre dado de produção;
- tenha **escopo controlado** e seja **removido logo após** a validação;
- a validação fique registrada (o que foi testado e o resultado).

Isso valida a paridade comportamental cedo, sem violar a proibição de escrita destrutiva do agente sobre dado real (sujeito 2 do `guardiao-banco-dados.md`).
