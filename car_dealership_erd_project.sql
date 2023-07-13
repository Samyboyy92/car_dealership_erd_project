CREATE TABLE Salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(50),
  email VARCHAR(50)
);

CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_numer VARCHAR(50),
  email VARCHAR(50)
);

CREATE TABLE Mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50)
);

CREATE TABLE Car (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(50),
  model VARCHAR(50),
  model_year INTEGER,
  is_serviced BOOLEAN,	
  customer_id INTEGER,
	FOREIGN KEY (customer_id)
	REFERENCES Customer(customer_id)
);

CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  total_amount VARCHAR(50),
  salesperson_id INTEGER,
  car_id INTEGER,
  mechanic_id INTEGER,
	FOREIGN KEY (salesperson_id)
	REFERENCES Salesperson(salesperson_id),
	FOREIGN KEY (car_id)
	REFERENCES Car(car_id),
	FOREIGN KEY (mechanic_id)
	REFERENCES Mechanic(mechanic_id)
);


CREATE TABLE Service_Ticket (
  ticket_id SERIAL PRIMARY KEY,
  work_done VARCHAR(50),
  amount_charged NUMERIC(5,2),
  customer_id INTEGER,
  car_id INTEGER,
	FOREIGN KEY (customer_id)
	REFERENCES Customer(customer_id),
	FOREIGN KEY (car_id)
	REFERENCES Car(car_id)
);


CREATE TABLE Service_History (
  history_id SERIAL PRIMARY KEY,
  car_id INTEGER,
  customer_id INTEGER,
  ticket_id INTEGER,
	FOREIGN KEY (car_id)
	REFERENCES Car(car_id),
	FOREIGN KEY (customer_id)
	REFERENCES Customer(customer_id),
	FOREIGN KEY (ticket_id)
	REFERENCES Service_Ticket(ticket_id)
);
