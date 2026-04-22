
  
    

        create or replace transient table USER_DB_CRICKET.analytics.weather_daily_metrics
         as
        (

with __dbt__cte__stg_city_weather as (
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
) SELECT
    location_name,
    date,
    temp_mean AS actual_temp,
    precipitation,

    AVG(temp_mean) OVER (
        PARTITION BY location_name
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS temp_7day_ma,

    (temp_mean - LAG(temp_mean) OVER (
        PARTITION BY location_name
        ORDER BY date
    )) AS temp_day_change

FROM __dbt__cte__stg_city_weather
ORDER BY location_name, date
        );
      
  