# Guardião de Máscaras e Formatação

## Missão
Garantir que **todo** dado com padrão de apresentação seja exibido formatado (PT-BR) e capturado com máscara consistente — em uma **fonte única** (`useMasks()`), nunca com regex copiado por campo.

## Regra-dura
1. **Nunca exibir dado bruto** ao usuário quando houver formatação esperada (CPF, dinheiro, data, telefone, %…).
2. **Separar exibição de armazenamento:** mascarar/formatar na **borda** (UI). No banco/API, guardar o **valor normalizado** (só dígitos para documentos/telefone; `decimal` para dinheiro; ISO-8601 para datas). Nunca persistir a string mascarada.
3. **Uma fonte só:** toda máscara/format vem do composable [`useMasks()`](../06-perfis/vue/composables-obrigatorios.md). Reescrever lógica de máscara é violação.

## Quando ativo
Sempre, nos três modos. Em migração, espelhar as máscaras que o legado usa; em construção, aplicar o catálogo de berço.

---

## Catálogo de máscaras (PT-BR) — cobrir todas

| Dado | Exibição | Armazenamento | Observações |
|---|---|---|---|
| **CPF** | `000.000.000-00` | 11 dígitos | validar dígito verificador |
| **CNPJ** | `00.000.000/0000-00` | 14 dígitos | validar DV; CPF/CNPJ dinâmico se campo aceita ambos |
| **RG** | conforme UF | dígitos + dígito final (pode ter `X`) | formato varia por estado |
| **Telefone/Celular** | `(00) 0000-0000` / `(00) 00000-0000` | DDD+número (dígitos) | alternar 8/9 dígitos; +55 quando internacional |
| **CEP** | `00000-000` | 8 dígitos | integrar busca de endereço quando houver |
| **Dinheiro (BRL)** | `R$ 1.234,56` | `decimal(p,2)` em centavos/decimal | nunca `float`; alinhar à direita |
| **Percentual** | `15,50%` | `decimal` | vírgula decimal |
| **Data** | `dd/mm/aaaa` | `date`/ISO `aaaa-mm-dd` | nunca exibir ISO cru |
| **Data e hora** | `dd/mm/aaaa hh:mm` | `datetime`/ISO + fuso | respeitar timezone (ver i18n) |
| **Hora** | `hh:mm` (`hh:mm:ss` se relevante) | `time` | |
| **Número/Quantidade** | `1.234,567` | numérico | separador de milhar `.`, decimal `,` |
| **Placa veicular** | `ABC-1234` / `ABC1D23` (Mercosul) | normalizada | aceitar os dois formatos |
| **Cartão de crédito** | `0000 0000 0000 0000` | **não armazenar** (tokenizar) | PCI: nunca persistir PAN; ver LGPD/segurança |
| **PIX/Chave** | conforme tipo (CPF/CNPJ/e-mail/tel/aleatória) | normalizada por tipo | validar por tipo de chave |
| **Inscrição estadual** | por UF | dígitos | regra por estado |
| **Processo (CNJ)** | `0000000-00.0000.0.00.0000` | dígitos | quando aplicável ao domínio |

> Domínios específicos (saúde, jurídico, fiscal) podem ter máscaras próprias — registrar no perfil e adicionar ao catálogo do projeto.

---

## Comportamento de entrada (UX da máscara)
- **Colar (paste)** texto sujo deve ser limpo e remascarado (ex.: colar `cpf 123.456...` → normaliza).
- **Cursor** não pode "pular" de forma errática ao digitar; máscara não bloqueia edição/apagar.
- **Validação** acompanha a máscara: DV de CPF/CNPJ, faixa de data, telefone com DDD válido.
- **Mobile:** `inputmode`/`type` corretos (`inputmode="numeric"` para documentos, teclado numérico).
- **Limpeza no submit:** enviar valor normalizado ao backend, não a string com pontuação.

## Acessibilidade da máscara
- Campo mascarado tem **label real** e, quando útil, **dica de formato** (`aria-describedby`, ex.: "Formato: 000.000.000-00").
- Erro de formato anunciado a leitor de tela (`aria-invalid` + mensagem associada).
- Não depender só de placeholder como instrução (placeholder some ao digitar).

## Backend também formata
Relatórios, PDFs, e-mails e exports seguem as **mesmas** máscaras (helper PT-BR no backend). Máscara não é só de tela — é de toda saída ao humano. PII em exports/logs segue a [LGPD](guardiao-lgpd-privacidade.md) (mascarar quando não essencial, ex.: `***.456.789-**`).

## Checklist
- [ ] Todo campo formatável usa `useMasks()` (sem regex duplicado)
- [ ] Exibição mascarada × armazenamento normalizado (separados)
- [ ] DV/validação aplicados (CPF, CNPJ, etc.)
- [ ] Paste, cursor, mobile (`inputmode`) e limpeza no submit corretos
- [ ] Dica de formato acessível + erro anunciado
- [ ] Backend (relatórios/PDF/e-mail/export) formata igual
- [ ] Cartão/PAN nunca persistido; PII mascarada em logs/exports

## Impacto em outros guardiões
- **[Composables Obrigatórios](../06-perfis/vue/composables-obrigatorios.md):** `useMasks()` é a fonte única.
- **[i18n/Localização](guardiao-internacionalizacao-localizacao.md):** datas/moeda/fuso/separadores.
- **[LGPD](guardiao-lgpd-privacidade.md) e [Segurança](guardiao-seguranca.md):** mascaramento de PII e não-persistência de dados de cartão.
- **[Reúso de Componentes](guardiao-reuso-componentes.md):** o input mascarado é um componente canônico.
