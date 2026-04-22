select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select actual_temp
from USER_DB_CRICKET.analytics.weather_daily_metrics
where actual_temp is null



      
    ) dbt_internal_test