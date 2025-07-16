{{ config(materialized='table') }}

SELECT
    product_id,
    product_name,
    category,
    rating,
    rating_count,
    actual_price,
    discounted_price
FROM {{ ref('stg_amazon_sales') }}
WHERE rating IS NOT NULL
ORDER BY rating DESC, rating_count DESC
LIMIT 10
