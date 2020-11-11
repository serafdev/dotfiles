ZSH_THEME="evan"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

alias ll="ls -l"
alias cat=bat
declare -a work_profiles=(
    ".gcpprofile"
    ".azureprofile"
    ".edoxaprofile"
    ".bellprofile"
    ".gokuprofile"
)

for profile in "${work_profiles[@]}"
do
    if [ -f $HOME/$profile ]; then
        source $HOME/$profile
    fi
done

export XDG_CONFIG_HOME="$HOME/.config"

# Python stuff
alias python=python3

# Source vte.sh when using Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

if [ uname = "Linux" ] && systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi

# Git stuff
git config --global core.editor "emacs -nw"

# Add fancy colors to zsh
if [ ! -d "$HOME/.zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh-syntax-highlighting
fi
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Stuff for npm without sudo
if [[ ! -d "${HOME}/.npm-packages" ]]; then
       mkdir "${HOME}/.npm-packages"
fi
npm config set prefix "${HOME}/.npm-packages"
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"


# Ruby stuff
if hash ruby 2>/dev/null; then
    PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi

# Doom Path
export PATH=$PATH:$HOME/.emacs.d/bin
