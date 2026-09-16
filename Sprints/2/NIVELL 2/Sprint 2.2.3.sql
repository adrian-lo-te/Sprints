SELECT e.company_name AS nom, t.quantitat_transaccions,
CASE
	WHEN quantitat_transaccions >= 400 THEN "Moltes transaccions"
    ELSE "Poques transaccions"
    END AS activitat
FROM empreses e
JOIN (
	SELECT business_id, COUNT(id) AS quantitat_transaccions
	FROM transaccions
    WHERE declined = 0
	GROUP BY business_id) t
ON e.company_id = t.business_id;