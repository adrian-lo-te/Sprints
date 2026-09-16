CREATE TABLE credit_card (
	id VARCHAR(50),
	iban VARCHAR(50),
    pan VARCHAR(50),
    pin VARCHAR(50),
    cvv VARCHAR(3),
    expiring_date VARCHAR(10)
    );

ALTER TABLE credit_card
ADD PRIMARY KEY (id);

ALTER TABLE transaction
ADD CONSTRAINT fk_transaction_card
FOREIGN KEY (credit_card_id)
REFERENCES credit_card(id);