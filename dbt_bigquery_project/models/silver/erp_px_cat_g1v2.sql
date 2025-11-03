SELECT
    id,
    cat,
    subcat,
    maintenance,
    CURRENT_DATETIME() AS dwh_create_date
FROM {{ source('bronze', 'erp_px_cat_g1v2') }}