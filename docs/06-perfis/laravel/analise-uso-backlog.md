# Análise de Uso × Backlog — Laravel

Implementação Laravel do `docs/03-guardioes/guardiao-mapa-uso-backlog.md`. Resolve o status de migração de cada tela legada cruzando o log de acesso real × `memoria/backlog-telas.yaml` (`rota_laravel`) × navegabilidade da rota.

## Resolvedor de status (regras Laravel)

Para cada rota do backlog, ao decidir status e link:

1. **Rota GET navegável** → `migrada`; gera link direto e o botão **Novo** (deep-link).
2. **Rota de ação (não-GET)** — POST como `processar_*`, `salvar_*`, etc.:
   - **Fallback ação→tela**: tentar o `modulo.recurso.index` (GET) do **mesmo grupo** de rotas e linkar para a tela onde a função vive.
   - Sem isso, ações migradas apareciam como "migrada sem link" (falso negativo de navegabilidade).
3. **URL de diretório** do legado (sem `.php`, ex.: `/erp/npsv2/`):
   - **Tolerar** resolvendo para o `index.php` do módulo antes de concluir que não casa.
   - Sem isso, a tela dava impressão de **não-migrada** por mismatch de URL.
4. **Sem correspondência** no backlog → `não resolvida` (nunca "migrada" por suposição).

## Por que importa
- Endpoints de ação migrados (POST) não devem aparecer como não-migrados só por não serem GET.
- URLs de diretório do legado não devem ser descartadas por não terminarem em arquivo.
- O backlog (`rota_laravel`) continua sendo a **fonte única** do vínculo legado→novo.

## Relacionado
- `docs/03-guardioes/guardiao-mapa-uso-backlog.md` (padrão genérico)
- `docs/06-perfis/erp-hospitalar-laravel-vue-inertia/permissoes-url-erp-laravel.md`
- `docs/04-protocolos/protocolo-esteira-urls.md`
