SELECT
    location_name,
    latitude,
    longitude,
    date,
    temp_max,
    temp_min,
    temp_mean,
    precipitation,
    weather_code
FROM USER_DB_CRICKET.raw.city_weather
WHERE date IS NOT NULL
  AND location_name IS NOT NULL