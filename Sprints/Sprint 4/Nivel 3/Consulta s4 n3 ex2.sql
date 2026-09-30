SELECT product_name,COUNT(*) AS unitats_venudes,ROUND(SUM(product_price), 2) AS facturacio_total
FROM `sprint3_gold.dim_transactions_flat`
GROUP BY product_name
ORDER BY unitats_venudes DESC
LIMIT 5;