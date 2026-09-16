ALTER TABLE productes
MODIFY price DECIMAL(10, 2),
MODIFY cost DECIMAL(10, 2),
ADD PRIMARY KEY (id);

CREATE TABLE IF NOT EXISTS transaccions_productes (
    transaccions_id VARCHAR(50),
    productes_id VARCHAR(50),
    PRIMARY KEY (transaccions_id, productes_id),
    FOREIGN KEY (transaccions_id) REFERENCES transaccions(id),
    FOREIGN KEY (productes_id) REFERENCES productes(id));

INSERT INTO transaccions_productes (transaccions_id, productes_id)
SELECT t.id AS transaccio, p.producte_id
FROM transaccions t,
	JSON_TABLE(
		CONCAT('[', t.product_ids, ']'),
		'$[*]' COLUMNS (
			producte_id VARCHAR(15) PATH '$')) AS p;

ALTER TABLE transaccions
DROP COLUMN product_ids;

SELECT productes_id, COUNT(transaccions_id) AS quantitat_trans
FROM transaccions_productes
GROUP BY productes_id;