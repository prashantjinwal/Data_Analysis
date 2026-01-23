

-- 1. How do you select employees who work in the 'IT' department and have a salary greater than 75,000?
SELECT * FROM employee 
WHERE department like 'IT' AND salary > 55000

-- 2. How do you find employees who work in the 'HR' department or have a salary less than 60,000?
SELECT * FROM employee
WHERE department like 'HR' OR salary < 45000

-- 3. How do you select employees who do not work in the 'Finance' department?
SELECT * FROM employee 
WHERE department NOT like 'Finance'

-- 4. How do you find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?
SELECT * FROM employee 
WHERE salary BETWEEN 50000 and 65000 and department in ('Finance')

-- 5. How do you find employees who work in the 'IT' department and do not have a salary greater than 80,000?
SELECT * FROM employee 
WHERE department like 'IT' AND NOT salary > 80000

-- 6. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 40,000?
SELECT * FROM employee 
WHERE department like 'HR' OR department like 'Finance' AND salary > 40000

-- 7. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?
SELECT * FROM employee
WHERE last_name like 'D%' AND NOT department in ('HR')

-- 8. How do you find employees who do not work in the 'IT' department and have a salary greater than 50,000?
SELECT * FROM employee 
WHERE NOT department in ('IT') AND salary > 50000

-- 9. How do you select employees who work in the 'IT' department and either have a salary greater
-- than 75,000 or have the first name 'Laura'?

SELECT * FROM employee
WHERE department like 'IT' AND salary > 50000 OR first_name like 'Neha'

-- 10. How do you find employees who do not work in the 'HR' or 'IT' departments?
SELECT * FROM employee
WHERE department NOT in ('HR', 'IT')