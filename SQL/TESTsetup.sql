CREATE Database empolyeee
use  empolyeee


CREATE table employe_detail(
 EMP_ID INT PRIMARY KEY,
 first_name VARCHAR(10),
 last_name VARCHAR(10),
 Department VARCHAR(10),
 SALARY DECIMAL(10,2),
 HIRE_DATE DATE

)

INSERT INTO employe_detail 
(EMP_ID, first_name, last_name, Department, SALARY, HIRE_DATE)
VALUES
(101, 'Prashant', 'Jinwal', 'IT', 55000.00, '2022-06-15'),
(102, 'Amit', 'Sharma', 'HR', 42000.00, '2021-03-10'),
(103, 'Neha', 'Verma', 'Finance', 48000.50, '2020-11-25'),
(104, 'Rahul', 'Mehta', 'Sales', 60000.00, '2019-08-05'),
(105, 'Anjali', 'Singh', 'IT', 53000.75, '2023-01-20');

SELECT * FROM employe_detail
