ZSH_THEME="evan"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias ll=ls -l

declare -a work_profiles=(
    ".gcpprofile"
    ".azureprofile"
    ".edoxaprofile"
    ".bellprofile"
)

for profile in "${work_profiles[@]}"
do
    if [ -f $HOME/$profile ]; then
        source $profile
    fi
done

# Python stuff
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
alias python=python3

declare -a cmds_init=(
    "pyenv init"
    "pyenv virtualenv-init"
)

for cmd_init in "${cmds_init[@]}"
do
    if command -v $cmd_init 1>/dev/null 2>&1; then
        eval $($cmd_init -)
    fi
done
