CREATE OR REPLACE VIEW VistaMarketing AS
SELECT t. business_id AS id_comp, e.company_name AS nom, e.phone AS telefon, e.country AS pais, ROUND(AVG(t.amount), 2) AS mitjana
FROM empreses e
JOIN transaccions t
ON e.company_id = t.business_id
WHERE t.declined = 0
GROUP BY id_comp, nom, telefon, pais;

SELECT *
FROM VistaMarketing
ORDER BY mitjana DESC;