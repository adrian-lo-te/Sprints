CREATE OR REPLACE FUNCTION `sprint3_gold.calculate_tax`(amount NUMERIC) 
RETURNS NUMERIC AS (
  ROUND(amount * 1.21, 2)
);