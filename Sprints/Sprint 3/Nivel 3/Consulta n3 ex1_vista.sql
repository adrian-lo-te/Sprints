CREATE OR REPLACE VIEW `sprint3_gold.v_marketing_kpis` AS
SELECT c.company_name AS nom,c.phone AS telefon,c.country AS pais,AVG(t.amount) AS mitjana_ingressos,
  CASE 
    WHEN AVG(t.amount) > 260 THEN 'Premium'
    ELSE 'Standard'
  END AS client_tier
FROM `sprint3_silver.companies_clean` c
JOIN `sprint3_silver.transactions_clean` t
  ON c.company_id = t.business_id
GROUP BY c.company_id, c.company_name, c.phone, c.country;