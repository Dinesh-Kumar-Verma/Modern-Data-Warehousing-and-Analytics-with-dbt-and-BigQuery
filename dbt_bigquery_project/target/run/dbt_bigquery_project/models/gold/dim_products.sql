

  create or replace view `bigquery-with-dbt-476815`.`gold`.`dim_products`
  OPTIONS()
  as SELECT
  ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt, pn.prd_key) AS product_key,  -- Surrogate key
  pn.prd_id AS product_id,
  pn.prd_key AS product_number,
  pn.prd_nm AS product_name,
  pn.cat_id AS category_id,
  pc.cat AS category,
  pc.subcat AS subcategory,
  pc.maintenance AS maintenance,
  pn.prd_cost AS cost,
  pn.prd_line AS product_line,
  pn.prd_start_dt AS start_date
FROM `bigquery-with-dbt-476815`.`silver`.`crm_prd_info` AS pn
LEFT JOIN `bigquery-with-dbt-476815`.`silver`.`erp_px_cat_g1v2` AS pc
  ON pn.cat_id = pc.id
WHERE pn.prd_end_dt IS NULL  -- Filter out all historical data;

