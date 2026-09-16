SELECT DATE(timestamp) AS data, ROUND(SUM(amount), 2) AS total_ventes
FROM transaccions
WHERE declined = 0
GROUP BY data
ORDER BY total_ventes DESC
LIMIT 5;