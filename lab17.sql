USE CSE_3A_204


--Part – B:
--16. Create a view Admin_Employees that displays ADMIN department employees only.
CREATE VIEW ADMIN_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'ADMIN'

SELECT * FROM ADMIN_EMPLOYEES
--17. Create a view Female_Employees that displays female employee data only.
CREATE VIEW FEMALE_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE GENDER = 'FEMALE'

SELECT * FROM FEMALE_EMPLOYEES

--18. Create a view Male_Employees that displays male employee data only.
CREATE VIEW MALE_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE GENDER = 'MALE'

SELECT * FROM MALE_EMPLOYEES

--19. Create a view Rajkot_Employees that displays employees from Rajkot city only.
CREATE VIEW RAJKOT_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE CITY = 'RAJKOT'

SELECT * FROM RAJKOT_EMPLOYEES
--20. Create a view Ahmedabad_Employees that displays employees from Ahmedabad city only.
CREATE VIEW AHEMEDABAD_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE CITY = 'AHMEDABAD'

SELECT * FROM AHEMEDABAD_EMPLOYEES
--21. Create a view Salary_Between that displays employees whose salary is between 10000 and 14000.
CREATE VIEW SALARY_BETWEEN AS
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 10000 AND 140000

SELECT * FROM SALARY_BETWEEN
--22. Create a view Recent_Employees that displays employees joined after 2023.
CREATE VIEW RECENT_EMPLOYEE AS
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR < 2023

SELECT * FROM RECENT_EMPLOYEE

--23. Create a view Old_Employees that displays employees joined before 2023.
CREATE VIEW OLD_EMPLOYEE AS
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR > 2023

SELECT * FROM OLD_EMPLOYEE

--24. Create a view Employees_Start_R that displays employees whose first name starts with R.
CREATE VIEW EMPLOYEE_START_R AS
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME  LIKE 'R%'

SELECT * FROM EMPLOYEE_START_R

--25. Create a view Employees_End_A that displays employees whose first name ends with A.
CREATE VIEW EMPLOYEE_END_A AS
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME  LIKE '%A'

SELECT * FROM EMPLOYEE_END_A

--Part – C:
--26. Create a view Employees_NameContains_H that displays employees whose first name contains H.
CREATE VIEW _NAMECONTAINS_H AS
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME  LIKE '%H%'

SELECT * FROM _NAMECONTAINS_H

--27. Create a view for the employees whose first name contains vowels.
CREATE VIEW _VOWELSCONTAINS_ AS
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME  LIKE '%A%'
OR FIRSTNAME  LIKE '%E%'
OR FIRSTNAME  LIKE '%I%'
OR FIRSTNAME  LIKE '%O%'
OR FIRSTNAME  LIKE '%U%'

SELECT * FROM _VOWELSCONTAINS_
--28. Create a view FourLetter_Name having EID, FirstName and Department columns in which FirstName consists of four letters.
CREATE VIEW FOURLETTER_NAME AS
SELECT EID,FIRSTNAME,DEPARTMENT FROM EMPLOYEE
WHERE LEN(FIRSTNAME)=4

SELECT * FROM FOURLETTER_NAME
--29. Create a view for the employees whose name starts with M and ends with N.
CREATE VIEW START_M_AND_END_N AS
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'M%N'

SELECT * FROM START_M_AND_END_N
--30. Create a view Transport_Dept that displays Transport department employees only.
CREATE VIEW TRANSPORT_DEPT AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'TRANSPORT'

SELECT * FROM TRANSPORT_DEPT



--EXTRA QUATIONS 


CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR (100) NOT NULL,
City VARCHAR (100),
Membership VARCHAR (20)
);
INSERT INTO Customers (CustomerID, CustomerName, City, Membership) VALUES
(101, 'Alice', 'Mumbai', 'Gold'),
(102, 'Bob', 'Delhi', 'Silver'),
(103, 'Charlie', 'Pune', 'Gold'),
(104, 'David', 'Ahmedabad', 'Silver'),
(105, 'Eva', 'Mumbai', 'Platinum');


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
Product VARCHAR (100) NOT NULL,
Category VARCHAR (50),
Quantity INT NOT NULL,
Price DECIMAL (10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, Product, Category, Quantity, Price) VALUES
(201, 101, 'Laptop', 'Electronics', 1, 70000),
(202, 101, 'Mouse', 'Electronics', 2, 800),
(203, 102, 'Chair', 'Furniture', 3, 2500),
(204, 103, 'Phone', 'Electronics', 1, 45000),
(205, 104, 'Table', 'Furniture', 2, 6000),
(206, 105, 'Laptop', 'Electronics', 2, 70000),
(207, 105, 'Printer', 'Electronics', 1, 12000),
(208, 103, 'Desk', 'Furniture', 1, 8000);


CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR (100) NOT NULL,
 City VARCHAR (100),
 Membership VARCHAR (20)
);
INSERT INTO Customers (CustomerID, CustomerName, City, Membership) VALUES
(101, 'Alice', 'Mumbai', 'Gold'),
(102, 'Bob', 'Delhi', 'Silver'),
(103, 'Charlie', 'Pune', 'Gold'),
(104, 'David', 'Ahmedabad', 'Silver'),
(105, 'Eva', 'Mumbai', 'Platinum');



CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 CustomerID INT NOT NULL,
 Product VARCHAR (100) NOT NULL,
 Category VARCHAR (50),
 Quantity INT NOT NULL,
 Price DECIMAL (10,2) NOT NULL,
 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);
INSERT INTO Orders (OrderID, CustomerID, Product, Category, Quantity, Price)
VALUES
(201, 101, 'Laptop', 'Electronics', 1, 70000),
(202, 101, 'Mouse', 'Electronics', 2, 800),
(203, 102, 'Chair', 'Furniture', 3, 2500),
(204, 103, 'Phone', 'Electronics', 1, 45000),
(205, 104, 'Table', 'Furniture', 2, 6000),
(206, 105, 'Laptop', 'Electronics', 2, 70000),
(207, 105, 'Printer', 'Electronics', 1, 12000),
(208, 103, 'Desk', 'Furniture', 1, 8000);



--1) Create a view named CustomerOrders displaying:
--• Customer Name
--• City
--• Product
--• Category
--• Quantity
--• Price
CREATE VIEW CustomerOrders AS
SELECT
    C.CustomerName,
    C.City,
    O.Product,
    O.Category,
    O.Quantity,
    O.Price
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
--2) Create a view named GoldCustomersOrders that displays all orders placed by gold
--members.
CREATE VIEW GoldCustomersOrders AS
SELECT
    C.CustomerName,
    C.City,
    C.Membership,
    O.OrderID,
    O.Product,
    O.Category,
    O.Quantity,
    O.Price
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE C.Membership = 'Gold'
--3) Create a view ElectronicOrders displaying only Electronics orders.

CREATE VIEW ElectronicOrders AS
SELECT
    O.OrderID,
    C.CustomerName,
    O.Product,
    O.Category,
    O.Quantity,
    O.Price
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE O.Category = 'Electronics'
--4) Create a view CustomerPurchaseSummary showing the total purchase amount for
--each customer.
--(Purchase Amount = Quantity * Price)
CREATE VIEW CustomerPurchaseSummary AS
SELECT C.CustomerName, SUM(O.Quantity * O.Price) AS PurchaseAmount
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName
--5) Create a view CustomerOrderCount showing:
--• Customer Name
--• Number of Orders placed
CREATE VIEW CustomerOrderCount AS
SELECT   C.CustomerName,  COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName

--6) Create a view CategorySales displaying:
--Category
--Number of Orders
--Total quantity sold

--7)Create a view AmountDetails displaying:
--Membership Type
--Average purchase amount per order

--8) Create a view CitySales displaying:
--city
--Total Customers who placed orders
--Total purchase amount

--9) Create a view CustomerSales displaying:
--Customer Name
--Membership
--Total quantity purchased
--Total amount spent

--10) Create a view CustomerMembership displaying:
--Category
--Membership Type
--Total sales
--Average quantity purchased

