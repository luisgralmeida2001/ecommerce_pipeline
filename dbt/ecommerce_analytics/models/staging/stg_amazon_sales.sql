{{ config(materialized='view') }}

WITH cleaned AS (
    SELECT
        product_id,
        product_name,
        category,
        REPLACE(REPLACE(discounted_price, '₹', ''), ',', '')::FLOAT AS discounted_price,
        REPLACE(REPLACE(actual_price, '₹', ''), ',', '')::FLOAT AS actual_price,
        REPLACE(discount_percentage, '%', '')::FLOAT AS discount_percentage,

        CASE
            WHEN rating ~ '^[0-9.]+$' THEN rating::FLOAT
            ELSE NULL
        END AS rating,

        CASE
            WHEN rating_count ~ '^[0-9,]+$' THEN REPLACE(rating_count, ',', '')::INT
            ELSE NULL
        END AS rating_count,

        about_product,
        user_id,
        user_name,
        review_id,
        review_title,
        review_content,
        img_link,
        product_link
    FROM amazon_sales
)

SELECT *
FROM cleaned