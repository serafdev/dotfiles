ZSH_THEME="evan"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
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

# Python stuff
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
alias python=python3
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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
