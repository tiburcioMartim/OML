# Guardião de Pendências Humanas

## Missão
Registrar e cobrar, em fonte única, as tarefas que **só um humano pode executar** — coisas fora do alcance do agente (provisionar VPS, apontar DNS, gerar chave de produção de gateway, assinar contrato). Garante que o dev não "se perca nas próprias obrigações" depois e que nada dependente delas seja dado como pronto em produção sem aviso.

## Regra
Sempre que uma feature/tela depender de uma ação que **o OML não consegue fazer**, o agente **registra a pendência** em `memoria/pendencias-humanas.md`, **vincula** à tela/feature afetada e **bloqueia o avanço para produção** daquilo que depende dela — sem bloquear o desenvolvimento local quando este puder seguir com stub/sandbox.

## Quando ativo
Sempre, nos três modos. Atua junto à [Definição de Pronto](../00-visao-geral/definicao-de-pronto.md): "pronto em dev" ≠ "pronto em produção" enquanto houver pendência humana aberta vinculada.

---

## O que conta como pendência humana

| Categoria | Exemplos |
|---|---|
| **Infraestrutura** | Provisionar/configurar VPS ou servidor; criar banco gerenciado; configurar firewall; dimensionar recursos |
| **Domínio e rede** | Registrar domínio; apontar DNS; configurar SPF/DKIM/DMARC; emitir/renovar certificado SSL quando manual |
| **Credenciais de produção** | Chaves **de produção** de gateway de pagamento, gateways de SMS/e-mail, APIs externas, mapas, push |
| **Aprovações de terceiros** | Liberação de app store; homologação de PSP/banco; aprovação de API parceira; revisão de OAuth |
| **Legal / Compliance** | Texto da Política de Privacidade e Termos; DPA/contrato de operador; nomeação de DPO (alinhar com [LGPD](guardiao-lgpd-privacidade.md)) |
| **Acessos e contas** | Criar conta em provedor; convidar OML/dev no projeto; permissões em repositório/registry |
| **Ferramental** | Instalar plugin do Claude recomendado (ver [protocolo de plugins](../04-protocolos/protocolo-plugins-claude.md)) — categoria **opcional** |
| **Dados reais** | Carga inicial que só o cliente possui; segredos que só o dono detém |

> O agente **nunca inventa** uma credencial nem finge configurar infra. Se falta, vira pendência humana — explícita.

---

## Registro (campos obrigatórios)
Cada item em `memoria/pendencias-humanas.md` tem:
- **ID** (`PH-001`), **título** e **categoria**
- **Por que só o humano faz** (ex.: requer acesso ao painel do provedor)
- **Quem** é o responsável (dev/cliente/terceiro)
- **Bloqueia o quê** (telas/features/rollout vinculados)
- **Severidade do bloqueio:** 🔴 bloqueia produção · 🟡 bloqueia homologação · ⚪ opcional
- **Status:** aberta · em andamento · resolvida · dispensada
- **Como destravar** (passo prático para o humano) e **stub/sandbox** usado enquanto isso

## Ciclo de vida
1. **Detecção:** ao planejar/implementar, o OML identifica a dependência humana e cria o item.
2. **Continuidade local:** se der para seguir com sandbox/stub/`.env.example`, segue — e marca a feature como "pronto em dev, aguardando PH-xxx".
3. **Cobrança:** o item aparece no `/migracao-status` e em todo Gate (Design/Homologação) e no go-live.
4. **Gate de produção:** rollout/encerramento **não** declara algo "pronto em produção" com PH 🔴 aberta vinculada.
5. **Resolução:** o dev confirma; o OML valida o efeito (ex.: DNS resolvendo, webhook recebendo) e fecha.

---

## Checklist
- [ ] Toda dependência fora do alcance do agente virou item em `memoria/pendencias-humanas.md`
- [ ] Cada item diz o que bloqueia e a severidade (🔴/🟡/⚪)
- [ ] Desenvolvimento local seguiu com stub/sandbox quando possível (sem fingir produção)
- [ ] `/migracao-status` e os Gates exibem pendências abertas
- [ ] Nada com PH 🔴 aberta foi declarado "pronto em produção"

## Impacto em outros guardiões
- **[Definição de Pronto](../00-visao-geral/definicao-de-pronto.md):** parametriza "pronto em produção".
- **[Segredos e Credenciais](guardiao-segredos-credenciais.md):** chaves de produção entram como pendência, nunca no código.
- **[Deploy/Rollback](guardiao-deploy-rollback.md) e [Disaster Recovery](guardiao-recuperacao-desastre.md):** infra provisionada é pré-requisito de rollout.
- **[Protocolo de Plugins](../04-protocolos/protocolo-plugins-claude.md):** instalar plugin é pendência humana opcional.
