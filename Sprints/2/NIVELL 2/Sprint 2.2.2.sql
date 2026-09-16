SELECT company_name AS nom, phone AS telefon, country AS pais, timestamp AS data, amount AS diners
FROM transaccions t
JOIN empreses e
ON t.business_id = e.company_id
WHERE t.amount BETWEEN 350 AND 400 AND DATE(timestamp) IN ("2015-04-29", "2018-07-20", "2024-03-13") AND t.declined = 0
ORDER BY amount DESC;