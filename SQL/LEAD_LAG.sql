CREATE TABLE ProfitData(
MonthNumber INT,
MonthName VARCHAR(3),
Product VARCHAR(50),
Profit INT

);

-- Insert data into the ProfitData table
INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200), 
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);



SELECT * FROM ProfitData


----- lead function -----
-- Add a new column that shows next's month profit for each product
SELECT *, LEAD(Profit) over(partition by Product order by MonthNumber) [profit in month] FROM ProfitData

SELECT MonthNumber, MonthName, SUM(Profit) AS [Total Profit], LEAD(SUM(Profit)) over(order by MonthNumber ASC) AS [Next month profit] FROM ProfitData
GROUP BY MonthNumber, MonthName
order by MonthNumber

----- lag function -----
SELECT *, LAG(Profit) over(partition by Product order by MonthNumber) [Profit in previous month] FROM ProfitData

SELECT MonthNumber, MonthName, SUM(Profit) AS [Total Profit], LAG(SUM(Profit)) over(order by MonthNumber ASC) AS [Previous month profit] FROM ProfitData
GROUP BY MonthNumber, MonthName
order by MonthNumber