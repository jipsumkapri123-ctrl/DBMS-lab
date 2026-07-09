 DROP DATABASE ncit;
CREATE DATABASE ncit;
USE ncit;
 -- LAB 2 WITH OUTPUT AFTER EACH STEP

-- Step 1: Create Database
 

-- Step 2: Create Table
CREATE TABLE employee(
  e_id INT NOT NULL,
  e_name VARCHAR(20) NOT NULL,
  e_job VARCHAR(20),
  e_salary INT NOT NULL
);

-- 🔍 Check table created
SHOW TABLE;

-- Step 3: Insert Single Record
INSERT INTO employee VALUES
(1,'Pradip','mlEngineer',25000);

-- 🔍 View after first insert
SELECT * FROM employee;

-- Step 4: Insert Multiple Records
INSERT INTO employee VALUES
(2,'Prabin','analyst',20000),
(3,'Bishnu','HoD',15000),
(4,'Ujjwal','WebDevelopment',10000),
(5,'Nischal','lecturer',50000),
(6,'Sabin','Programmer',20000),
(7,'Pooja','Programmer',20000),
(8,'Subash','Programmer',10000),
(9,'Xaya','analyst',20000),
(10,'Rajan','Designer',15000),
(11,'Roshani','Designer',10000);

-- 🔍 View all data
SELECT * FROM employee;

-- Step 5: Update Salary of Programmers
UPDATE employee 
SET e_salary = 25000 
WHERE e_job = 'Programmer';

-- 🔍 Check update result
SELECT * FROM employee WHERE e_job = 'Programmer';

-- Step 6: Display All Data
SELECT * FROM employee;

-- Step 7: Display Name and Job
SELECT e_name, e_job FROM employee;

-- Step 8: Delete Designers
DELETE FROM employee 
WHERE e_job = 'Designer';

-- 🔍 Check delete result
SELECT * FROM employee;

-- Step 9: Show Analysts
SELECT * FROM employee 
WHERE e_job = 'analyst';

-- Step 10: Show Unique Jobs
SELECT DISTINCT e_job FROM employee;

-- Step 11: Salary >= 20000
SELECT e_name, e_job 
FROM employee 
WHERE e_salary >= 20000;