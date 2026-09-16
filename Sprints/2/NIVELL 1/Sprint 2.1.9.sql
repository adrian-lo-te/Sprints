SELECT *
FROM usuaris
WHERE id IN ( 	
	SELECT user_id
	FROM transaccions
    WHERE declined = 0
	GROUP BY user_id
	HAVING COUNT(id) > 80);