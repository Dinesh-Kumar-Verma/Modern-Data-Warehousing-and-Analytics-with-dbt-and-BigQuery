SELECT
    id,
    cat,
    subcat,
    maintenance,
    CURRENT_DATETIME() AS dwh_create_date
FROM `bigquery-with-dbt-476815`.`bronze`.`erp_px_cat_g1v2`