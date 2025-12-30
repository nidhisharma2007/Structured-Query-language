create database if not exists details2;
use details2;

CREATE TABLE if not exists Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO Departments VALUES (1, 'Sales'), (2, 'IT'), (3, 'HR'), (4, 'Marketing'), (5, 'Finance');

CREATE TABLE if not exists Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10, 2),
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Employees VALUES 
(101, 'John', 60000, 30, 1),
(102, 'Alice', 75000, 28, 2),
(103, 'Bob', 50000, 35, 1),
(104, 'Charlie', 90000, 40, 2),
(105, 'Diana', 55000, 24, 4),
(106, 'Eve', 65000, 32, 5);

SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id
    FROM Employees
    WHERE emp_name = 'John');

SELECT emp_name
FROM Employees
WHERE dept_id NOT IN (SELECT dept_id FROM Departments);

SELECT MAX(salary) 
FROM Employees 
WHERE salary NOT IN (SELECT MAX(salary) FROM Employees);

SELECT emp_name, age
FROM Employees
WHERE age > (
    SELECT MIN(age) 
    FROM Employees E
    JOIN Departments D ON E.dept_id = D.dept_id
    WHERE D.dept_name = 'Sales');

    select * from employees;

