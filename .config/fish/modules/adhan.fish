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
        echo $response | jq -r '
            .data.timings |
            "🕌 Fajr \(.Fajr) • Dhuhr \(.Dhuhr) • Asr \(.Asr) • Maghrib \(.Maghrib) • Isha \(.Isha)"
        '

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

            # Calculate time difference
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

function adhan_verbose
    # Verbose version with full details
    set latitude 45.6066
    set longitude -73.7124
    set method 2
    set today (date +%d-%m-%Y)

    set response (curl -s "http://api.aladhan.com/v1/timings/$today?latitude=$latitude&longitude=$longitude&method=$method")

    if test $status -eq 0
        echo "🕌 Prayer Times for Laval, Québec - $today"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

        echo $response | jq -r '
            .data.timings |
            "Fajr:    \(.Fajr)\nSunrise: \(.Sunrise)\nDhuhr:   \(.Dhuhr)\nAsr:     \(.Asr)\nMaghrib: \(.Maghrib)\nIsha:    \(.Isha)"
        '

        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "Method: ISNA (Islamic Society of North America)"
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
