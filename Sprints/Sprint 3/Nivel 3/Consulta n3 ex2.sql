CREATE OR REPLACE TABLE `sprint3_gold.product_sales_ranking` AS
WITH tabla_unnest AS (
  SELECT t.transaction_id,prod_id
  FROM `sprint3_silver.transactions_clean` t,
  UNNEST(t.product_ids) AS prod_id
)
SELECT p.product_id, p.name, p.price, p.colour, COUNT(tu.transaction_id) AS total_sold
FROM `sprint3_silver.products_clean` p
LEFT JOIN tabla_unnest tu
  ON CAST(p.product_id AS INT64) = tu.prod_id
GROUP BY p.product_id, p.name, p.price, p.colour
ORDER BY total_sold DESC;