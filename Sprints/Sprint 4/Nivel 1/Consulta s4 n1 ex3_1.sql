SELECT *
FROM sprint3_silver.transactions_recent
WHERE DATE(timestamp) >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY);