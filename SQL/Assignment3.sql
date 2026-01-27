
CREATE database assignment3
use assignment3


CREATE TABLE customer (
    customerId INT PRIMARY KEY,
    custname VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE product (
    productId INT PRIMARY KEY,
    productname VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    orderId INT PRIMARY KEY,
    customerId INT,
    productId INT,
    orderDate DATE,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (productId) REFERENCES product(productId)
);

INSERT INTO customer (customerId, custname, country) VALUES
(1, 'Rahul Sharma', 'India'),
(2, 'Amit Verma', 'India'),
(3, 'John Smith', 'USA');
INSERT INTO customer (customerId, custname, country) Values
(4, 'Zyan', 'Pakistan'),
(5, 'Dio', 'USA');




INSERT INTO product (productId, productname, price) VALUES
(101, 'Laptop', 65000.00),
(102, 'Mobile Phone', 25000.00),
(103, 'Headphones', 3000.00);
INSERT INTO product (productId, productname, price) VALUES
(104, 'Watch', 27000.00),
(105, 'Headphones', 34000.00);

INSERT INTO orders (orderId, customerId, productId, orderDate) VALUES
(1001, 1, 101, '2025-01-10'),
(1002, 2, 102, '2025-01-15'),
(1003, 1, 103, '2025-01-20');
INSERT INTO orders (orderId, customerId, productId, orderDate) VALUES
(1004, 3, 104, '2025-01-10'),
(1005, 4, 105, '2025-01-22');


-- 1) Write an SQL query to find the names of customers who have placed an order.

-- 2) Find the list of customers who have not placed any orders.

-- 3) List all orders along with the product name and price.

-- 4) Find the names of customers and their orders, including customers who haven't placed any orders.

-- 5) Retrieve a list of products that have never been ordered.

-- 6) Find the total number of orders placed by each customer.

-- 7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.


---- 1  ----
SELECT custname FROM customer c 
INNER JOIN orders o on c.customerId = o.customerId 

---- 2 ----
SELECT custname FROM customer c LEFT JOIN orders o on c.customerId = o.customerId
WHERE o.orderId is null

---- 3 ----
SELECT o.orderId, p.productname, p.price FROM orders o INNER JOIN product p on o.productId = p.productId 

---- 4 ----
SELECT distinct custname, orderId  FROM customer c LEFT JOIN orders o on c.customerId = o.customerId

---- 5 ----
SELECT distinct productname FROM product p LEFT JOIN orders o on p.productId = o.productId 
WHERE o.orderId is null

---- 6 ----
SELECT custname, count(orderId) FROM customer c INNER JOIN orders o on c.customerId = o.customerId
group by custname

---- 7 ---- 
SELECT c.custname, p.productname, o.orderDate FROM customer c  LEFT JOIN orders o on c.customerId = o.customerId
LEFT JOIN product p on o.productId = p.productId