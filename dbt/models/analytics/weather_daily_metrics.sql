{{ config(materialized='table') }}

SELECT
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

FROM {{ ref('stg_city_weather') }}
ORDER BY location_name, date