CREATE TABLE student (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    studentname VARCHAR(50),
    subject VARCHAR(50),
    marks INT
);
INSERT INTO student (studentname, subject, marks) VALUES
('Aman', 'Maths', 78),
('Aman', 'Physics', 72),
('Aman', 'Chemistry', 69),

('Rohit', 'Maths', 85),
('Rohit', 'Physics', 80),
('Rohit', 'Chemistry', 82),

('Priya', 'Maths', 90),
('Priya', 'Physics', 88),
('Priya', 'Chemistry', 91),

('Neha', 'Maths', 76),
('Neha', 'Physics', 70),
('Neha', 'Chemistry', 74),

('Kunal', 'Maths', 65),
('Kunal', 'Physics', 68),
('Kunal', 'Chemistry', 60),

('Sneha', 'Maths', 88),
('Sneha', 'Physics', 84),
('Sneha', 'Chemistry', 86),

('Arjun', 'Maths', 92),
('Arjun', 'Physics', 90),
('Arjun', 'Chemistry', 89),

('Pooja', 'Maths', 73),
('Pooja', 'Physics', 75),
('Pooja', 'Chemistry', 78),

('Rahul', 'Maths', 81),
('Rahul', 'Physics', 79),
('Rahul', 'Chemistry', 77),

('Anjali', 'Maths', 95),
('Anjali', 'Physics', 93),
('Anjali', 'Chemistry', 94);

-- ROWNUMBER assign randomly if there is a tie
SELECT *, ROW_NUMBER() over(order by marks desc) [Row number] FROM student

--  RANK ---> if there is a tie so next rank is skiped 
SELECT *, RANK() over(order by marks desc) AS [RANKS] FROM student

-- DENSE RANK --> rank is not skiped
SELECT *, DENSE_RANK() over(order by marks desc) AS [DENSE RANK] FROM student
--------------------------------------------------------------------------------------------------------

SELECT *, ROW_NUMBER() over(partition by subject order by marks desc) [Row Number] FROM student

SELECT *, ROW_NUMBER() over(partition by studentname order by marks ) [Row Number ASC] FROM student

SELECT *, rank() over(partition by subject order by marks desc) [Row Number] FROM student

SELECT *, DENSE_RANK() over(partition by subject order by marks desc) [Row Number] FROM student
