SELECT *
FROM sprint3_silver.companies_clean c
JOIN sprint3_silver.transactions_clean t
  ON c.company_id = t.business_id 
WHERE c.country = "Germany" AND DATE(t.timestamp) = '2022-03-12';

SELECT *
FROM sprint3_silver.companies_clean c
JOIN sprint3_silver.transactions_clean t
  ON c.company_id = t.business_id;