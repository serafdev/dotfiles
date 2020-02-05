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
alias python=python3
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
