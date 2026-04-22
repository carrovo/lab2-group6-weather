{{ config(materialized='table') }}

SELECT
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
FROM {{ ref('stg_city_weather_final') }}
ORDER BY location_name, date