CREATE DATABASE [Window_Func]
USE [Window_Func]


CREATE TABLE EmployeeSalaries (
EmployeeID INT,
EmployeeName VARCHAR(50),
Salary INT,
Department VARCHAR(50)

);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7,'Grace', 90000, 'IT'),
(8,'Heidi', 95000, 'IT'),
(9,'Ivan', 87000, 'IT');

SELECT * FROM EmployeeSalaries

SELECT * ,
FIRST_VALUE(Salary) over(order by Salary ASC) [Minimum salary] 
FROM EmployeeSalaries

SELECT *,
FIRST_VALUE(EmployeeName) over(order by Salary ASC) [Minimum salary emp]
FROM EmployeeSalaries

SELECT *,
FIRST_VALUE(EmployeeID) over(partition by Department order by Salary ) [first value]
FROM EmployeeSalaries


SELECT *,
FIRST_VALUE(EmployeeID) over(partition by Department order by Salary DESC) [first value],
FIRST_VALUE(EmployeeName) over(partition by Department order by Salary DESC) [first value]
FROM EmployeeSalaries


select * from EmployeeSalaries

--Incorrect Query
select * 
,LAST_VALUE(EmployeeName) over(order by salary desc) [Emp with Lowest Salary]
from EmployeeSalaries


--correct Query
select * 
,LAST_VALUE(EmployeeName) over(order by salary desc rows between unbounded preceding and unbounded following) [Emp with Lowest Salary]
from EmployeeSalaries


--correct Query
select * 
,LAST_VALUE(EmployeeName) over(order by salary desc rows between unbounded preceding and unbounded following) [Emp with Lowest Salary]
,LAST_VALUE(Salary) over(order by salary desc rows between unbounded preceding and unbounded following) [Lowest Salary]
from EmployeeSalaries

--correct Query
select * 
,LAST_VALUE(EmployeeName) over(partition by department
order by salary desc rows between unbounded preceding and unbounded following) [Emp with Lowest Salary]

,LAST_VALUE(Salary) over(partition by department order by salary desc rows between unbounded preceding and unbounded following) [Lowest Salary]
from EmployeeSalaries

--correct Query [Last Value Window Fun]
select * 
,LAST_VALUE(EmployeeName) over(partition by department
order by salary rows between unbounded preceding and unbounded following) [Emp with Highest Salary]

,LAST_VALUE(Salary) over(partition by department order by salary asc rows between unbounded preceding and unbounded following) [Highest Salary]
from EmployeeSalaries

--correct Query [First Value Window Fun]
select * 
,first_VALUE(EmployeeName) over(partition by department
order by salary desc) [Emp with Highest Salary]

,first_VALUE(Salary) over(partition by department order by salary desc) [Highest Salary]
from EmployeeSalaries