SELECT
    location_name,
    date,
    COUNT(*) AS cnt
FROM USER_DB_CRICKET.analytics.weather_daily_metrics
GROUP BY location_name, date
HAVING COUNT(*) > 1