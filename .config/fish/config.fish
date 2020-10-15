# Set PATH variable
if status --is-login
    set -x PATH $PATH ~/bin
end

function on_exit --on-event fish_exit
    echo Exiting Fish...
end
