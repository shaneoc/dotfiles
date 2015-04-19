script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
register_symlink "$HOME/.irssi" "$script_dir"
