# Instala/atualiza os comandos do OML como slash commands GLOBAIS em ~/.claude/commands/
# (autocomplete em qualquer pasta, nao so dentro do clone do OML).
#
# Como funciona: copia cada comando de <OML>/.claude/commands/ e troca o caminho
# relativo do doc (docs/01-comandos/) pelo caminho ABSOLUTO deste OML, para o
# comando funcionar a partir de qualquer diretorio. O conteudo PT-BR (com acentos)
# vem dos proprios arquivos lidos do disco -- por isso este script e ASCII puro
# (evita problemas de encoding do Windows PowerShell 5.1).
#
# Idempotente: re-rode apos /oml-atualizar para pegar comandos novos.
# Precedencia: comandos do projeto e do clone do OML vencem estes globais quando
# voce esta dentro dessas pastas; os globais valem no resto.
#
# Uso (a partir da raiz do OML):
#   powershell -File scripts\instalar-comandos-globais.ps1

$ErrorActionPreference = 'Stop'

$omlRoot = Split-Path $PSScriptRoot -Parent
$src  = Join-Path $omlRoot '.claude\commands'
$dest = Join-Path $HOME '.claude\commands'

if (-not (Test-Path $src)) { throw "Origem nao encontrada: $src (rode dentro do clone do OML)" }
if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }

# Caminho absoluto do doc, com barras normais (funciona em qualquer CWD).
$abs = ($omlRoot -replace '\\','/') + '/docs/01-comandos/'
$enc = New-Object System.Text.UTF8Encoding($false)   # UTF-8 sem BOM (arquivos .md)
$n = 0

Get-ChildItem -Path $src -Filter '*.md' | ForEach-Object {
  $c = [System.IO.File]::ReadAllText($_.FullName)     # le UTF-8 (acentos preservados)
  $c = $c.Replace('docs/01-comandos/', $abs)          # relativo -> absoluto deste OML
  [System.IO.File]::WriteAllText((Join-Path $dest $_.Name), $c, $enc)
  $n++
}

Write-Host "OK: $n comandos globais em $dest"
Write-Host "Fonte (OML): $omlRoot"
Write-Host "Reabra o Claude Code para o autocomplete carregar os comandos."
