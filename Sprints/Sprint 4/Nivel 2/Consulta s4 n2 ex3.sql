SELECT dia AS Data, ROUND(diners, 2) AS Vendes_del_Dia,
  ROUND(
    SUM(diners) OVER (
      PARTITION BY EXTRACT(YEAR FROM dia) 
      ORDER BY dia 
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ),2) AS Vendes_Acumulades_YTD
FROM `sprint3_gold.mv_daily_sales`
ORDER BY dia ASC;