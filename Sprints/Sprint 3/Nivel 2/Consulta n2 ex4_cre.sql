CREATE OR REPLACE TABLE `sprint3_silver.credit_cards_clean` AS
SELECT id AS card_id,user_id,iban,pan,pin,cvv,track1,track2,expiring_date
FROM `sprint3_bronze.credit_cards_raw`;