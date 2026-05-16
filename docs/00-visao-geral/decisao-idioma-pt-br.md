# Decisão de Idioma — PT-BR

## Objetivo

Estabelecer que todo o OML e todo código gerado devem usar português do Brasil.

## Quando usar

Sempre que criar, editar ou revisar qualquer arquivo do agente ou do projeto migrado.

---

## Declaração permanente

Todo o OML deve operar 100% em português do Brasil.

### O que deve estar em PT-BR

**No agente:**
1. Nomes dos comandos
2. Documentação
3. Comentários
4. Templates
5. Relatórios
6. Nomes dos guardiões
7. Nomes das fases
8. Nomes dos status
9. Exemplos
10. Mensagens
11. Checklists
12. Arquivos
13. Instruções internas
14. Documentação do GitHub

**No código gerado (para o perfil ERP):**
1. Classes
2. Funções
3. Métodos
4. Variáveis
5. Constantes
6. Componentes
7. Rotas
8. Arquivos
9. Pastas
10. Comentários
11. Testes
12. Mensagens
13. Tooltips
14. Documentação técnica
15. Documentação de usuário
16. Seeders
17. Factories
18. Policies
19. Services
20. Actions
21. Requests
22. Resources

### Exceções permitidas

1. Nomes obrigatórios do framework (ex: `middleware`, `Controller`, `Migration`)
2. Métodos herdados do Laravel (ex: `boot()`, `render()`, `handle()`)
3. Contratos de bibliotecas externas
4. APIs de terceiros
5. Termos técnicos inevitáveis já padronizados (ex: `id`, `timestamp`, `hash`)

### Exemplo

```php
// ✅ Correto
class CriarAgendamentoPacienteAction
{
    public function executar(array $dadosDoAgendamento): Agendamento
    {
        //
    }
}

// ❌ Incorreto
class CreatePatientAppointmentAction
{
    public function handle(array $appointmentData): Appointment
    {
        //
    }
}
```

### Regra

Não misturar inglês e português sem justificativa técnica inevitável.
