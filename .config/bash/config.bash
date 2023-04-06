#!/usr/local/bin/bash

# https://stackoverflow.com/a/246128/3431636 to get this config's dir
_bash_config_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

modules=(
    helpers
    fzf
    k8s
    env
)

for _module in "${modules[@]}"
do
    # shellcheck source=/dev/null (ignore the lsp shellcheck)
    source "$_bash_config_dir/modules/$_module.bash"
done

eval "$(starship init bash)"

