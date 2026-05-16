# /migracao-propor-interface

## Objetivo

Propor o protótipo visual da tela migrada, usando componentes da Página Visual e tokens do design system.

## Quando usar

Após o dossiê funcional estar concluído.

## Entradas esperadas

ID da tela com dossiê concluído. Exemplo: `/migracao-propor-interface TELA-0001`

## Ações obrigatórias

- [ ] Consultar Página Visual e tokens existentes
- [ ] Propor layout responsivo (mobile, tablet, desktop)
- [ ] Referenciar componentes pelos IDs da Página Visual
- [ ] Incluir estados (loading, vazio, erro, sucesso)
- [ ] Incluir feedbacks (toast, validação, confirmação)
- [ ] Incluir tooltips e descrições amigáveis
- [ ] Incluir breadcrumbs
- [ ] Avaliar necessidade de tutorial guiado
- [ ] Documentar componentes novos necessários
- [ ] Atualizar Página Visual se houver componente novo

## Ações proibidas

- [ ] Não implementar código
- [ ] Não usar cores hardcoded
- [ ] Não criar componente sem documentar na Página Visual
- [ ] Não ignorar responsividade

## Arquivos que atualiza

- Dossiê da tela (seção Design)
- `memoria/inventario-componentes.md` (se houver novos)
- `memoria/backlog-telas.yaml` (status → `prototipo_concluido`)

## Checklist de conclusão

- [ ] Protótipo proposto
- [ ] Componentes referenciados por ID
- [ ] Responsividade considerada
- [ ] Componentes novos documentados
- [ ] Estados e feedbacks incluídos

## Frase obrigatória de encerramento

"Com isso, finalizamos 100% o Protótipo Visual da tela [NOME]."

## Próximo passo

`/migracao-planejar-implementacao [ID]`
