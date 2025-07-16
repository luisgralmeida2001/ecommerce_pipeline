{{ config(materialized='table') }}

SELECT
    category,
    COUNT(DISTINCT product_id) AS total_products,
    AVG(actual_price) AS avg_actual_price,
    AVG(discounted_price) AS avg_discounted_price,
    AVG(discount_percentage) AS avg_discount_percentage,
    AVG(rating) AS avg_rating,
    SUM(rating_count) AS total_rating_count
FROM {{ ref('stg_amazon_sales') }}
GROUP BY category
