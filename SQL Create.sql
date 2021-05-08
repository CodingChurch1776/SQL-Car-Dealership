CREATE TABLE mechanics(
	mech_id INTEGER PRIMARY KEY,
	first_name VARCHAR (45),
	last_name VARCHAR (45)
);

CREATE TABLE sales_staff(
	staff_id INTEGER PRIMARY KEY,
	first_name VARCHAR (45),
	last_name VARCHAR (45)
);

CREATE TABLE parts(
	part_id INTEGER PRIMARY KEY,
	part_amount NUMERIC (5,2)
);

CREATE TABLE customer(
	customer_id INTEGER PRIMARY KEY,
	first_name VARCHAR (45),
	last_name VARCHAR (45)
);

SELECT *
FROM customer

CREATE TABLE cars(
	car_id SERIAL PRIMARY KEY,
	amount NUMERIC (5,2),
	prod_name VARCHAR (100),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(staff_id ) REFERENCES sales_staff(staff_id),
	FOREIGN KEY(mech_id) REFERENCES mechanics(mech_id) 
);

CREATE TABLE service(
	serv_ticket_num SERIAL PRIMARY KEY,
	FOREIGN KEY (car_id) REFERENCES cars(car_id),
	FOREIGN KEY (mech_id) REFERENCES mechanics(mech_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (serv_ticket_num) REFERENCES service(serv_ticket_num),
	FOREIGN KEY (part_id) REFERENCES parts(part_id),
	FOREIGN KEY (staff_id) REFERENCES sales_staff(staff_id)
);