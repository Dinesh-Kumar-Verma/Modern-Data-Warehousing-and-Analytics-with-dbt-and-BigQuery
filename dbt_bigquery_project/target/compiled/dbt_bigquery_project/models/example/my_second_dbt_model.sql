-- Use the `ref` function to select from other models

select *
from `bigquery-with-dbt-476815`.`bronze`.`my_first_dbt_model`
where id = 1