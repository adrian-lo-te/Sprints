CREATE OR REPLACE TABLE `sprint3_gold.dim_transactions_flat` AS
SELECT t.transaction_id,t.timestamp,t.amount AS total_ticket,p.product_id AS product_sku,p.name AS product_name,p.price AS product_unit_price,
  `sprint3_gold.calculate_tax`(SAFE_CAST((p.price) AS NUMERIC)) AS product_price_tax_inc
FROM `sprint3_gold.fact_transactions_optimized` t
CROSS JOIN UNNEST(t.product_ids) AS single_product_id
JOIN `sprint3_silver.products_clean` p 
  ON CAST(single_product_id AS STRING) = CAST(p.product_id AS STRING);