SELECT DATE(TIMESTAMP(timestamp)) AS dia, ROUND(SUM(SAFE_CAST(amount AS FLOAT64)), 2) AS ingressos
FROM `sprint3_bronze.transactions_raw_native`
WHERE EXTRACT(YEAR FROM TIMESTAMP(timestamp)) = 2021
GROUP BY dia
ORDER BY ingressos DESC
LIMIT 5;