function zoomfix
    xcompmgr -c -l0 -t0 -r0 -o.00
end

function brightness
    xrandr --output (xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $argv[1]
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
