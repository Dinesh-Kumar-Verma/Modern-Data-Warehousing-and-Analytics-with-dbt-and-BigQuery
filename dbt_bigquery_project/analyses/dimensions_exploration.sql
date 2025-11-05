/*
===============================================================================
Dimensions Exploration 
===============================================================================
Purpose:
    - Explore unique values and hierarchies within the gold dimension tables.
    - Validate that dimension data is consistent and enriched.
===============================================================================
*/

-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT
  country
FROM
  {{ source('gold', 'dim_customers') }}
ORDER BY
  country;

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT
  category,
  subcategory,
  product_name
FROM
  {{ source('gold', 'dim_products') }}
ORDER BY
  category,
  subcategory,
  product_name;
