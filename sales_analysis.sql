 SALES ANALYSIS|SQL PROJECT

CREATE DATABASE 
 CREATE DATABASE project_1;
 
 CREATE TABLE 
 
 CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Aarav', 'Delhi'),
(2, 'Riya', 'Gurugram'),
(3, 'Kunal', 'Lucknow'),
(4, 'Simran', 'Faridabad'),
(5, 'Mohit', 'Chandigarh'),
(6, 'Neha', 'Bangalore');

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT
);
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 45000),
(2, 'Smartphone', 'Electronics', 18000),
(3, 'Headphones', 'Electronics', 2500),
(4, 'Office Chair', 'Furniture', 6500),
(5, 'Study Table', 'Furniture', 8000),
(6, 'Notebook Pack', 'Stationery', 300);

CREATE TABLE sales (
    sale_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE
);
INSERT INTO sales (sale_id, customer_id, product_id, quantity, sale_date) VALUES
(1, 1, 2, 1, '2026-09-02'),
(2, 1, 3, 2, '2026-09-15'),
(3, 2, 1, 1, '2026-09-05'),
(4, 2, 6, 10, '2026-09-20'),
(5, 3, 4, 1, '2026-09-08'),
(6, 3, 3, 1, '2026-09-25'),
(7, 4, 2, 2, '2026-09-11'),
(8, 4, 5, 1, '2026-10-02'),
(9, 5, 6, 5, '2026-10-04'),
(10, 5, 3, 3, '2026-10-09'),
(11, 6, 1, 1, '2026-10-12'),
(12, 6, 4, 2, '2026-10-15'),
(13, 1, 6, 4, '2026-10-18'),
(14, 2, 2, 1, '2026-10-20'),
(15, 3, 5, 2, '2026-10-22'),
(16, 4, 1, 1, '2026-10-25'),
(17, 5, 2, 1, '2026-10-28'),
(18, 6, 3, 2, '2026-11-01'),
(19, 1, 5, 1, '2026-11-02'),
(20, 2, 4, 1, '2026-11-03'),
(21, 3, 6, 6, '2026-11-04'),
(22, 4, 3, NULL, '2026-11-05'),
(23, 5, 1, 1, '2026-11-05'),
(24, 6, 2, 1, '2026-11-06');

BUSINESS QUESTION AND SQK ANALYSIS|
this project answer 10 practical business question. 

Query 1: Find products with price above 5000
 Question: Which products cost more than 5000? Show product name, category and price, sorted from highest price to lowest.
SELECT product_name, category, price
FROM products
WHERE price > 5000
ORDER BY price DESC;