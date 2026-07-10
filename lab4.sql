-- LAB 4: Subqueries & JOIN Queries
 
CREATE DATABASE lab4;
USE lab4;
 
CREATE TABLE customer (
  cid INT,
  name VARCHAR(50),
  age INT,
  address VARCHAR(50),
  salary DECIMAL(10,2)
);

CREATE TABLE `order` (
  oid INT,
  order_date DATETIME,
  cid INT,
  amount DECIMAL(10,2)
);

CREATE TABLE employee (
  eid INT,
  ename VARCHAR(50),
  job VARCHAR(50),
  did INT,
  salary DECIMAL(10,2)
);

CREATE TABLE department (
  did INT,
  dname VARCHAR(50),
  location VARCHAR(50)
);

-- Check tables
SHOW TABLES;

 
-- INSERT DATA
 

INSERT INTO customer VALUES
(1,'ram',32,'kathmandu',2000.00),
(2,'shyam',25,'patan',1500.00),
(3,'hari',23,'dharan',2000.00),
(4,'gopal',25,'pokhara',6500.00),
(5,'sita',27,'bhaktapur',8500.00),
(6,'gita',22,'illam',4500.00),
(7,'rita',24,'banepa',10000.00);

INSERT INTO `order` VALUES
(102,'2015-10-08 00:00:00',3,3000),
(100,'2014-10-08 00:00:00',3,1500),
(101,'2014-11-20 00:00:00',2,1560),
(103,'2013-05-20 00:00:00',4,2060);

INSERT INTO employee VALUES
(1,'arjun','AP',1,10000.00),
(2,'rabi','JP',2,12000.00),
(3,'rohan','AP',2,15000.00),
(4,'krishna','AP',1,20000.00);

INSERT INTO department VALUES
(1,'accounting','kathmandu'),
(2,'sales','patan'),
(3,'research','banepa'),
(4,'operations','bhaktapur');

-- View data
SELECT * FROM customer;
SELECT * FROM `order`;
SELECT * FROM employee;
SELECT * FROM department;
 
-- SUBQUERIES
 

-- 1
SELECT ename, salary 
FROM employee 
WHERE salary > (SELECT MIN(salary) FROM employee)
AND job LIKE 'j%';

-- 2
SELECT * FROM employee 
WHERE job = (SELECT job FROM employee WHERE ename='arjun');

-- 3
SELECT * FROM employee 
WHERE salary > (
  SELECT MAX(salary) 
  FROM employee 
  WHERE did = 1
);
 
-- JOIN QUERIES
 

-- INNER JOIN
SELECT customer.cid, customer.name 
FROM customer 
INNER JOIN `order` 
ON customer.cid = `order`.cid;

-- LEFT JOIN
SELECT customer.cid, customer.name 
FROM customer 
LEFT JOIN `order` 
ON customer.cid = `order`.cid;

-- RIGHT JOIN
SELECT customer.cid, customer.name 
FROM customer 
RIGHT JOIN `order` 
ON customer.cid = `order`.cid;
