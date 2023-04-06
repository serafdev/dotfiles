#!/usr/local/bin/bash

function _e {
  export $1=$2
}

_e GOPATH ~/go
_e GEM_HOME ~/gems
_e npm_config_prefix ~/.node_modules
_e XDG_CONFIG_HOME ~/.config

_extra_paths=(
    ~/bin
    $GOPATH/bin
    /var/lib/snapd/snap/bin
    /.krew/bin
    ~/.node_modules/bin
    /.local/bin
    /usr/local/kubebuilder/bin
    ~/.emacs.d/bin
    ~/.linuxbrew/bin
    /usr/local/go/bin
    ~/.cargo/bin
    ~/gems/bin
    ~/.screenlayout
    /opt/platform-tools
    ~/.poetry/bin
)

for _p in $_extra_paths
do
    bash_add_path $_p
done
