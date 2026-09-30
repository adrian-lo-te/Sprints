WITH VIP_Stats AS (
  SELECT user_id,SUM(amount) AS total_gastat,COUNT(transaction_id) AS num_compres,ROUND(AVG(amount), 2) AS tiquet_mig, MAX(amount) AS max_compra
  FROM `sprint3_gold.fact_transactions_optimized`
  GROUP BY user_id
  HAVING total_gastat > 500
)
SELECT v.user_id,u.name AS nom_complet,u.email,v.num_compres,v.tiquet_mig,v.max_compra,ROUND(v.total_gastat, 2) AS total_gastat
FROM VIP_Stats v
JOIN `sprint3_silver.users_combined` u 
  ON CAST(v.user_id AS STRING) = u.user_id
ORDER BY v.total_gastat DESC;