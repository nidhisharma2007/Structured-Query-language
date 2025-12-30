create database if not exists details;
use details;
CREATE TABLE if not exists Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    city VARCHAR(30),
    marks INT
);
INSERT INTO Students VALUES
(1, 'Amit', 20, 'Delhi', 85),
(2, 'Neha', 22, 'Mumbai', 90),
(3, 'Rahul', 21, 'Delhi', 75),
(4, 'Pooja', 23, 'Chennai', 88),
(5, 'Karan', 24, 'Pune', 70);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    student_id INT);
INSERT INTO Courses VALUES
(101, 'DBMS', 1),
(102, 'Python', 2),
(103, 'Data Science', 4);

#Select statement
SELECT * FROM Students;

#Update statement
set sql_safe_updates=0;
UPDATE Students
SET marks = 95
WHERE name = 'Neha';

#Delete statement
DELETE FROM Students
WHERE student_id = 5;

#Sorting
SELECT name, marks
FROM Students
ORDER BY marks DESC;

#Sub query
SELECT name, marks
FROM Students
WHERE marks > (
    SELECT AVG(marks) FROM Students
);

#Joins
SELECT s.name, c.course_name
FROM Students s
INNER JOIN Courses c
ON s.student_id = c.student_id;

SELECT s.name, c.course_name
FROM Students s
LEFT JOIN Courses c
ON s.student_id = c.student_id;

SELECT s.name, c.course_name
FROM Students s
RIGHT JOIN Courses c
ON s.student_id = c.student_id;

SELECT s.name, c.course_name
FROM Students s
LEFT JOIN Courses c
ON s.student_id = c.student_id
UNION
SELECT s.name, c.course_name
FROM Students s
RIGHT JOIN Courses c
ON s.student_id = c.student_id;




