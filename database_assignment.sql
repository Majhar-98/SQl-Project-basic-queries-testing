-- create database
CREATE DATABASE database_assignment;

-- switch to database
USE database_assignment;

-- create customers table
CREATE TABLE customers (
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  date_of_birth DATE,
  phone VARCHAR(15),
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  points INT 
);


-- insert customer data
 INSERT INTO customers (first_name, last_name, date_of_birth, phone, address, city, state, points)
VALUES
  ('Barbara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
  ('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
  ('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', 2967),
  ('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', 457),
  ('Clemmie', 'Betchley', '1973-11-07', '', '5 Spohn Circle', 'Arlington', 'TX', 3675);
  
  -- showing the table
SELECT * FROM customers;

-- select only 2 customers whose points are more than 1000
SELECT * 
FROM customers 
WHERE points > 1000 
LIMIT 2;

-- select customers whose age is in 1980 to 1990 or points less than 1000
SELECT * FROM customers
WHERE Date_of_Birth BETWEEN '1980-01-01' AND '1990-01-01'
OR points <1000;

-- order customers by points in ascending order
SELECT * 
FROM customers 
ORDER BY points ASC;

-- select customers whose name contains 'burgh' using Regular Expression
SELECT * 
FROM customers 
WHERE first_name REGEXP '.*burgh.*' OR last_name REGEXP '.*burgh.*';

-- select customers who do not have a phone number
SELECT * 
FROM customers 
WHERE phone = '';

-- change the 'Date of Birth' column name to 'dob'
ALTER TABLE customers 
CHANGE date_of_birth dob DATE;

-- find the customer with the maximum points
SELECT first_name, last_name 
FROM customers 
WHERE points = (SELECT MAX(points) FROM customers);

SELECT CONCAT(first_name,' ',last_name) AS 'Name',points,
CASE
	WHEN Points<1000 THEN 'They are Bronze Member.',
	WHEN Points>=1000 AND Points<2000 THEN 'They are Silver Member.',
	WHEN Points>=2000 AND Points<3000 THEN 'They are Gold Member.',
	ELSE 'They are Platinum Member.'
	END AS Membership FROM customers;
	





