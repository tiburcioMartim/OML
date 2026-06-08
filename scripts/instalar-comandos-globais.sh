#!/usr/bin/env bash
# Instala/atualiza os comandos do OML como slash commands GLOBAIS em ~/.claude/commands/
# (autocomplete em qualquer pasta, nao so dentro do clone do OML).
#
# Equivalente Linux/macOS do instalar-comandos-globais.ps1 (Windows). Mesmo
# comportamento, mesmos arquivos de destino, mesma precedencia.
#
# Como funciona: copia cada comando de <OML>/.claude/commands/ e troca o caminho
# relativo do doc (docs/01-comandos/) pelo caminho ABSOLUTO deste OML, para o
# comando funcionar a partir de qualquer diretorio. O conteudo PT-BR (com acentos)
# vem dos proprios arquivos lidos do disco -- UTF-8 preservado, sem reescrever
# encoding.
#
# Idempotente: re-rode apos /oml-atualizar para pegar comandos novos.
# Precedencia: comandos do projeto e do clone do OML vencem estes globais quando
# voce esta dentro dessas pastas; os globais valem no resto.
#
# Uso (a partir de qualquer lugar):
#   bash scripts/instalar-comandos-globais.sh
#   ./scripts/instalar-comandos-globais.sh      # se executavel (chmod +x)

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
oml_root="$(dirname "$script_dir")"
src="$oml_root/.claude/commands"
dest="${HOME}/.claude/commands"

if [ ! -d "$src" ]; then
  echo "Erro: origem nao encontrada: $src (rode dentro do clone/projeto do OML)" >&2
  exit 1
fi
mkdir -p "$dest"

# Caminho absoluto do doc deste OML (barras normais ja sao nativas no Linux/macOS).
abs="$oml_root/docs/01-comandos/"
n=0

shopt -s nullglob
for file in "$src"/*.md; do
  name="$(basename "$file")"
  # Le preservando newlines finais (o ; printf x evita o strip do $(...)).
  content="$(cat "$file"; printf 'x')"
  content="${content%x}"
  # Troca literal do caminho relativo pelo absoluto deste OML (todas as ocorrencias).
  content="${content//docs\/01-comandos\//$abs}"
  printf '%s' "$content" > "$dest/$name"
  n=$((n + 1))
done

echo "OK: $n comandos globais em $dest"
echo "Fonte (OML): $oml_root"
echo "Reabra o Claude Code para o autocomplete carregar os comandos."
