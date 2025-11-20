function adhan
    # Laval, Québec coordinates
    set latitude 45.6066
    set longitude -73.7124
    set method 2  # ISNA (Islamic Society of North America) - recommended for North America

    # Get current date and time
    set today (date +%d-%m-%Y)
    set current_time (date +%H:%M)
    set current_epoch (date +%s)

    # Fetch prayer times from aladhan API
    set response (curl -s "http://api.aladhan.com/v1/timings/$today?latitude=$latitude&longitude=$longitude&method=$method")

    if test $status -eq 0
        # Get hijri date
        set hijri_date (echo $response | jq -r '.data.date.hijri | "\(.day) \(.month.en) \(.year)"')

        # System info
        set cpu_usage (top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}' 2>/dev/null || echo "N/A")
        set mem_info (free -h | awk '/^Mem:/ {print $3 "/" $2}' 2>/dev/null || echo "N/A")
        set disk_usage (df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}' 2>/dev/null || echo "N/A")
        set uptime_info (uptime -p 2>/dev/null | sed 's/up //' || echo "N/A")
        set kernel_info (uname -r 2>/dev/null || echo "N/A")
        set load_avg (uptime | awk -F'load average:' '{print $2}' | sed 's/^[ \t]*//' 2>/dev/null || echo "N/A")

        # Extract prayer times
        set fajr (echo $response | jq -r '.data.timings.Fajr')
        set sunrise (echo $response | jq -r '.data.timings.Sunrise')
        set dhuhr (echo $response | jq -r '.data.timings.Dhuhr')
        set asr (echo $response | jq -r '.data.timings.Asr')
        set maghrib (echo $response | jq -r '.data.timings.Maghrib')
        set isha (echo $response | jq -r '.data.timings.Isha')

        echo ""
        echo "╭─────────────────────────────────────────────────────────────────╮"
        echo "│  🕌  Prayer Times - Laval, QC                                   │"
        echo "├─────────────────────────────────────────────────────────────────┤"
        string pad -w 65 "│  🌙 Fajr       $fajr" | string replace -r '\s*$' ' │'
        string pad -w 65 "│  🌅 Sunrise    $sunrise" | string replace -r '\s*$' ' │'
        string pad -w 65 "│  ☀️  Dhuhr      $dhuhr" | string replace -r '\s*$' ' │'
        string pad -w 65 "│  🌤️  Asr        $asr" | string replace -r '\s*$' ' │'
        string pad -w 65 "│  🌆 Maghrib    $maghrib" | string replace -r '\s*$' ' │'
        string pad -w 65 "│  🌃 Isha       $isha" | string replace -r '\s*$' ' │'
        echo "├─────────────────────────────────────────────────────────────────┤"

        # Calculate time until next prayer
        set next_prayer_info (echo $response | jq -r --arg current "$current_time" '
            .data.timings |
            to_entries |
            map(select(.key | IN("Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"))) |
            map({key: .key, value: .value}) |
            map(select(.value > $current)) |
            first |
            "\(.key)|\(.value)"
        ')

        if test -n "$next_prayer_info"
            set prayer_name (echo $next_prayer_info | cut -d'|' -f1)
            set prayer_time (echo $next_prayer_info | cut -d'|' -f2)
            set prayer_epoch (date -d "$prayer_time" +%s 2>/dev/null)
            if test $status -eq 0
                set diff_seconds (math $prayer_epoch - $current_epoch)
                set hours (math "floor($diff_seconds / 3600)")
                set minutes (math "floor(($diff_seconds % 3600) / 60)")
                if test $hours -gt 0
                    printf "│  ⏰ Next Prayer: %-8s in %dh %dm                            │\n" "$prayer_name" $hours $minutes
                else
                    printf "│  ⏰ Next Prayer: %-8s in %dm                               │\n" "$prayer_name" $minutes
                end
            end
        end

        echo "├─────────────────────────────────────────────────────────────────┤"
        echo "│  💻  System Dashboard                                           │"
        echo "├─────────────────────────────────────────────────────────────────┤"
        printf "│  🖥️  CPU Usage    %-46s│\n" "$cpu_usage"
        printf "│  🧠 Memory       %-46s│\n" "$mem_info"
        printf "│  💾 Disk         %-46s│\n" "$disk_usage"
        printf "│  ⏱️  Uptime       %-46s│\n" "$uptime_info"
        printf "│  🐧 Kernel       %-46s│\n" "$kernel_info"
        printf "│  📊 Load Avg     %-46s│\n" "$load_avg"
        echo "╰─────────────────────────────────────────────────────────────────╯"
        echo ""
    else
        echo "❌ Error fetching prayer times"
        return 1
    end
end

function adhan_simple
    # Simple compact version
    set latitude 45.6066
    set longitude -73.7124
    set method 2
    set today (date +%d-%m-%Y)
    set current_time (date +%H:%M)
    set current_epoch (date +%s)

    set response (curl -s "http://api.aladhan.com/v1/timings/$today?latitude=$latitude&longitude=$longitude&method=$method")

    if test $status -eq 0
        echo $response | jq -r '
            .data.timings |
            "🕌 Fajr \(.Fajr) • Dhuhr \(.Dhuhr) • Asr \(.Asr) • Maghrib \(.Maghrib) • Isha \(.Isha)"
        '

        set next_prayer_info (echo $response | jq -r --arg current "$current_time" '
            .data.timings |
            to_entries |
            map(select(.key | IN("Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"))) |
            map({key: .key, value: .value}) |
            map(select(.value > $current)) |
            first |
            "\(.key)|\(.value)"
        ')

        if test -n "$next_prayer_info"
            set prayer_name (echo $next_prayer_info | cut -d'|' -f1)
            set prayer_time (echo $next_prayer_info | cut -d'|' -f2)
            set prayer_epoch (date -d "$prayer_time" +%s 2>/dev/null)
            if test $status -eq 0
                set diff_seconds (math $prayer_epoch - $current_epoch)
                set hours (math "floor($diff_seconds / 3600)")
                set minutes (math "floor(($diff_seconds % 3600) / 60)")

                if test $hours -gt 0
                    echo "⏰ $prayer_name in "$hours"h "$minutes"m"
                else
                    echo "⏰ $prayer_name in "$minutes"m"
                end
            end
        end
    else
        echo "❌ Error fetching prayer times"
        return 1
    end
end

function adhan_month
    # Get prayer times for the entire month
    set latitude 45.6066
    set longitude -73.7124
    set method 2

    set month (date +%m)
    set year (date +%Y)

    set response (curl -s "http://api.aladhan.com/v1/calendar/$year/$month?latitude=$latitude&longitude=$longitude&method=$method")

    if test $status -eq 0
        echo "🕌 Prayer Times for Laval, Québec - "(date +%B\ %Y)
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo $response | jq -r '
            .data[] |
            "\(.date.gregorian.date): Fajr \(.timings.Fajr) | Dhuhr \(.timings.Dhuhr) | Asr \(.timings.Asr) | Maghrib \(.timings.Maghrib) | Isha \(.timings.Isha)"
        '
    else
        echo "❌ Error fetching monthly prayer times"
        return 1
    end
end

function adhan_next
    # Show next prayer time
    set latitude 45.6066
    set longitude -73.7124
    set method 2
    set today (date +%d-%m-%Y)
    set current_time (date +%H:%M)

    set response (curl -s "http://api.aladhan.com/v1/timings/$today?latitude=$latitude&longitude=$longitude&method=$method")

    if test $status -eq 0
        echo "⏰ Next Prayer:"
        echo $response | jq -r --arg current "$current_time" '
            .data.timings |
            to_entries |
            map(select(.key | IN("Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"))) |
            map({key: .key, value: .value}) |
            map(select(.value > $current)) |
            first |
            "\(.key) at \(.value)"
        '
    else
        echo "❌ Error fetching next prayer time"
        return 1
    end
end

# Display prayer times on shell startup
adhan
