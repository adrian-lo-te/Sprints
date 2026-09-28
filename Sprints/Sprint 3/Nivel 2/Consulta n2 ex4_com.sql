CREATE OR REPLACE TABLE `sprint3_silver.companies_clean` AS
SELECT id AS company_id,company_name,phone,email,country,website
FROM `sprint3_bronze.companies_raw`;