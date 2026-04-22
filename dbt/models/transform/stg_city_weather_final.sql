SELECT
    location_name,
    date,
    actual,
    forecast,
    lower_bound,
    upper_bound
FROM {{ source('raw', 'city_weather_final') }}
WHERE date IS NOT NULL
  AND location_name IS NOT NULL