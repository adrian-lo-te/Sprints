CREATE OR REPLACE TABLE `sprint3_silver.users_combined` AS
SELECT
  CAST(id AS STRING) AS user_id,name,surname,phone,email,birth_date,country,city,postal_code,address,'EEUU' AS origin
FROM `sprint3_bronze.american_users_raw`

UNION ALL

SELECT
  CAST(id AS STRING) AS user_id,name,surname,phone,email,birth_date,country,city,postal_code,address,
  'Europa' AS origin
FROM `sprint3_bronze.european_users_raw`;