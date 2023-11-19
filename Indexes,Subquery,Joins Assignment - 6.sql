/* 1)a. retrieve sales table from the supermart_db (sales dataset contains multiple years data)*/

SELECT * FROM Sales;

/* b. Counting the number of distinct customer_id values in sales table */

SELECT COUNT(DISTINCT CustomerID) AS Distinct_CustomerID_Count 
FROM Sales;

/* c. Customers with ages between 20 and 60 
   ●  create table customer_20_60 as select * from customers where ages between 20 and 60;*/

CREATE TABLE Customer_20_60 AS SELECT * FROM Customers 
WHERE Age BETWEEN 20 AND 60;

SELECT * FROM Customer_20_60;

/* ● select count (*) from customer_20_60;*/

SELECT COUNT(*) FROM Customer_20_60;

/* 2.  Find the total sales that are done in every state for customer_20_60 and the sales table*/

SELECT Customer_20_60.State, SUM(Sales.Sales) AS TotalSales FROM Customer_20_60
JOIN Sales ON Customer_20_60.CustomerID = Sales.CustomerID
GROUP BY Customer_20_60.State;

/* 3. Get data containing Product_id, Product name, category, total sales value of that product, and total quantity sold. 
(Use sales and product tables)*/

SELECT Products.Category, Products.ProductName, SUM(Sales.Sales) AS TotalSales, 
SUM(Sales.Quantity) AS TotalQuantity
FROM Products
JOIN SALES ON Products.ProductID = Sales.ProductID
GROUP BY Products.Category, Products.ProductName
ORDER BY TotalSales DESC;