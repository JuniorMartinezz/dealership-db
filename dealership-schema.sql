CREATE DATABASE dealership;
USE dealership;

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
VALUES 	('gol', 'green', '2023-02-01'),
		('corsa', 'blue', '2000-11-02'),
		('celta', 'black', '2011-12-03'),
		('gol', 'red', '2022-11-22'),
		('onix', 'black', '2013-10-09'),
		('saveiro', 'green', '2010-09-10'),
		('fusca', 'brown', '2009-02-01'),
		('tida', 'white', '2000-05-01')
;

INSERT INTO motorcycle (moto_name, moto_color, moto_year)
VALUES 	('kawasaki', 'green', '2023-02-01'),
		('yamaha', 'blue', '2000-11-02'),
		('bis', 'black', '2011-12-03'),
		('suzuki', 'red', '2022-11-22'),
		('kawasaki', 'black', '2013-10-09'),
		('honda', 'green', '2010-09-10'),
		('bmw', 'brown', '2009-02-01'),
		('hornet', 'white', '2000-05-01')
;

-- SELECT        
SELECT * FROM car --returns a limit by 5 results of cars in the car table
ORDER BY car_name
LIMIT 5;

SELECT * FROM car -- selects all the cars with the name 'tida'
WHERE car_name LIKE 'tida';

SELECT * FROM car -- returns all cars that starts with the letter 't'
WHERE car_name LIKE 't%'; 

SELECT DISTINCT
	moto.moto_name as moto, 
	moto.moto_year as "moto year",
	car.car_name as car,
	car.car_year as "car year"
FROM motorcycle as moto, car
WHERE MONTH(moto.moto_year) and MONTH(car.car_year) LIKE '11';

-- DELETE 
DELETE FROM car -- delete all cars where the year's equal to 2010-01-01
WHERE car_year LIKE '2010-09-10';

show tables
