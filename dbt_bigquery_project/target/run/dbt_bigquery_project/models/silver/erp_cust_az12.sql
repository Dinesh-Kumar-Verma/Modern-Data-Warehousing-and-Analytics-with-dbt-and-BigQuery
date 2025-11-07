
  
    

    create or replace table `bigquery-with-dbt-476815`.`silver`.`erp_cust_az12`
      
    
    

    
    OPTIONS()
    as (
      SELECT
    CASE
        WHEN STARTS_WITH(cid, 'NAS') THEN SUBSTR(cid, 4)
        ELSE cid
    END AS cid,
    CASE
        WHEN bdate > CURRENT_DATE() THEN NULL
        ELSE bdate
    END AS bdate,
    CASE
        WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
        WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
        ELSE 'n/a'
    END AS gen,
    CURRENT_DATETIME() AS dwh_create_date
FROM `bigquery-with-dbt-476815`.`bronze`.`erp_cust_az12`
    );
  