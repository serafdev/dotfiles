function adhan
    # Laval, Québec coordinates
    set latitude 45.6066
    set longitude -73.7124
    set method 2  # ISNA (Islamic Society of North America) - recommended for North America

    # Get current date
    set today (date +%d-%m-%Y)

    # Fetch prayer times from aladhan API
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
