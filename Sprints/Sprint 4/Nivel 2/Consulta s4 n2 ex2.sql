SELECT dia AS Data, ROUND(diners, 2) AS Vendes_Avui, ROUND(LAG(diners) OVER (ORDER BY dia), 2) AS Vendes_Ahir,
  ROUND((diners - LAG(diners) OVER (ORDER BY dia)) / LAG(diners) OVER (ORDER BY dia) * 100, 2) AS Diff_Percentual
FROM `sprint3_gold.mv_daily_sales`
ORDER BY dia ASC;