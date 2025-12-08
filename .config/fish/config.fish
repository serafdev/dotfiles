set config_dir (dirname (status --current-filename))
set fish_greeting

set modules \
    path \
    aliases \
    k8s \
    desktop \
    bitwarden \
    network \
    misc \
    package-managers \
    starship

for module in $modules
    source "$config_dir/modules/$module.fish"
end
