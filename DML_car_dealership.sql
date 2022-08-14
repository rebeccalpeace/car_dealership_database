-- need to have at least 2 rows of data per table 
-- at least two of the inserts should come from a stored procedure


-- procedure for adding salespersons to salesperson table
CREATE OR REPLACE PROCEDURE add_employee(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO salesperson(first_name, last_name)
	VALUES (first_name, last_name);
END;
$$

CALL add_employee('Reid', 'Alexander');
CALL add_employee('Amelia', 'Spencer');
CALL add_employee('Fiona', 'Armstrong');
CALL add_employee('Darcy', 'Tucker');
CALL add_employee('Oscar', 'Douglas');


-- procedure for adding mechanics to table
CREATE OR REPLACE PROCEDURE add_mechanic(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic(first_name, last_name)
	VALUES (first_name, last_name);
END;
$$

CALL add_mechanic('Sabrina', 'Grant');
CALL add_mechanic('Chloe', 'Gray');
CALL add_mechanic('Carlos', 'Carter');

SELECT *
FROM mechanic;



-- insert car data into car table
INSERT INTO car(
	make,
	model,
	color,
	car_year,
	used,
	price
) VALUES (
	'Toyota',
	'Camry',
	'black',
	2022,
	FALSE,
	30000.00
), (
	'Ford',
	'Mustang',
	'red',
	2018,
	TRUE,
	15000.00
), (
	'Ford',
	'F150',
	'silver',
	2010,
	TRUE,
	8000.00
), (
	'Jeep',
	'Cherokee',
	'yellow',
	2022,
	FALSE,
	40000.00
), (
	'Toyota',
	'Tacoma',
	'red',
	2010,
	TRUE,
	5000.00
), (
	'Nissan',
	'Versa',
	'blue',
	2012,
	TRUE,
	7000.00
), (
	'Pontiac',
	'Grand Am',
	'green',
	2008,
	TRUE,
	6000.00
), (
	'Honda',
	'Pilot',
	'silver',
	2022,
	FALSE,
	50000.00
), (
	'Ford',
	'Explorer',
	'black',
	2015,
	TRUE,
	10000.00
), (
	'Chevrolet',
	'Corvette',
	'pink',
	2022,
	FALSE,
	60000.00
);

INSERT INTO car(
	make,
	model,
	color,
	car_year,
	used,
	price
) VALUES (
	'Nissan',
	'Maxima',
	'silver',
	2022,
	FALSE,
	40000.00
), (
	'Kia',
	'Sorento',
	'blue',
	2017,
	TRUE,
	15000.00
), (
	'Dodge',
	'Charger',
	'gray',
	2019,
	TRUE,
	25000.00
), (
	'Jeep',
	'Wrangler',
	'black',
	2022,
	FALSE,
	35000.00
), (
	'Jeep',
	'Gladiator',
	'red',
	2010,
	TRUE,
	9000.00
), (
	'Honda',
	'Civic',
	'white',
	2015,
	TRUE,
	7000.00
), (
	'Chevrolet',
	'El Camino',
	'gold',
	1990,
	TRUE,
	20000.00
), (
	'Dodge',
	'Durango',
	'red',
	2022,
	FALSE,
	55000.00
), (
	'Ford',
	'Explorer',
	'white',
	2017,
	TRUE,
	13500.00
), (
	'Toyota',
	'Camry',
	'blue',
	2022,
	FALSE,
	40000.00
);



-- procedure for inserting customers
CREATE OR REPLACE PROCEDURE add_customer(
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	phone_num VARCHAR(12),
	address_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, email, phone_num, address_id)
	VALUES (first_name, last_name, email, phone_num, address_id);
END;
$$

CALL add_customer('Stuart', 'Turner', 's.turner@randatmail.com', '604-781-4612', null);
CALL add_customer('Lucia', 'Scott', 'l.scott@randatmail.com', '309-470-7289', null);
CALL add_customer('Edgar', 'Thomas', 'e.thomas@randatmail.com', '804-402-8213', null);
CALL add_customer('Vincent', 'Farrell', 'v.farrell@randatmail.com', '187-721-0365', null);
CALL add_customer('Isabella', 'Andrews', 'i.andrews@randatmail.com', '232-716-1876', null);
CALL add_customer('Patrick', 'Kelly', 'p.kelly@randatmail.com', '755-739-4976', null);
CALL add_customer('Maddie', 'Barrett', 'm.barrett@randatmail.com', '212-581-3954', null);
CALL add_customer('Tony', 'Cole', 't.cole@randatmail.com', '539-591-4943', null);
CALL add_customer('Lana', 'Bailey', 'l.bailey@randatmail.com', '920-570-3332', null);
CALL add_customer('Brooke', 'Russell', 'b.russell@randatmail.com', '965-365-4256', null);

SELECT *
FROM customer;


-- procedure for inserting addresses
CREATE OR REPLACE PROCEDURE add_address(
	street VARCHAR(100),
	city VARCHAR(50),
	state VARCHAR(50),
	zip VARCHAR(5)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO address(street, city, state, zip)
	VALUES (street, city, state, zip);
END;
$$

CALL add_address('10 W. Shub Farm Drive', 'Davison', 'MI', '48423');
CALL add_address('873 North Riverside Street', 'New Windsor', 'NY', '12553');
CALL add_address('8675 Galvin Street', 'Newington', 'CT', '06111');
CALL add_address('8680 Alton Road', 'Palatine', 'IL', '60067');
CALL add_address('8506 East Sugar St.', 'New Lenox', 'IL', '60451');
CALL add_address('68 E. Cross St.', 'Peoria', 'IL', '61604');
CALL add_address('2 Second Lane', 'Bergenfield', 'NJ', '07621');
CALL add_address('30 Branch Dr.', 'Londonderry', 'NH', '03053');
CALL add_address('6 Orchard St.', 'Victoria', 'TX', '77904');

SELECT *
FROM customer
ORDER BY customer_id;

-- update address on customer TABLE 
UPDATE customer 
SET address_id = 5
WHERE customer_id = 10;

-- add services to service table
INSERT INTO service(car_id, mechanic_id)
VALUES (3,2);
INSERT INTO service(car_id, mechanic_id)
VALUES (7,1);
INSERT INTO service(car_id, mechanic_id)
VALUES (10,1);
INSERT INTO service(car_id, mechanic_id)
VALUES (15,3);
INSERT INTO service(car_id, mechanic_id)
VALUES (19,2);

SELECT *
FROM invoice;

-- add service_tickets
INSERT INTO service_ticket(description, price, service_id)
VALUES ('oil change', 45.00, 1);
INSERT INTO service_ticket(description, price, service_id)
VALUES ('tire change and rotation', 200.00, 2);
INSERT INTO service_ticket(description, price, service_id)
VALUES ('battery replacement', 100.00, 3);
INSERT INTO service_ticket(description, price, service_id)
VALUES ('windshield repair', 300.00, 4);
INSERT INTO service_ticket(description, price, service_id)
VALUES ('inspection', 35.00, 5);

-- add invoices
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (1, 3, 1);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (3, 1, 9);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (3, 4, 2);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (2, 12, 4);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (5, 11, 5);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (4, 6, 7);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (2, 20, 8);
INSERT INTO invoice(sales_id, car_id, customer_id)
VALUES (5, 16, 10);

DELETE FROM invoice 
WHERE invoice_id = 9;
