echo "desktop.fish module loaded."

alias emacs="emacsclient -c -a 'emacs'"

starship init fish | source

function zoomfix
    xcompmgr -c -l0 -t0 -r0 -o.00
end

function brightness
    xrandr --output (xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $argv[1]
end

function wg_connect_random
    # Define the folder where the WireGuard configurations are located
    set wg_folder "/etc/wireguard"

    # Check if the folder exists
    if not test -d $wg_folder
        echo "Error: Folder '$wg_folder' does not exist!"
        return 1
    end

    # Get a random file from the folder with the `.conf` extension
    set wg_files (find $wg_folder -type f -name '*.conf')
    if test -z "$wg_files"
        echo "No configuration files found in $wg_folder"
        return 1
    end

    # Pick a random configuration file
    set random_file (printf "%s\n" $wg_files | shuf -n 1)
    set interface_name (basename $random_file .conf)

    # Bring up the WireGuard interface with sudo
    echo "Running: sudo wg-quick up $interface_name"
    sudo wg-quick up $interface_name
    sudo wg show
end

function bluetooth-powerbeats-pro
    bluetoothctl connect A4:83:E7:E6:48:65 #  Lost these earphones, if found contact me 😞
end


function displays-layout
  switch $argv[1]
    case help
      echo "Current configs: home"
    case home
      xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x180 \
        --output DP-1-2 --mode 2560x1440 --pos 1920x0
  end
  # Fix weird positioning after displays layout is changed
  feh --randomize --bg-fill ~/Pictures/Wallpapers/*
end

alias _c="xclip -selection clipboard"
alias _v="xclip -selection clipboard -o"

function bw_unlock
  set -xg BW_SESSION ( bw unlock --raw )
end

function bw_get_password_cp
  bw get item $argv[1] | jq -r .login.password | xclip -selection clipboard
  echo "Password copied to clipboard"
end

function bw_get_password
  bw get item $argv[1] | jq -r .login.password
end

function bw_get_linode_dev_pat
  bw get item linode | jq -r  .fields[0].value
end

function bw_get_gitlab_dev_pat
  bw get item gitlab_serafdev | jq -r  .fields[1].value
end

function bw_get_gh_token
  bw get item github_serafdev | jq -r  .fields[0].value
end

function wifi_connect
    echo "running: sudo nmcli --ask dev wifi connect $argv[1]"
    echo "Note: if any issue arises, try: nmcli con delete $argv[1]"
    sudo nmcli --ask  dev wifi connect $argv[1]
end
