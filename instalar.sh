#!/bin/sh
# Instala as configurações para o usuário atual, sem sudo.
set -eu
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_root="${XDG_CONFIG_HOME:-$HOME/.config}"

for name in alacritty starship; do
    if [ ! -f "$script_dir/$name.toml" ]; then
        printf 'Erro: %s.toml precisa estar ao lado deste script.\n' "$name" >&2
        exit 1
    fi
done
if ! command -v alacritty >/dev/null 2>&1; then
    printf '%s\n' 'Aviso: instale o Alacritty pelo gerenciador de pacotes do seu sistema.' >&2
fi

install_config() {
    source_file="$script_dir/$1"
    config_dir="$2"
    target="$config_dir/$1"
    mkdir -p "$config_dir"
    if [ -e "$target" ] || [ -L "$target" ]; then
        if cmp -s "$source_file" "$target"; then
            printf 'A configuração já está instalada em %s\n' "$target"
            return
        fi
        backup_dir=$(mktemp -d "$config_dir/backup-$(date +%Y%m%d-%H%M%S)-XXXXXX")
        cp -pP "$target" "$backup_dir/$1"
        printf 'Backup salvo em %s\n' "$backup_dir/$1"
    fi
    # Renomeação atômica também evita escrever através de links simbólicos.
    temp_file=$(mktemp "$config_dir/.$1.XXXXXX")
    trap 'rm -f "$temp_file"' EXIT HUP INT TERM
    cp "$source_file" "$temp_file"
    chmod 644 "$temp_file"
    mv -f "$temp_file" "$target"
    printf 'Configuração instalada em %s\n' "$target"
}

install_config alacritty.toml "$config_root/alacritty"
install_config starship.toml "$config_root"
printf '%s\n' 'Abra o Alacritty novamente para aplicar todas as opções.'
printf '%s\n' 'Instale o Starship e configure sua inicialização no .bashrc manualmente.'
