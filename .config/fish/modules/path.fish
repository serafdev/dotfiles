echo "path.fish module loaded."

set -gx GOPATH ~/go
set -gx GEM_HOME ~/gems
set -gx npm_config_prefix ~/.node_modules
set -gx XDG_CONFIG_HOME ~/.config
set -gx ANDROID_HOME /home/seraf/Android/Sdk

fish_add_path ~/bin
fish_add_path $GOPATH/bin
fish_add_path /var/lib/snapd/snap/bin
fish_add_path /.krew/bin
fish_add_path ~/.node_modules/bin
fish_add_path /.local/bin
fish_add_path /usr/local/kubebuilder/bin
fish_add_path ~/.emacs.d/bin
fish_add_path ~/.linuxbrew/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/gems/bin
fish_add_path ~/.screenlayout
fish_add_path /opt/platform-tools
fish_add_path /home/seraf/Android/Sdk/platform-tools
# Make sure to clone flutter: git clone https://github.com/flutter/flutter.git -b stable
fish_add_path /opt/flutter/bin
fish_add_path ~/.poetry/bin
