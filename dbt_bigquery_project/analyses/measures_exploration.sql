/*
===============================================================================
Measures Exploration 
===============================================================================
Purpose:
    - Calculate key aggregated metrics for business insights.
    - Quickly assess overall trends and detect anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG(), DISTINCT
===============================================================================
*/

-- Find the total sales amount
SELECT
  SUM(sales_amount) AS total_sales
FROM
  {{ source('gold', 'fact_sales') }};

-- Find how many items are sold
SELECT
  SUM(quantity) AS total_quantity
FROM
  {{ source('gold', 'fact_sales') }};

-- Find the average selling price
SELECT
  AVG(price) AS avg_price
FROM
  {{ source('gold', 'fact_sales') }};

-- Find the total number of orders (all vs. distinct)
SELECT
  COUNT(order_number) AS total_orders_all,
  COUNT(DISTINCT order_number) AS total_orders_distinct
FROM
  {{ source('gold', 'fact_sales') }};

-- Find the total number of products
SELECT
  COUNT(DISTINCT product_name) AS total_products
FROM
  {{ source('gold', 'dim_products') }};

-- Find the total number of customers
SELECT
  COUNT(DISTINCT customer_key) AS total_customers
FROM
  {{ source('gold', 'dim_customers') }};

-- Find the total number of customers that have placed at least one order
SELECT
  COUNT(DISTINCT customer_key) AS active_customers
FROM
  {{ source('gold', 'fact_sales') }};

-- Generate a consolidated business metrics report
SELECT 'Total Sales' AS measure_name, CAST(SUM(sales_amount) AS FLOAT64) AS measure_value FROM {{ source('gold', 'fact_sales') }}
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM {{ source('gold', 'fact_sales') }}
UNION ALL
SELECT 'Average Price', AVG(price) FROM {{ source('gold', 'fact_sales') }}
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM {{ source('gold', 'fact_sales') }}
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM {{ source('gold', 'dim_products') }}
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key) FROM {{ source('gold', 'dim_customers') }}
UNION ALL
SELECT 'Active Customers', COUNT(DISTINCT customer_key) FROM {{ source('gold', 'fact_sales') }};
