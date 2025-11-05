/*
===============================================================================
Date Range Exploration
===============================================================================
Purpose:
    - Determine temporal boundaries of key data points.
    - Understand historical coverage and data recency.

SQL Functions Used:
    - MIN(), MAX(), DATE_DIFF(), CURRENT_DATE()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months
SELECT
  MIN(order_date) AS first_order_date,
  MAX(order_date) AS last_order_date,
  DATE_DIFF(MAX(order_date), MIN(order_date), MONTH) AS order_range_months
FROM
  {{ source('gold', 'fact_sales') }};

-- Find the youngest and oldest customer based on birthdate
SELECT
  MIN(birthdate) AS oldest_birthdate,
  DATE_DIFF(CURRENT_DATE(), MIN(birthdate), YEAR) AS oldest_age,
  MAX(birthdate) AS youngest_birthdate,
  DATE_DIFF(CURRENT_DATE(), MAX(birthdate), YEAR) AS youngest_age
FROM
  {{ source('gold', 'dim_customers') }};
