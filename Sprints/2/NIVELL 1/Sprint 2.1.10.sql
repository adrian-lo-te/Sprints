SELECT g.iban AS targeta_iban, ROUND(AVG(t.amount), 2) AS mitjana_trans
FROM transaccions t
JOIN targeta g 
ON t.card_id = g.id
JOIN empreses e
ON t.business_id = e.company_id
WHERE e.company_name = "Donec Ltd"
GROUP BY g.iban;