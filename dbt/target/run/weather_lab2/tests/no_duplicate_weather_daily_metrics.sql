select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT
    location_name,
    date,
    COUNT(*) AS cnt
FROM USER_DB_CRICKET.analytics.weather_daily_metrics
GROUP BY location_name, date
HAVING COUNT(*) > 1
      
    ) dbt_internal_test