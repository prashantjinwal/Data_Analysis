CREATE database [Sql basic question]
use [Sql basic question]

CREATE TABLE employee (
    empID INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    department VARCHAR(20),
    salary DECIMAL(10,2)
);

INSERT INTO employee (empID, first_name, last_name, department, salary) VALUES
(101, 'Amit', 'Sharma', 'IT', 55000.00),
(102, 'Neha', 'Verma', 'HR', 48000.00),
(103, 'Rahul', 'Singh', 'Finance', 62000.00),
(104, 'Priya', 'Gupta', 'Marketing', 51000.00),
(105, 'Karan', 'Mehta', 'Sales', 45000.00);

INSERT INTO employee (empID, first_name, last_name, department, salary) VALUES
(106, 'Sonal', 'Kapur', 'IT', 58000.00),
(107, 'Vikas', 'Yadav', 'Operations', 47000.00),
(108, 'Anjali', 'Rao', 'Finance', 64000.00),
(109, 'Rohit', 'Malhotra', 'Marketing', 52000.00),
(110, 'Pooja', 'Nair', 'HR', 49000.00);

SELECT * from employee

-- 1 question 
SELECT first_name, last_name from employee

-- 2 question
SELECT * from employee
WHERE department = 'IT'

--3 question 
SELECT * FROM employee
WHERE salary > 60000

--4 question 
SELECT * from employee
ORDER BY last_name asc

--5 question
SELECT distinct department from employee

--6 question  
SELECT department, COUNT(*) [Numbr of employee] from employee group by department

--7 question 
SELECT max(salary) [Maximum salary] from employee

--8 question  

SELECT avg(salary) from employee
WHERE department = 'Finance'

--9 question
SELECT * FROM employee WHERE last_name like 'M_%'