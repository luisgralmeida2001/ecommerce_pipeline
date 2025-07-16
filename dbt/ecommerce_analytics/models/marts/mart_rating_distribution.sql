{{ config(materialized='table') }}

WITH rating_bucketed AS (
    SELECT
        CASE
            WHEN rating BETWEEN 0 AND 1 THEN '0-1'
            WHEN rating > 1 AND rating <= 2 THEN '1-2'
            WHEN rating > 2 AND rating <= 3 THEN '2-3'
            WHEN rating > 3 AND rating <= 4 THEN '3-4'
            WHEN rating > 4 AND rating <= 5 THEN '4-5'
            ELSE 'Unknown'
        END AS rating_bucket
    FROM {{ ref('stg_amazon_sales') }}
)

SELECT
    rating_bucket,
    COUNT(*) AS products_count
FROM rating_bucketed
GROUP BY rating_bucket
ORDER BY rating_bucket
