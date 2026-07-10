-- LAB 6 : Using In-built Functions with DML

-- Step 1: Create Database
CREATE DATABASE lab6;
USE lab6;

-- Step 2: Create Table
CREATE TABLE works (
    employee_name VARCHAR(50),
    company_name VARCHAR(50),
    salary INT
);

-- Step 3: Insert Data
INSERT INTO works VALUES
('David','First Bank Corporation',16000),
('Vision','First Bank Corporation',16000),
('Pradipsyste','First Bank Corporation',16000),
('Hero','Small Bank Corporation',8000),
('Luffy','ABC Bank Corporation',14000);

-- Display Table
SELECT * FROM works;

-- =====================================================
-- Question 1
-- Find those companies where the average salary is more than 12000.
SELECT company_name
FROM works
GROUP BY company_name
HAVING AVG(salary) > 12000;

-- =====================================================
-- Question 2
-- Find those companies whose average salary is higher than
-- the average salary at First Bank Corporation.
SELECT company_name
FROM works
GROUP BY company_name
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM works
    WHERE company_name = 'First Bank Corporation'
);

-- =====================================================
-- Question 3
-- Find company that has the smallest payroll.
SELECT company_name
FROM works
GROUP BY company_name
HAVING SUM(salary) <= ALL
(
    SELECT SUM(salary)
    FROM works
    GROUP BY company_name
);

-- =====================================================
-- Question 4
-- Find those companies who have minimum 3 employees.
SELECT company_name
FROM works
GROUP BY company_name
HAVING COUNT(*) >= 3;
