select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select location_name
from USER_DB_CRICKET.analytics.weather_daily_metrics
where location_name is null



      
    ) dbt_internal_test