CREATE OR REPLACE TABLE `sprint3_silver.products_clean` AS
SELECT
  CAST(id AS STRING) AS product_id,
  product_name AS name,
  CAST(REPLACE(warehouse_id, 'WH-', '') AS INT64) AS warehouse_id,
  SAFE_CAST(REGEXP_REPLACE(CAST(price AS STRING), r'[^\d.]', '') AS FLOAT64) AS price,
  weight,
  colour
FROM `sprint3_bronze.products_raw`;