-- Once the database has been created, each person should create their own database inside of PGAdmin. Also, once the database and the tables are created, 
--each person should have AT LEAST 4 pieces/records of data inside of the tables. (You can add more if you want)

-- At least 3 of the inserts should come from a stored function but you can, and it is recommended, 
--to do all of them this way.. (You can always add more if you want)
CREATE OR REPLACE FUNCTION new_sales_rep(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone_number VARCHAR, _email VARCHAR)
RETURNS void
AS $$
BEGIN
	INSERT INTO Salesperson
	VALUES(_salesperson_id, _first_name, _last_name, _phone_number, _email);
END;
$$
LANGUAGE plpgsql;

SELECT new_sales_rep(001, 'John', 'Doe', '904.786.9090', 'john.doe@chevydealers.com');

SELECT new_sales_rep(002, 'Sam', 'Mennenga', '773.465.2000', 'sam.mennenga@chevydealers.com');

SELECT new_sales_rep(003, 'Jason', 'Borne', '773.533.4223', 'jason.borne@chevydealers.com');

SELECT new_sales_rep(004, 'Jonny', 'Woldmann', '858.908.8374', 'jonny.woldmann@chevydealers.com');

SELECT *
FROM Salesperson;

----------

CREATE OR REPLACE FUNCTION new_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone_number VARCHAR, _email VARCHAR)
RETURNS void
AS $$
BEGIN
	INSERT INTO Mechanic
	VALUES(_mechanic_id, _first_name, _last_name, _phone_number, _email);
END;
$$
LANGUAGE plpgsql;

SELECT new_mechanic(001, 'Carl', 'Swanson', '904.878.7771', 'carl.swanson@chevydealers.com');

SELECT new_mechanic(002, 'Greg', 'Green', '904.699.4342', 'greg.green@chevydealers.com');

SELECT new_mechanic(003, 'Keith', 'Gadawski', '904.644.3330', 'keith.Gadawski@chevydealers.com');

SELECT new_mechanic(004, 'Cullin', 'Smith', '904.943.2123', 'Cullin.Smith@chevydealers.com');

SELECT *
FROM Mechanic;

------------

CREATE OR REPLACE FUNCTION new_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone_number VARCHAR, _email VARCHAR)
RETURNS void
AS $$
BEGIN
	INSERT INTO Customer
	VALUES(_customer_id, _first_name, _last_name, _phone_number, _email);
END;
$$
LANGUAGE plpgsql;

SELECT new_customer(001, 'Andrew', 'Garcia', '565.831.2398', 'ggarcia@gmail.com');

SELECT new_customer(002, 'Ed', 'Tores', '565.467.6681', 'etores@yahoo.com');

SELECT new_customer(003, 'Mitch', 'Dela', '898.907.4344', 'mdela@gmail.com');

SELECT new_customer(004, 'Kimberlyn', 'Mennenga', '898.433.1902', 'kmennenga@hotmail.com');

SELECT *
FROM Customer

----------

CREATE OR REPLACE FUNCTION new_whip(_car_id INTEGER, _make VARCHAR, _model VARCHAR, _model_year INTEGER, _is_serviced BOOLEAN, _customer_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO Car
	VALUES(_car_id, _make, _model, _model_year, _is_serviced, _customer_id);
END
$$
LANGUAGE plpgsql;

SELECT new_whip(001, 'Volkswagen', 'Beetle', 1963, True, 004);

SELECT new_whip(002, 'Audi', 'E-Tron', 2022, False, 001);

SELECT new_whip(003, 'Subaru', 'Crosstrek', 2020, True, 004);

SELECT new_whip(004, 'Dodge', 'Charger', 1970, True, 002);

SELECT new_whip(005, 'Ford', 'Mustang', 1964, False, 003);

SELECT new_whip(006, 'Aston Martin', 'DBX', 2023, False, 003);

SELECT new_whip(007, 'McLaren', '720s', 2023, True, 003);
	

SELECT *
FROM Car;

-------------------

CREATE OR REPLACE FUNCTION make_invoice(_invoice_id INTEGER, _total_amount VARCHAR, _salesperson_id INTEGER, _car_id INTEGER, _mechanic_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO Invoice
	VALUES(_invoice_id, _total_amount, _salesperson_id, _car_id, _mechanic_id);
END
$$
LANGUAGE plpgsql;

SELECT make_invoice(001, '73215.00', 001, 002, NULL);

SELECT make_invoice(002, '32350.00', 001, 005, NULL);

SELECT make_invoice(003, '45900.00', 003, 001, 004);

SELECT make_invoice(004, '282300.00', 004, 007, 004);

SELECT make_invoice(005, '582,580.00', 002, 006, NULL);

SELECT *
FROM Invoice;

---------------

CREATE OR REPLACE FUNCTION serv_tick(_ticket_id INTEGER, _work_done VARCHAR, _amount_charged NUMERIC (5,2), _customer_id INTEGER, _car_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO Service_Ticket
	VALUES(_ticket_id, _work_done, _amount_charged, _customer_id, _car_id);
END
$$
LANGUAGE plpgsql;

SELECT serv_tick(001, 'Oil Change', '59.00', 004, 001);

SELECT serv_tick(002, 'Engine Swap', '799.00', 002, 004);

SELECT serv_tick(003, 'Transmission Swap', '759.00', 004, 003);

SELECT serv_tick(004, 'Tune-Up', '559.00', 003, 007);

SELECT *
FROM Service_Ticket;

---------------------

CREATE OR REPLACE FUNCTION serv_hist(_history_id INTEGER, _car_id INTEGER, _customer_id INTEGER, _ticket_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO Service_History
	VALUES(_history_id, _car_id, _customer_id, _ticket_id);
END
$$
LANGUAGE plpgsql;

SELECT serv_hist(001, 007, 003, 004);

SELECT serv_hist(002, 004, 002, 002);

SELECT serv_hist(003, 001, 004, 001);

SELECT serv_hist(004, 003, 004, 003);

SELECT *
FROM Service_History;

-----------------------

CREATE OR REPLACE PROCEDURE cambio_de_aceite(
	car_num INTEGER,
	customer_num INTEGER
)

LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE Car
	SET is_serviced = True
	WHERE car_id = car_num AND customer_id = customer_num;
	COMMIT;
END;
$$

CALL cambio_de_aceite(006, 003)






