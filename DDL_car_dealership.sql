-- create address table
CREATE TABLE address(
	address_id SERIAL PRIMARY KEY,
	street VARCHAR(100),
	city VARCHAR(50),
	state VARCHAR(50),
	zip VARCHAR(5)
);

-- create customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	phone_num VARCHAR(12),
	address_id INTEGER,
	FOREIGN KEY(address_id) REFERENCES address(address_id)
);

-- create salesperson table
CREATE TABLE salesperson(
	sales_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

-- create car table
CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	color VARCHAR(50),
	car_year INTEGER,
	used BOOLEAN,
	price NUMERIC(7,2)
);

-- create invoice table
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	sales_id INTEGER NOT NULL,
	FOREIGN KEY(sales_id) REFERENCES salesperson(sales_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- create mechanic table
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

-- create service table
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

-- create service ticket table
CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	description VARCHAR(250),
	price NUMERIC(7,2),
	service_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service(service_id)
);
SELECT *
FROM salesperson;