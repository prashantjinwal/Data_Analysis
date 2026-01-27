

-- 1) Identify pairs of customers who live in the same country 

-- 2) Find the customer who has spent the most on their orders

-- 3) Find customers who have ordered more than one type of products

-- 4) List all products and their corresponding orders, using a RIGHT JOIN, including products that have never been ordered.

-- 5) Retrieve all orders placed by customers from the USA.

-- 6) Find the names of customers who have ordered a product priced above 50000.

-- 7) Find customers who have ordered the same product more than once.

--- 1 ---
SELECT * FROM customer x  JOIN customer y ON x.country = y.country and x.customerId <> y.customerId and x.customerId > y.customerId

--- 2 ---
SELECT custname FROM
(SELECT custname, SUM(price) [amount of expend], DENSE_RANK() over(order by sum(price) desc ) [DR] FROM customer c 
INNER JOIN orders o ON c.customerId = o.customerId INNER JOIN product p ON p.productId = o.productId
GROUP BY custname) m WHERE DR = 1

--- 3 ---
SELECT custname, COUNT(productId)[product count] FROM customer c JOIN orders o ON c.customerId = o.customerId 
GROUP BY custname
HAVING COUNT(productId) > 1

--- 4 ---
SELECT orderId, productname, p.productId FROM product p RIGHT JOIN orders o ON p.productId = o.productId 

--- 5 ---
SELECT orderId,custname, c.customerId FROM orders o INNER JOIN customer c ON o.customerId = c.customerId 
WHERE country = 'USA'

--- 6 ---
SELECT custname FROM orders o INNER JOIN customer c ON o.customerId = c.customerId INNER JOIN  product p ON p.productId = o.productId
WHERE price > 50000

--- 7 ---
SELECT custname, productId ,COUNT(orderId) FROM customer c INNER JOIN orders o ON c.customerId = o.customerId 
GROUP BY custname, productId