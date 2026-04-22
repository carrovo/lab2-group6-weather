{% snapshot city_weather_final_snapshot %}

{{
    config(
      target_database='USER_DB_CRICKET',
      target_schema='snapshots',
      unique_key='snapshot_key',
      strategy='check',
      check_cols=['actual', 'forecast', 'lower_bound', 'upper_bound']
    )
}}

WITH deduped AS (
    SELECT
        location_name,
        date,
        actual,
        forecast,
        lower_bound,
        upper_bound,
        CONCAT(location_name, '-', TO_VARCHAR(date, 'YYYY-MM-DD')) AS snapshot_key,
        ROW_NUMBER() OVER (
            PARTITION BY location_name, date
            ORDER BY date
        ) AS rn
    FROM {{ source('raw', 'city_weather_final') }}
)

SELECT
    location_name,
    date,
    actual,
    forecast,
    lower_bound,
    upper_bound,
    snapshot_key
FROM deduped
WHERE rn = 1

{% endsnapshot %}