

with __dbt__cte__stg_city_weather_final as (
SELECT
    location_name,
    date,
    actual,
    forecast,
    lower_bound,
    upper_bound
FROM USER_DB_CRICKET.raw.city_weather_final
WHERE date IS NOT NULL
  AND location_name IS NOT NULL
) SELECT
    location_name,
    date,
    actual,
    forecast,
    lower_bound,
    upper_bound,
    CASE
        WHEN actual IS NOT NULL THEN 'historical'
        WHEN forecast IS NOT NULL THEN 'forecast'
        ELSE 'unknown'
    END AS record_type
FROM __dbt__cte__stg_city_weather_final
ORDER BY location_name, date