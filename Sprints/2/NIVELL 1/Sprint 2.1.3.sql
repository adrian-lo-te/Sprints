SELECT *
FROM transaction 
WHERE company_id IN (
	SELECT id
	FROM company
	WHERE country = "Germany") AND declined != 1;

SELECT DISTINCT company_id
FROM transaction 
WHERE amount > (
	SELECT AVG(amount)
	FROM transaction
    WHERE declined != 1) AND declined != 1;
    
SELECT id, company_name AS nom
FROM company
WHERE id NOT IN (
	SELECT DISTINCT company_id
	FROM transaction);