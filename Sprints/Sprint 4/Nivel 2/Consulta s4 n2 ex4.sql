WITH Ranking AS (
  SELECT user_id,timestamp,amount,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp ASC) AS num,
    AVG(amount) OVER (
      PARTITION BY user_id 
      ORDER BY timestamp ASC 
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS mitj_3
  FROM `sprint3_gold.fact_transactions_optimized`
  QUALIFY ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp ASC) <= 3
)
SELECT u.user_id,u.name AS nom_complet,u.email,r.timestamp AS data_3a_compra,r.amount AS import_3a_compra,
 ROUND(r.mitj_3, 2) AS mitjana_3_primeres
FROM Ranking r
JOIN `sprint3_silver.users_combined` u 
  ON CAST(r.user_id AS STRING) = u.user_id
WHERE r.num = 3
ORDER BY r.mitj_3 DESC;