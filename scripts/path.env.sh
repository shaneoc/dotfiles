local script_path="$(readlink -f "${BASH_SOURCE[0]}")"
local script_dir="$(dirname "$script_path")"
path_prepend "$script_dir"
script_path_prepend "$script_dir"
