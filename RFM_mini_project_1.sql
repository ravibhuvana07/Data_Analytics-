USE Amazon_RFM_DB;
GO


/*
 AMAZON CUSTOMER SALES ANALYSIS USING RFM MODEL
*/

/*
1. CREATE DATABASE
*/

CREATE DATABASE Amazon_RFM_DB;
GO

USE Amazon_RFM_DB;
GO

/*
2. CREATE TABLE: CUSTOMERS
*/

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50)
);
GO

/*
3. CREATE TABLE: CATEGORIES
*/

CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);
GO

/*
4. CREATE TABLE: PRODUCTS
*/

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Products_Categories
    FOREIGN KEY(CategoryID)
    REFERENCES Categories(CategoryID)
);
GO

/*
5. CREATE TABLE: ORDERS
*/

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,

    CONSTRAINT FK_Orders_Customers
    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);
GO

/*
6. CREATE TABLE: ORDER DETAILS
*/

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK(Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_OrderDetails_Orders
    FOREIGN KEY(OrderID)
    REFERENCES Orders(OrderID),

    CONSTRAINT FK_OrderDetails_Products
    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
);
GO

/*
7. CREATE TABLE: PAYMENTS
*/

CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,

    CONSTRAINT FK_Payments_Orders
    FOREIGN KEY(OrderID)
    REFERENCES Orders(OrderID)
);
GO




select * from Customers
select * from Categories
select * from Products
select * from Orders
select * from OrderDetails
select * from Payments
 

 /*
INSERT INTO CUSTOMERS
=========================================================*/

INSERT INTO Customers VALUES
(1,'Rahul Sharma','rahul@gmail.com','Chennai'),
(2,'Priya Nair','priya@gmail.com','Bangalore'),
(3,'Arun Kumar','arun@gmail.com','Hyderabad'),
(4,'Karthik Raj','karthik@gmail.com','Mumbai'),
(5,'Divya S','divya@gmail.com','Delhi'),
(6,'Ananya R','ananya@gmail.com','Pune'),
(7,'Rohit Verma','rohit@gmail.com','Kolkata'),
(8,'Sneha Gupta','sneha@gmail.com','Jaipur'),
(9,'Vikram Singh','vikram@gmail.com','Ahmedabad'),
(10,'Meena Devi','meena@gmail.com','Coimbatore'),
(11,'Ajay Kumar','ajay@gmail.com','Lucknow'),
(12,'Kavya M','kavya@gmail.com','Mysore'),
(13,'Suresh B','suresh@gmail.com','Visakhapatnam'),
(14,'Nisha P','nisha@gmail.com','Surat'),
(15,'Harish R','harish@gmail.com','Nagpur'),
(16,'Deepa K','deepa@gmail.com','Madurai'),
(17,'Manoj T','manoj@gmail.com','Trichy'),
(18,'Pooja Sharma','pooja@gmail.com','Noida'),
(19,'Vinay Kumar','vinay@gmail.com','Indore'),
(20,'Keerthi V','keerthi@gmail.com','Kochi');


/*
INSERT INTO CATEGORIES
=========================================================*/

INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Books'),
(3,'Fashion'),
(4,'Home & Kitchen'),
(5,'Beauty'),
(6,'Sports');

/*
INSERT INTO PRODUCTS
=========================================================*/

INSERT INTO Products VALUES
(101,'Laptop',1,55000),
(102,'Mobile Phone',1,28000),
(103,'Smart Watch',1,6500),
(104,'Bluetooth Speaker',1,3200),
(105,'SQL Book',2,600),
(106,'Python Book',2,900),
(107,'Power BI Book',2,750),
(108,'Data Science Book',2,1200),
(109,'T-Shirt',3,900),
(110,'Jeans',3,1800),
(111,'Running Shoes',3,3500),
(112,'Jacket',3,2500),
(113,'Mixer Grinder',4,4500),
(114,'Cookware Set',4,3200),
(115,'Office Chair',4,7000),
(116,'Dining Table',4,18000),
(117,'Face Wash',5,350),
(118,'Perfume',5,1500),
(119,'Cricket Bat',6,2500),
(120,'Football',6,900);



/*
INSERT INTO ORDERS
=========================================================*/

INSERT INTO Orders VALUES
(1001,1,'2026-01-10'),
(1002,2,'2026-01-18'),
(1003,3,'2026-02-05'),
(1004,4,'2026-02-20'),
(1005,5,'2026-03-02'),
(1006,6,'2026-03-15'),
(1007,7,'2026-03-28'),
(1008,8,'2026-04-05'),
(1009,9,'2026-04-18'),
(1010,10,'2026-04-25'),
(1011,11,'2026-05-02'),
(1012,12,'2026-05-08'),
(1013,13,'2026-05-15'),
(1014,14,'2026-05-20'),
(1015,15,'2026-05-25'),
(1016,16,'2026-06-01'),
(1017,17,'2026-06-05'),
(1018,18,'2026-06-10'),
(1019,19,'2026-06-15'),
(1020,20,'2026-06-18'),
(1021,1,'2026-06-20'),
(1022,2,'2026-06-22'),
(1023,5,'2026-06-23'),
(1024,7,'2026-06-24'),
(1025,9,'2026-06-25'),
(1026,11,'2026-06-26'),
(1027,13,'2026-06-27'),
(1028,15,'2026-06-28'),
(1029,18,'2026-06-29'),
(1030,20,'2026-06-30');



/*
INSERT INTO ORDERDETAILS
=========================================================*/

INSERT INTO OrderDetails VALUES
(1,1001,101,1,55000),
(2,1002,105,2,600),
(3,1003,102,1,28000),
(4,1004,109,3,900),
(5,1005,116,1,18000),
(6,1006,113,1,4500),
(7,1007,119,1,2500),
(8,1008,118,2,1500),
(9,1009,103,1,6500),
(10,1010,115,1,7000),
(11,1011,107,2,750),
(12,1012,110,2,1800),
(13,1013,114,1,3200),
(14,1014,117,4,350),
(15,1015,120,3,900),
(16,1016,111,1,3500),
(17,1017,104,2,3200),
(18,1018,112,1,2500),
(19,1019,106,2,900),
(20,1020,108,1,1200),
(21,1021,102,1,28000),
(22,1022,103,1,6500),
(23,1023,101,1,55000),
(24,1024,110,2,1800),
(25,1025,113,1,4500),
(26,1026,119,2,2500),
(27,1027,115,1,7000),
(28,1028,116,1,18000),
(29,1029,105,5,600),
(30,1030,104,1,3200);


/*
INSERT INTO PAYMENTS
=========================================================*/

INSERT INTO Payments VALUES
(1,1001,55000,'UPI'),
(2,1002,1200,'Credit Card'),
(3,1003,28000,'Net Banking'),
(4,1004,2700,'UPI'),
(5,1005,18000,'Debit Card'),
(6,1006,4500,'Cash'),
(7,1007,2500,'UPI'),
(8,1008,3000,'Credit Card'),
(9,1009,6500,'UPI'),
(10,1010,7000,'Debit Card'),
(11,1011,1500,'Net Banking'),
(12,1012,3600,'UPI'),
(13,1013,3200,'Credit Card'),
(14,1014,1400,'UPI'),
(15,1015,2700,'Cash'),
(16,1016,3500,'Debit Card'),
(17,1017,6400,'UPI'),
(18,1018,2500,'Credit Card'),
(19,1019,1800,'UPI'),
(20,1020,1200,'Debit Card'),
(21,1021,28000,'UPI'),
(22,1022,6500,'Credit Card'),
(23,1023,55000,'Net Banking'),
(24,1024,3600,'UPI'),
(25,1025,4500,'Debit Card'),
(26,1026,5000,'UPI'),
(27,1027,7000,'Credit Card'),
(28,1028,18000,'Net Banking'),
(29,1029,3000,'UPI'),
(30,1030,3200,'Credit Card');

/*1. RFM:-
Recency: How recently they bought.
Frequency: How often they buy.
Monetary: How much they spend.
query analysis
========================================================*/

SELECT
    C.CustomerID,
    C.CustomerName,

    DATEDIFF
    (
        DAY,
        MAX(O.OrderDate),
        GETDATE()
    ) AS Recency,

    COUNT(DISTINCT O.OrderID) AS Frequency,

    SUM(OD.Quantity * OD.UnitPrice) AS Monetary

FROM Customers C

INNER JOIN Orders O
ON C.CustomerID = O.CustomerID

INNER JOIN OrderDetails OD
ON O.OrderID = OD.OrderID

GROUP BY
    C.CustomerID,
    C.CustomerName

ORDER BY Monetary DESC;


/*2. customer segmentation:-
the practice of dividing a company’s 
customer base into distinct groups based on shared characteristics
========================================================*/
SELECT
CustomerName,

CASE

WHEN Monetary >= 50000
THEN 'VIP Customer'

WHEN Monetary BETWEEN 20000 AND 49999
THEN 'Loyal Customer'

WHEN Monetary BETWEEN 5000 AND 19999
THEN 'Potential Customer'

ELSE 'Regular Customer'

END AS CustomerSegment

FROM
(
SELECT
C.CustomerName,
SUM(OD.Quantity*OD.UnitPrice) Monetary

FROM Customers C

INNER JOIN Orders O
ON C.CustomerID=O.CustomerID

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

GROUP BY C.CustomerName

) A;

/*3. top 5 customers by speanding
========================================================*/
SELECT TOP 5

C.CustomerName,

SUM(OD.Quantity*OD.UnitPrice) AS TotalSpent

FROM Customers C

INNER JOIN Orders O
ON C.CustomerID=O.CustomerID

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

GROUP BY C.CustomerName

ORDER BY TotalSpent DESC;

/*4. most frequently purchased products
========================================================*/
SELECT

P.ProductName,

COUNT(*) AS PurchaseCount

FROM Products P

INNER JOIN OrderDetails OD
ON P.ProductID=OD.ProductID

GROUP BY P.ProductName

ORDER BY PurchaseCount DESC;

/*5. sales by category
========================================================*/
SELECT

CA.CategoryName,

SUM(OD.Quantity*OD.UnitPrice) AS TotalSales

FROM Categories CA

INNER JOIN Products P
ON CA.CategoryID=P.CategoryID

INNER JOIN OrderDetails OD
ON P.ProductID=OD.ProductID

GROUP BY CA.CategoryName

ORDER BY TotalSales DESC;

/*6. revenue by payment method
========================================================*/
SELECT

PaymentMethod,

SUM(Amount) AS Revenue

FROM Payments

GROUP BY PaymentMethod

ORDER BY Revenue DESC;


/*7. Monthly Sales Report
========================================================*/
SELECT

YEAR(OrderDate) AS Year,

MONTH(OrderDate) AS Month,

SUM(OD.Quantity*OD.UnitPrice) AS MonthlySales

FROM Orders O

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

GROUP BY

YEAR(OrderDate),

MONTH(OrderDate)

ORDER BY

Year,
Month;


/*8. Customer Purchase History
========================================================*/
SELECT

C.CustomerName,

COUNT(O.OrderID) AS TotalOrders,

SUM(OD.Quantity) AS TotalItems,

SUM(OD.Quantity*OD.UnitPrice) AS TotalSpent

FROM Customers C

INNER JOIN Orders O
ON C.CustomerID=O.CustomerID

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

GROUP BY C.CustomerName

ORDER BY TotalSpent DESC;


/*9. Average Order Value
========================================================*/
SELECT

AVG(OrderTotal) AS AverageOrderValue

FROM
(
SELECT

O.OrderID,

SUM(OD.Quantity*OD.UnitPrice) AS OrderTotal

FROM Orders O

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

GROUP BY O.OrderID

) A;


/*10. Highest Value Order
========================================================*/
SELECT TOP 1

O.OrderID,

C.CustomerName,

SUM(OD.Quantity*OD.UnitPrice) AS OrderValue

FROM Orders O

INNER JOIN Customers C
ON O.CustomerID=C.CustomerID

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

GROUP BY

O.OrderID,
C.CustomerName

ORDER BY OrderValue DESC;


/*11. Customers Who Purchased Electronics
========================================================*/
SELECT DISTINCT

C.CustomerName

FROM Customers C

INNER JOIN Orders O
ON C.CustomerID=O.CustomerID

INNER JOIN OrderDetails OD
ON O.OrderID=OD.OrderID

INNER JOIN Products P
ON OD.ProductID=P.ProductID

INNER JOIN Categories CA
ON P.CategoryID=CA.CategoryID

WHERE CA.CategoryName='Electronics';


/*12. Customers with More Than One Order
========================================================*/
SELECT

C.CustomerName,

COUNT(O.OrderID) AS TotalOrders

FROM Customers C

INNER JOIN Orders O
ON C.CustomerID=O.CustomerID

GROUP BY C.CustomerName

HAVING COUNT(O.OrderID)>1;