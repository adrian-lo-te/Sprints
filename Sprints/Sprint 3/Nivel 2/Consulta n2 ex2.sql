CREATE OR REPLACE TABLE `sprint3_silver.transactions_clean` AS
SELECT
  id AS transaction_id,
  IFNULL(SAFE_CAST(amount AS FLOAT64), 0.0) AS amount,
  SAFE_CAST(declined AS INT64) AS declined,
  SAFE_CAST(lat AS FLOAT64) AS lat,
  SAFE_CAST(longitude AS FLOAT64) AS longitude,
  SAFE_CAST(timestamp AS TIMESTAMP) AS timestamp,
  card_id,
  business_id,
  user_id,
  ARRAY(
    SELECT SAFE_CAST(TRIM(p_id) AS INT64)
    FROM UNNEST(SPLIT(product_ids, ',')) AS p_id
  ) AS product_ids
FROM `sprint3_bronze.transactions_raw_native`;