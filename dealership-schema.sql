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

CREATE TABLE employees(

)

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

-- SELECT --

--returns a limit by 5 results of cars in the car table
SELECT * FROM car 
ORDER BY car_name
LIMIT 5;

-- returns a counting of all cars that starts with 'c' and orders ascendent by car name
SELECT count(car_id), car_name
FROM car
WHERE car_name LIKE 'c%'
GROUP BY car_name
ORDER BY car_name

-- select that returns a counting of kawasaki's
SELECT moto_name, count(moto_id) 
FROM motorcycle
WHERE moto_name LIKE 'kawasaki'
GROUP BY moto_name

-- select that returns a count of moto's that starts with the letter 'k'
SELECT count(moto_id) as "Moto's that start w/ 'k'" 
FROM motorcycle
WHERE moto_name LIKE 'k%'

-- selects all the cars with the name 'tida'
SELECT * FROM car 
WHERE car_name LIKE 'tida';

-- returns all cars that starts with the letter 't'
SELECT * FROM car 
WHERE car_name LIKE 't%'; 

-- select all cars that have 3 letters and orders in descendent way by the car_year
SELECT * FROM car 
WHERE car_name LIKE '___'
ORDER BY car_year desc

-- UNION that returns all cars and motos that have been launched on november, excluding the year
SELECT 'MOTO' AS TYPE, moto_name, moto_year
FROM motorcycle
WHERE MONTH(moto_year) = 11
UNION
SELECT 'CAR' AS TYPE, car_name, car_year
FROM car
WHERE MONTH(car_year) = 11;


-- DELETE 
DELETE FROM car -- delete all cars where the year's equal to 2010-01-01
WHERE car_year LIKE '2010-09-10';

show tables
