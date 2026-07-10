-- LAB 3: Data Query Language (DQL)

-- Step 1: Create Database
 
CREATE DATABASE lab3;
USE lab3;

-- Step 2: Create Table
CREATE TABLE employee(
  eid INT NOT NULL,
  ename VARCHAR(20) NOT NULL,
  job VARCHAR(20),
  country VARCHAR(25),
  city VARCHAR(25),
  salary INT NOT NULL
);

-- Check table
SHOW TABLES;

-- Step 3: Insert Data
INSERT INTO employee VALUES
(1,'Pradip','Manager','Nepal','Pokhara',20000),
(2,'John','Programmer','Germany','Munich',5000),
(3,'Bishnu','Doctor','Germany','Berlin',2500),
(4,'Prabin','Banker','Germany','Hamburg',3400),
(5,'Ujjwal','Analyst','Nepal','Makawanpur',1300),
(6,'Harry','Engineer','Nepal','Dhampus',200),
(7,'Sabin','Army','India','Delhi',2000),
(8,'Ron','Manager','UK','Manchester',20000),
(9,'Binod','Lecturer','India','Bihar',240),
(10,'Madhav','Pilot','Finland','London',20000);

-- View data
SELECT * FROM employee;
SELECT * FROM employee;
SELECT ename, job FROM employee;
SELECT * FROM employee 
WHERE country = 'Germany' AND salary > 2000;

-- 4
SELECT ename, country, job, salary 
FROM employee 
WHERE job IN ('Programmer','Manager');

-- 5
SELECT * FROM employee 
WHERE country = 'Germany' 
AND city IN ('Munich','Berlin');

-- 6
SELECT * FROM employee ORDER BY eid DESC;

-- 7
SELECT * FROM employee WHERE ename LIKE 'J%';

-- 8
SELECT * FROM employee WHERE country LIKE '%y';

-- 9
SELECT * FROM employee WHERE country LIKE '%e%';

-- 10
SELECT * FROM employee WHERE country NOT LIKE '%land%';

-- 11
SELECT * FROM employee WHERE city LIKE '%erlin';

-- 12
SELECT * FROM employee WHERE city LIKE 'l_n_on';

-- 13
SELECT * FROM employee 
WHERE city LIKE 'b%' OR city LIKE 'm%' OR city LIKE 'd%';

-- 14
SELECT * FROM employee 
WHERE city LIKE 'a%' OR city LIKE 'b%' OR city LIKE 'c%';

-- 15
SELECT * FROM employee 
WHERE city NOT LIKE 'b%' 
AND city NOT LIKE 'm%' 
AND city NOT LIKE 'd%';

-- 16
SELECT * FROM employee 
WHERE city IN ('Delhi','Manchester');

-- 17
SELECT * FROM employee 
WHERE salary BETWEEN 20000 AND 35000;

-- 18
SELECT * FROM employee 
WHERE salary BETWEEN 10000 AND 40000 
AND eid NOT IN (1,2,3);

-- 19
SELECT * FROM employee 
WHERE city BETWEEN 'b' AND 'm';

-- 20
SELECT * FROM employee 
WHERE city NOT BETWEEN 'b' AND 'm';
