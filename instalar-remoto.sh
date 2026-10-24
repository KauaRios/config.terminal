#!/usr/bin/env bash
# Baixa os arquivos em uma pasta temporária e executa o instalador local.
set -euo pipefail
install_dir=$(mktemp -d "${TMPDIR:-/tmp}/config-terminal.XXXXXX")
trap 'rm -rf -- "$install_dir"' EXIT
trap 'exit 1' HUP INT TERM
for file in instalar.sh alacritty.toml starship.toml; do
    curl -fsSL "https://raw.githubusercontent.com/KauaRios/config.terminal/principal/$file" \
        -o "$install_dir/$file"
done
bash "$install_dir/instalar.sh"
