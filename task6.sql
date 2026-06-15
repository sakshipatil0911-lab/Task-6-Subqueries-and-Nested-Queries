USE EcommerceDB;

-- 1. Scalar Subquery
-- Find products having price greater than average price

SELECT *
FROM Products
WHERE price >
(
    SELECT AVG(price)
    FROM Products
);


-- 2. Subquery with IN
-- Find orders placed by customers having customer_id 1 and 2

SELECT *
FROM Orders
WHERE customer_id IN
(
    SELECT customer_id
    FROM Customers
    WHERE customer_id IN (1,2)
);


-- 3. EXISTS Subquery
-- Find customers who have placed orders

SELECT *
FROM Customers c
WHERE EXISTS
(
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- 4. Correlated Subquery
-- Find products whose price is greater than the average price of all products

SELECT *
FROM Products p1
WHERE price >
(
    SELECT AVG(price)
    FROM Products p2
);


-- 5. Subquery with =
-- Find product having maximum price

SELECT *
FROM Products
WHERE price =
(
    SELECT MAX(price)
    FROM Products
);


-- 6. Subquery in SELECT clause

SELECT
    product_name,
    price,
    (SELECT AVG(price) FROM Products) AS Average_Price
FROM Products;


-- 7. Subquery in FROM clause (Derived Table)

SELECT *
FROM
(
    SELECT product_name, price
    FROM Products
) AS Product_Details;


-- 8. Count number of orders per customer using subquery

SELECT
    customer_name,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.customer_id = c.customer_id
    ) AS Total_Orders
FROM Customers c;


-- 9. Products with stock greater than average stock

SELECT *
FROM Products
WHERE stock >
(
    SELECT AVG(stock)
    FROM Products
);


-- 10. Customers without orders using NOT EXISTS

SELECT *
FROM Customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);