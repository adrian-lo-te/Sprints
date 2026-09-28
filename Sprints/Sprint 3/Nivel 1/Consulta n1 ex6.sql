SELECT c.company_name AS nom,c.country AS pais,t.timestamp AS data_transaccio,SAFE_CAST(t.amount AS FLOAT64) AS ingressos
FROM `sprint3_bronze.transactions_raw_native` t
JOIN `sprint3_bronze.companies_raw` c 
ON t.business_id = c.id
WHERE SAFE_CAST(t.amount AS FLOAT64) BETWEEN 100 AND 200 AND DATE(TIMESTAMP(t.timestamp)) IN ('2015-04-29', '2018-07-20', '2024-03-13');