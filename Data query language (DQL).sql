CREATE TABLE Customer (
    Customer_id VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_Tel NUMBER
);


CREATE TABLE Product (
    Product_id VARCHAR(20) PRIMARY KEY,
    Product_name VARCHAR(20) NOT NULL,
    category VARCHAR(20),
    Price NUMBER 
);

CREATE TABLE Orders (
    Customer_id VARCHAR(20),
    Product_id VARCHAR(20),
    OrderDate DATE ,
    Quantity NUMBER,
    Total_amount NUMBER,
    PRIMARY KEY (Customer_id, Product_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);



-- task 1
SELECT * FROM Customer;



--task 2
SELECT Product_name, category 
FROM Product
WHERE Price BETWEEN 5000 AND 10000;



--task 3
SELECT *
FROM Product
ORDER BY Price DESC;


--task 4
SELECT 
    Product_id,
    COUNT(*) AS Total_orders_per_product,
    AVG(Total_amount) AS Average_amount_per_product,
    MAX(Total_amount) AS Highest_total_amount_per_product,
    MIN(Total_amount) AS Lowest_total_amount_per_product
FROM Orders
GROUP BY Product_id;


--task 5
SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;


--task 6
SELECT 
    EXTRACT(MONTH FROM OrderDate) AS Month,
    COUNT(*) AS Total_orders
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2020
GROUP BY EXTRACT(MONTH FROM OrderDate)
ORDER BY Month;


--task 7
SELECT 
    Product.Product_name,
    Customer.Customer_Name,
    Orders.OrderDate
FROM Orders
JOIN Product ON Orders.Product_id = Product.Product_id
JOIN Customer ON Orders.Customer_id = Customer.Customer_id;

--task 8
SELECT *
FROM Orders
WHERE OrderDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH)
AND OrderDate < CURRENT_DATE();


--task 9
SELECT Customer.Customer_id
FROM Customer
LEFT JOIN Orders ON Customer.Customer_id = Orders.Customer_id
WHERE Orders.Customer_id IS NULL;
