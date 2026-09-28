SELECT *
FROM `sprint3_gold.v_marketing_kpis`
ORDER BY 
  CASE WHEN client_tier = 'Premium' THEN 1 ELSE 2 END,
  mitjana_ingressos DESC;