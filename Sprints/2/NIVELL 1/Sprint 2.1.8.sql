CREATE DATABASE ventes;
USE ventes;

CREATE TABLE transaccions (
	id VARCHAR(50),
    card_id VARCHAR(50),
    business_id VARCHAR(50),
    timestamp VARCHAR(50),
    amount FLOAT,
    declined VARCHAR(1),
    product_ids VARCHAR(50),
    user_id VARCHAR(50),
    lat FLOAT,
    longitude FLOAT,
    discount_amount FLOAT,
    tax_amount FLOAT,
    shipping_amount FLOAT,
    channel VARCHAR(50),
    campaign_id  VARCHAR(50),
    device_type VARCHAR(50),
    is_international VARCHAR(1),
    decline_reason VARCHAR(50),
    distance_km FLOAT);

CREATE TABLE targeta (
	id VARCHAR(50), 
    user_id VARCHAR(50), 
    iban VARCHAR(50), 
    pan VARCHAR(50), 
    pin VARCHAR(50), 
    cvv VARCHAR(50), 
    track1 VARCHAR(50), 
    track2 VARCHAR(50), 
    expiring_date VARCHAR(50), 
    card_type VARCHAR(50), 
    card_renewal_flag VARCHAR(50));
    
CREATE TABLE usuaris (
	id VARCHAR(50),
    name VARCHAR(50),
    surname VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(50),
    birth_date VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(50),
    adress VARCHAR(50),
    signup_date VARCHAR(50),
    user_segment VARCHAR(50),
    income_band VARCHAR(50));
    
CREATE TABLE empreses (
	company_id VARCHAR(50),
    company_name VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(50),
    country VARCHAR(50),
    website VARCHAR(50),
    merchan_category VARCHAR(50),
    merchan_price_position VARCHAR(50));

CREATE TABLE productes (
id VARCHAR(50),
product_name VARCHAR(50),
price FLOAT,
colour VARCHAR(50),
weight FLOAT,
warehouse_id VARCHAR(50),
category VARCHAR(50),
brand VARCHAR(50),
cost FLOAT,
launch_date VARCHAR(20));


ALTER TABLE empreses
ADD PRIMARY KEY (company_id);

ALTER TABLE usuaris
ADD PRIMARY KEY (id);

ALTER TABLE targeta
ADD PRIMARY KEY (id);

ALTER TABLE transaccions
ADD PRIMARY KEY (id),
ADD CONSTRAINT fk_trans_targ
FOREIGN KEY (card_id)
REFERENCES targeta(id),
ADD CONSTRAINT fk_trans_empr
FOREIGN KEY (business_id)
REFERENCES empreses(company_id),
ADD CONSTRAINT fk_trans_usua
FOREIGN KEY (user_id)
REFERENCES usuaris(id);

ALTER TABLE targeta
ADD CONSTRAINT fk_targ_usua
FOREIGN KEY (user_id)
REFERENCES usuaris(id);