
  
    

    create or replace table `bigquery-with-dbt-476815`.`bronze_bronze`.`test`
      
    
    

    
    OPTIONS()
    as (
      SELECT
    *
FROM`bigquery-with-dbt-476815`.`bronze`.`crm_cust_info`

--SELECT * FROM `bigquery-with-dbt-476815.bronze.crm_cust_info` LIMIT 1000
    );
  