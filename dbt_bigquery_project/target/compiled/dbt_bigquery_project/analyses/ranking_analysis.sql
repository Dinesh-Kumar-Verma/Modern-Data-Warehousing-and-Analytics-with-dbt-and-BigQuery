/*
===============================================================================
Ranking Analysis 
===============================================================================
Purpose:
    - Rank products and customers based on revenue and order metrics.
    - Identify top performers and laggards.

SQL Functions Used:
    - Window Functions: RANK(), DENSE_RANK(), ROW_NUMBER()
    - Clauses: GROUP BY, ORDER BY, LIMIT
===============================================================================
*/

-- Top 5 Products Generating the Highest Revenue (Simple Ranking)
SELECT
  p.product_name,
  SUM(f.sales_amount) AS total_revenue
FROM
  `bigquery-with-dbt-476815`.`gold`.`fact_sales` AS f
LEFT JOIN
  `bigquery-with-dbt-476815`.`gold`.`dim_products` AS p
ON
  p.product_key = f.product_key
GROUP BY
  p.product_name
ORDER BY
  total_revenue DESC
LIMIT 5;


-- Flexible Ranking Using Window Functions
SELECT
  product_name,
  total_revenue,
  rank_products
FROM (
  SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
  FROM
    `bigquery-with-dbt-476815`.`gold`.`fact_sales` AS f
  LEFT JOIN
    `bigquery-with-dbt-476815`.`gold`.`dim_products` AS p
  ON
    p.product_key = f.product_key
  GROUP BY
    p.product_name
)
WHERE
  rank_products <= 5
ORDER BY
  rank_products;


-- Bottom 5 Products (Lowest-Performing in Terms of Sales)
SELECT
  p.product_name,
  SUM(f.sales_amount) AS total_revenue
FROM
  `bigquery-with-dbt-476815`.`gold`.`fact_sales` AS f
LEFT JOIN
  `bigquery-with-dbt-476815`.`gold`.`dim_products` AS p
ON
  p.product_key = f.product_key
GROUP BY
  p.product_name
ORDER BY
  total_revenue ASC
LIMIT 5;


-- Top 10 Customers Generating the Highest Revenue
SELECT
  c.customer_key,
  c.first_name,
  c.last_name,
  SUM(f.sales_amount) AS total_revenue
FROM
  `bigquery-with-dbt-476815`.`gold`.`fact_sales` AS f
LEFT JOIN
  `bigquery-with-dbt-476815`.`gold`.`dim_customers` AS c
ON
  c.customer_key = f.customer_key
GROUP BY
  c.customer_key,
  c.first_name,
  c.last_name
ORDER BY
  total_revenue DESC
LIMIT 10;


-- Bottom 3 Customers with the Fewest Orders Placed
SELECT
  c.customer_key,
  c.first_name,
  c.last_name,
  COUNT(DISTINCT f.order_number) AS total_orders
FROM
  `bigquery-with-dbt-476815`.`gold`.`fact_sales` AS f
LEFT JOIN
  `bigquery-with-dbt-476815`.`gold`.`dim_customers` AS c
ON
  c.customer_key = f.customer_key
GROUP BY
  c.customer_key,
  c.first_name,
  c.last_name
ORDER BY
  total_orders ASC
LIMIT 3;