CREATE TABLE IF NOT EXISTS estat_targetes AS
SELECT card_id,
    CASE 
        WHEN ult_tra = 3 THEN 'inactiu'
        ELSE 'actiu'
    END AS estat
FROM (
    SELECT card_id, SUM(declined) AS ult_tra
    FROM (
        SELECT card_id, timestamp, declined,
            ROW_NUMBER() OVER(
                PARTITION BY card_id 
                ORDER BY timestamp DESC
            ) AS ultimes
        FROM transaccions
    ) AS c
    WHERE ultimes < 4
    GROUP BY card_id
) AS b;

SELECT COUNT(estat) AS quantitat_targetes_actives
FROM estat_targetes
WHERE estat = 'actiu';