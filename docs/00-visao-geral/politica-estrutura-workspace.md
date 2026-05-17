# Política de Estrutura de Workspace

## Objetivo

Garantir que os diretórios do projeto de migração estejam organizados corretamente, com separação clara entre o sistema legado, o novo sistema e o OML.

## Quando usar

Sempre. Esta política deve ser verificada no momento da ativação (`/migracao-ativar`) e antes de criar qualquer diretório novo.

---

## Regra Obrigatória — Diretórios Irmãos (Sibling)

O OML, o sistema legado e o novo sistema **devem** ser diretórios irmãos (siblings) dentro de um diretório raiz de migração. **Nunca** um dentro do outro.

### Estrutura correta ✅

```
/diretorio-raiz-migracao/
    ├── /erp-legado/       ← Sistema legado (somente leitura/consulta)
    ├── /erp-novo/         ← Novo sistema (nome definido pelo dev)
    └── /OML/              ← Orquestrador de Migração Legada
```

### Estruturas proibidas ❌

```
# PROIBIDO — OML dentro do legado
/erp-legado/
    └── /OML/

# PROIBIDO — Novo sistema dentro do legado
/erp-legado/
    └── /erp-novo/

# PROIBIDO — OML dentro do novo sistema
/erp-novo/
    └── /OML/

# PROIBIDO — Novo sistema dentro do OML
/OML/
    └── /erp-novo/

# PROIBIDO — Legado dentro do OML
/OML/
    └── /erp-legado/
```

---

## Justificativa técnica

| Motivo | Explicação |
|---|---|
| **Isolamento de Git** | Cada projeto pode ter seu próprio repositório Git sem conflitos de submódulos não intencionais |
| **Separação de dependências** | `composer.json`, `package.json` e `.env` do legado não conflitam com os do novo sistema |
| **Busca global limpa** | O editor (VS Code, PHPStorm) não mistura resultados de busca entre projetos |
| **Deploy independente** | O servidor de produção/homologação aponta diretamente para a pasta do novo sistema sem ignorar arquivos do legado |
| **Contexto limpo para a IA** | O agente de IA trabalha com escopo claro, sem confundir arquivos do legado com o novo |

---

## Verificação automática na ativação

Ao executar `/migracao-ativar`, o OML **deve** verificar a estrutura de diretórios e agir conforme o resultado:

### Cenário 1 — Estrutura correta

O OML confirma a estrutura e segue normalmente.

> "✅ Estrutura de workspace validada. OML, legado e novo sistema são diretórios irmãos."

### Cenário 2 — OML está dentro do legado ou do novo sistema

O OML **deve**:

1. Identificar o diretório pai correto (o diretório "avô" do OML atual)
2. Informar o dev sobre o problema
3. Solicitar confirmação para mover o OML para o local correto
4. Executar a movimentação
5. Registrar a correção em `memoria/decisoes.md`

> "⚠️ Detectei que o OML está dentro do diretório do legado (`/erp-legado/OML/`). O correto é que o OML seja irmão do legado. Posso mover o OML para `/diretorio-raiz/OML/`? (sim/não)"

### Cenário 3 — Não é possível determinar a estrutura

O OML pergunta ao dev:

> "Não consegui determinar a estrutura do workspace. Por favor, informe:
> 1. Qual é o diretório raiz do projeto de migração?
> 2. Qual é o caminho do sistema legado?
> 3. Onde está (ou onde devo criar) o novo sistema?"

---

## Criação do diretório do novo sistema

Quando o OML precisar criar o diretório para o novo sistema (geralmente na Fase 00 ou ao configurar o projeto), ele **deve**:

1. **Perguntar o nome** do diretório ao dev:
   > "Qual nome você deseja para o diretório do novo sistema? Exemplo: `erp-novo`, `sistema-moderno`, `app-v2`"

2. **Criar o diretório como irmão** do OML e do legado (no diretório raiz de migração)

3. **Nunca criar dentro** do legado, do OML ou de qualquer subdiretório

4. **Registrar** o caminho do novo sistema em `memoria/decisoes.md` e no perfil do projeto

### Exemplo de fluxo

```
Dev: /migracao-configurar-projeto
OML: "Qual nome deseja para o diretório do novo sistema?"
Dev: "novo-erp"
OML: (cria /diretorio-raiz/novo-erp/ como irmão do legado e do OML)
OML: "✅ Diretório criado em /diretorio-raiz/novo-erp/"
```

---

## Variáveis de referência

O OML deve manter internamente (no perfil do projeto) os caminhos absolutos:

| Variável | Descrição | Exemplo |
|---|---|---|
| `diretorio_raiz` | Diretório pai que contém todos os projetos | `/migrando/` |
| `diretorio_legado` | Caminho do sistema legado | `/migrando/erp-legado/` |
| `diretorio_novo` | Caminho do novo sistema | `/migrando/novo-erp/` |
| `diretorio_oml` | Caminho do OML | `/migrando/OML/` |

---

## Checklist

- [ ] Estrutura de diretórios validada na ativação
- [ ] OML é irmão do legado (não está aninhado)
- [ ] Nome do diretório do novo sistema definido pelo dev
- [ ] Diretório do novo sistema criado como irmão
- [ ] Caminhos registrados no perfil do projeto
- [ ] Decisão registrada em `memoria/decisoes.md`
