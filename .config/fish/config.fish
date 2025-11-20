set config_dir (dirname (status --current-filename))

source "$config_dir/modules/path.fish"
source "$config_dir/modules/aliases.fish"
source "$config_dir/modules/k8s.fish"
source "$config_dir/modules/desktop.fish"
source "$config_dir/modules/misc.fish"

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# pnpm
set -gx PNPM_HOME "/home/seraf/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
