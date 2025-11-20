function wg_connect_random
    # Define the folder where the WireGuard configurations are located
    set wg_folder "/etc/wireguard"

    # Check if the folder exists
    if not test -d $wg_folder
        echo "Error: Folder '$wg_folder' does not exist!"
        return 1
    end

    # Get a random file from the folder with the `.conf` extension
    set wg_files (sudo find $wg_folder -type f -name '*.conf')
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

function wifi_connect
    echo "running: sudo nmcli --ask dev wifi connect $argv[1]"
    echo "Note: if any issue arises, try: nmcli con delete $argv[1]"
    sudo nmcli --ask  dev wifi connect $argv[1]
end
