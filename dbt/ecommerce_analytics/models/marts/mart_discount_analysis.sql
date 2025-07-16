{{ config(materialized='table') }}

WITH categorized_discounts AS (
    SELECT
        CASE
            WHEN discount_percentage BETWEEN 0 AND 10 THEN '0-10%'
            WHEN discount_percentage BETWEEN 11 AND 30 THEN '11-30%'
            WHEN discount_percentage BETWEEN 31 AND 50 THEN '31-50%'
            WHEN discount_percentage > 50 THEN '51%+'
            ELSE 'Unknown'
        END AS discount_range,
        actual_price,
        discounted_price,
        discount_percentage
    FROM {{ ref('stg_amazon_sales') }}
)

SELECT
    discount_range,
    COUNT(*) AS products_count,
    AVG(actual_price) AS avg_actual_price,
    AVG(discounted_price) AS avg_discounted_price,
    AVG(discount_percentage) AS avg_discount_percentage
FROM categorized_discounts
GROUP BY discount_range
ORDER BY discount_range
