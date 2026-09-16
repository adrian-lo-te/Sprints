USE transactions;

SELECT DISTINCT c.country AS paisos_transaccions
FROM company c
JOIN transaction t
ON c.id = t.company_id
WHERE t.declined != 1;

SELECT COUNT(DISTINCT c.country) AS quantitat_paisos
FROM company c
JOIN transaction t
ON c.id = t.company_id
WHERE t.declined != 1;

SELECT c.company_name AS nom, c.id AS id_companyia, ROUND(AVG(t.amount), 2) AS mitjana_vendes
FROM transaction t
JOIN company c
ON t.company_id = c.id
WHERE t.declined != 1
GROUP BY c.company_name, c.id
ORDER BY mitjana_vendes DESC
LIMIT 1;