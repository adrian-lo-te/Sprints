CREATE OR REPLACE MATERIALIZED VIEW `sprint3_gold.mv_daily_sales` AS
SELECT DATE(timestamp) AS dia, SUM(amount) AS diners, COUNT(transaction_id) AS transaccions
FROM `sprint3_gold.fact_transactions_optimized`
GROUP BY dia;