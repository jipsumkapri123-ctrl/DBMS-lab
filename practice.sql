 

DROP DATABASE IF EXISTS practice_db;

CREATE DATABASE practice_db;
USE practice_db;

 
-- CREATE TABLES
 
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);


CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY(course_id) REFERENCES courses(course_id),
    FOREIGN KEY(student_id) REFERENCES Students(student_id)
);



-- ===============================
-- INSERT DATA
-- ===============================

INSERT INTO Students VALUES
(1,'Alice Smith',20,'alice@example.com','555-0101'),
(2,'Bob Johnson',22,'bob@example.com','555-0102'),
(3,'Charlie Brown',19,'charlie@example.com','555-0103'),
(4,'Diana Prince',21,'diana@example.com','555-0104'),
(5,'Evan Wright',23,'evan@example.com','555-0105');


INSERT INTO courses VALUES
(101,'Introduction to Computer Science',3),
(102,'Data Structures',4),
(103,'Database Management Systems',3),
(104,'Web Development',3),
(105,'Artificial Intelligence',4);


INSERT INTO enrollment VALUES
(1001,101,1),
(1002,103,1),
(1003,102,2),
(1004,104,2),
(1005,101,3),
(1006,105,4),
(1007,103,5),
(1008,105,5),
(1009,102,1);



-- ===============================
-- BASIC QUERIES
-- ===============================

SELECT * FROM Students;

SELECT name,email 
FROM Students;

SELECT *
FROM Students
WHERE age > 20;

SELECT name
FROM Students
WHERE name LIKE 'A%';

SELECT *
FROM courses
WHERE name LIKE '%Science%';

SELECT *
FROM Students
ORDER BY age DESC;

SELECT *
FROM Students
WHERE phone_number='555-0103';



-- ===============================
-- ALTER TABLE
-- ===============================

ALTER TABLE Students 
ADD address VARCHAR(255);

ALTER TABLE Students 
ADD is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE Students
MODIFY phone_number VARCHAR(50);

ALTER TABLE courses
RENAME COLUMN name TO course_name;

ALTER TABLE courses
ADD CONSTRAINT chk_credit CHECK(credit_hour >= 1);



-- ===============================
-- UPDATE
-- ===============================

UPDATE Students
SET phone_number='555-9999'
WHERE student_id=1;


UPDATE Students
SET age=23,
email='bob.j@newemail.com'
WHERE student_id=2;


UPDATE courses
SET credit_hour=credit_hour+1
WHERE credit_hour=3;


UPDATE Students
SET email=LOWER(email);


UPDATE courses
SET credit_hour=5
WHERE course_name='Data Structures';



-- ===============================
-- DELETE
-- ===============================

DELETE FROM enrollment
WHERE student_id=3;

DELETE FROM Students
WHERE student_id=3;

DELETE FROM Students
WHERE name='Evan Wright';



-- ===============================
-- AGGREGATE FUNCTIONS
-- ===============================

SELECT COUNT(*) FROM Students;

SELECT AVG(age)
FROM Students;

SELECT MAX(credit_hour)
FROM courses;

SELECT MIN(age)
FROM Students;

SELECT SUM(credit_hour)
FROM courses;



-- ===============================
-- GROUP BY
-- ===============================

SELECT course_id,COUNT(*)
FROM enrollment
GROUP BY course_id;


SELECT student_id,COUNT(*)
FROM enrollment
GROUP BY student_id;


SELECT course_id
FROM enrollment
GROUP BY course_id
HAVING COUNT(*)>2;


SELECT student_id
FROM enrollment
GROUP BY student_id
HAVING COUNT(*)=2;



-- ===============================
-- JOINS
-- ===============================

SELECT s.name,e.course_id
FROM Students s
JOIN enrollment e
ON s.student_id=e.student_id;



SELECT s.name,c.course_name
FROM Students s
JOIN enrollment e
ON s.student_id=e.student_id
JOIN courses c
ON e.course_id=c.course_id;



SELECT c.course_name,COUNT(e.student_id)
FROM courses c
LEFT JOIN enrollment e
ON c.course_id=e.course_id
GROUP BY c.course_id;



SELECT s.name
FROM Students s
JOIN enrollment e
ON s.student_id=e.student_id
JOIN courses c
ON e.course_id=c.course_id
WHERE c.course_name='Database Management Systems';



SELECT s.name
FROM Students s
LEFT JOIN enrollment e
ON s.student_id=e.student_id
WHERE e.student_id IS NULL;



SELECT s.name,SUM(c.credit_hour)
FROM Students s
JOIN enrollment e
ON s.student_id=e.student_id
JOIN courses c
ON e.course_id=c.course_id
GROUP BY s.name;



-- ===============================
-- SUBQUERIES
-- ===============================

SELECT name
FROM Students
WHERE student_id IN
(
SELECT student_id
FROM enrollment
WHERE course_id =
(
SELECT course_id
FROM courses
WHERE credit_hour =
(
SELECT MAX(credit_hour)
FROM courses
)
)
);



SELECT course_id
FROM enrollment
GROUP BY course_id
HAVING COUNT(*) >
(
SELECT AVG(cnt)
FROM
(
SELECT COUNT(*) cnt
FROM enrollment
GROUP BY course_id
) temp
);



SELECT name
FROM Students
WHERE age >
(
SELECT AVG(age)
FROM Students
);



-- ===============================
-- STORED PROCEDURES
-- ===============================

DELIMITER //

CREATE PROCEDURE GetStudentCourses(IN sid INT)
BEGIN

SELECT c.course_name
FROM courses c
JOIN enrollment e
ON c.course_id=e.course_id
WHERE e.student_id=sid;

END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE EnrollStudent(
IN p_student_id INT,
IN p_course_id INT
)

BEGIN

INSERT INTO enrollment
(enrollment_id,student_id,course_id)

VALUES
(
(SELECT IFNULL(MAX(enrollment_id),1000)+1 FROM enrollment),
p_student_id,
p_course_id
);

END //

DELIMITER ;



-- ===============================
-- FINAL UPDATE
-- ===============================

UPDATE courses
SET credit_hour=credit_hour+1
WHERE course_name='Web Development';