-- CREATE TABLE
CREATE TABLE car(
	car_id INT AUTO_INCREMENT,
    car_name VARCHAR(50) NOT NULL,
    car_color VARCHAR(30) NOT NULL, 
    car_year DATE NOT NULL,
    PRIMARY KEY(car_id)
);

CREATE TABLE motorcycle(
	moto_id INT AUTO_INCREMENT PRIMARY KEY,
    moto_name VARCHAR(50) NOT NULL,
    moto_color VARCHAR(30) NOT NULL, 
    moto_year DATE NOT NULL
);

-- creating a table from another table already created
CREATE TABLE car_copy AS
SELECT car_name, car_color, car_year
FROM car;

-- ALTER TABLE
-- adding a primary key to the car_copy table
ALTER TABLE car_copy
ADD car_id INT AUTO_INCREMENT PRIMARY KEY;

-- droping the car_year column from the car table
ALTER TABLE car
DROP COLUMN car_year;

-- droping the car_copy table
DROP TABLE car_copy;

-- putting back the car_year column
ALTER TABLE car
ADD car_year date not null; 

-- INSERT
INSERT INTO car (car_name, car_color, car_year)
VALUES 	('gol', 'green', '2010-01-01'),
		('corsa', 'blue', '2010-01-01'),
		('celta', 'black', '2010-01-01'),
		('gol', 'red', '2010-01-01'),
		('onix', 'black', '2010-01-01'),
		('saveiro', 'green', '2010-01-01'),
		('fusca', 'brown', '2010-01-01'),
		('tida', 'white', '2010-01-01');

-- SELECT        
SELECT * FROM car
WHERE car_name LIKE 'tida';

-- DELETE 
DELETE FROM car
WHERE car_year LIKE '2010-01-01';

show tables
