# /migracao-bloquear

## Objetivo

Bloquear uma tela ou módulo, impedindo avanço até que uma pendência seja resolvida.

## Quando usar

Quando houver risco, dúvida crítica ou dependência não resolvida.

## Entradas esperadas

ID da tela e motivo do bloqueio.

## Ações obrigatórias

- [ ] Registrar motivo do bloqueio
- [ ] Atualizar status da tela para `bloqueada`
- [ ] Registrar em `memoria/pendencias.md`

## Ações proibidas

- [ ] Não continuar implementação de tela bloqueada

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status → `bloqueada`)
- `memoria/pendencias.md`

## Frase obrigatória de encerramento

"Tela [NOME] bloqueada. Motivo: [MOTIVO]."

## Próximo passo

Resolver a pendência e usar `/migracao-retomar [ID]`.

---

# /migracao-retomar

## Objetivo

Retomar uma tela ou módulo previamente bloqueado.

## Quando usar

Quando a pendência que causou o bloqueio for resolvida.

## Entradas esperadas

ID da tela bloqueada.

## Ações obrigatórias

- [ ] Verificar se a pendência foi resolvida
- [ ] Atualizar status da tela para o estado anterior ao bloqueio
- [ ] Registrar resolução em `memoria/pendencias.md`
- [ ] Registrar decisão em `memoria/decisoes.md`

## Ações proibidas

- [ ] Não retomar sem resolver a pendência original

## Arquivos que atualiza

- `memoria/backlog-telas.yaml` (status → estado anterior)
- `memoria/pendencias.md`
- `memoria/decisoes.md`

## Frase obrigatória de encerramento

"Tela [NOME] retomada. Pendência resolvida: [DESCRIÇÃO]."

## Próximo passo

Continuar do ponto onde parou.
