SELECT
    location_name,
    date,
    COUNT(*) AS cnt
FROM {{ ref('weather_daily_metrics') }}
GROUP BY location_name, date
HAVING COUNT(*) > 1