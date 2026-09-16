INSERT INTO credit_card (id, iban, pan, pin, cvv, expiring_date) 
VALUES ("CcU-9999", "TR323456312213576817699888", "5424465566813622", "1234", "123", "11/30/22");

INSERT INTO company (id, company_name, phone, email, country, website) 
VALUES ("b-9999", "Jamon SL", "01 02 03 04 05", "jamon@sl.com", "Andorra", "https://jamon.sl");

INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
VALUES ("108B1D1D-5B23-A76C-55EF-C568E49A99DD", "CcU-9999", "b-9999", "9999", 829.999, -117.999, 111.11, 0);