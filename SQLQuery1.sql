----------------------------------------------------------------------------------------------
-- Ahmad Mujtaba Fa22 BSCS 205
-- Abubakar Ajmal Fa22 BSCS 208
-- Abdullah Ali Fa22 BSCS 213
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                              RESTAURANT MANAGEMENT SYSTEM                                --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


--
-- CREATE DATABASE RestaurantDB
--

--DROP DATABASE IF EXISTS RestaurantDB;

CREATE DATABASE RestaurantDB;
USE RestaurantDB;



-- CREATE TABLES 

--
-- Create Table Employee 
--
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee 
(
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE ,
    Gender VARCHAR(10),
    Email VARCHAR(255) NOT NULL,
    ContactNo VARCHAR(20) NOT NULL,
    Salary FLOAT NOT NULL,
    Address VARCHAR(255),
    NationalID VARCHAR(50) NOT NULL,
    JoiningDate DATE NOT NULL,
    Designation VARCHAR(50)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DOB, Gender, Email, ContactNo, Salary, Address, NationalID, JoiningDate, Designation) 
VALUES 
(1, 'Saad', 'Khan', '2001-02-19', 'Male', 'Saad.khan12@eunulla.com', '0500382133', 3303, 'UK', '160808040901', '2021-09-21', 'Pellentesque Inc.'),
(2, 'Hassan', 'Khalid', '2002-12-22', 'Male', 'a@nequesedsem.org', '0169775962', 5558, 'UK', '167802292206', '2022-01-11', 'Mauris Blandit Industries'),
(3, 'Shahzaib', 'Hassan', '2003-08-11', 'Male', 'porttitor.interdum@microsoft.net', '08834874490', 4149, 'UK', '168703159197', '2022-01-16', 'Penatibus Et Limited'),
(4, 'Aamna', 'Shakir', '2004-11-09', 'Female', 'nec@etcommodo.ca', '03336672860', 8910, 'UK', '166603121002', '2021-10-27', 'Vivamus Rhoncus Donec PC'),
(5, 'Muhammad', 'Asim', '2005-04-30', 'Male', 'Muhammad.Asim.@noncursus.org', '01638756294', 8652, 'UK', '161601096728', '2022-02-12', 'Rutrum Justo LLC'),
(6, 'Rafia', 'Mushtaq', '2006-11-28', 'Female', 'Rafia@Mushtaq.com', '01913267018', 4116, 'UK', '169410070206', '2020-05-15', 'Dolor Dolor Tempus Ltd');

SELECT * FROM Employee;



--
-- Create Table Customer 
--
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer 
(
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255),
    ContactNo VARCHAR(20),
);

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, ContactNo)
VALUES 
(1, 'Ahmad', 'Hassan', 'consequat@sed.org', '01019329854'),
(2, 'Rafay', 'Khan', 'ac.fermentum@Craslorem.com', '07606149413'),
(3, 'Abdul', 'Jabbar', 'ornare.sagittis.felis@ipsumdolorsit.net', '08484646'),
(4, 'Sage', 'Kaufman', 'consequat@necanteblandit.co.uk', '07136390888'),
(5, 'Beck', 'Hebert', 'auctor.odio.a@velconvallisin.com', '08001111'),
(6, 'Jaquelyn', 'Wallace', 'Nulla@egestas.edu', '08014112660'),
(7, 'Hoyt', 'Hurley', 'mi.Duis.risus@fermentumvelmauris.co.uk', '05661086453'),
(8, 'Quinn', 'Jones', 'est.Nunc@maurisid.net', '07085164703'),
(9, 'Alice', 'Fernandez', 'est.Nunc.ullamcorper@urna.com', '08560264689'),
(10, 'Ferdinand', 'Mcleod', 'Mauris.ut@sagittis.net', '08454644');

SELECT * FROM Customer;



--
-- Create Table Reservation
--
DROP TABLE IF EXISTS Reservation;
CREATE TABLE Reservation 
(
    ReservationID INT NOT NULL PRIMARY KEY,
    TableNo VARCHAR(20) NOT NULL,
    DateAndTime DATETIME NOT NULL,
    No_guests INT NOT NULL,
    CustomerID INT,
    CONSTRAINT fk_Reservation_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Reservation (ReservationID, TableNo, DateAndTime, No_guests, CustomerID)
VALUES 
(1, '12', '2024-03-15 23:11:04', 6, 1),
(2, '3', '2024-03-30 23:44:14', 3, 9),
(3, '2', '2024-02-19 17:41:17', 7, 1),
(4, '10', '2024-01-24 06:33:40', 5, 2),
(5, '15', '2024-01-10 20:12:31', 8, 1),
(6, '16', '2024-03-14 13:08:41', 10, 8),
(7, '5', '2024-04-25 12:18:28', 8, 4),
(8, '8', '2024-05-16 23:08:51', 7, 3),
(9, '19', '2024-05-10 11:43:37', 6, 6),
(10, '14', '2024-06-06 15:48:55', 9, 8);

SELECT * FROM Reservation;



--
-- Create Table Orders
--
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders 
(
    OrderID INT NOT NULL PRIMARY KEY,
    OrderDateTime DATETIME NOT NULL,
    TableNo VARCHAR(20),
    No_guests INT NOT NULL,
    CookingTime INT,
    TotalAmount INT NOT NULL,
    CustomerID INT,
    CONSTRAINT fk_Orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Orders (OrderID, OrderDateTime, TableNo, No_guests, CookingTime, TotalAmount, CustomerID) 
VALUES 
(1, '2021-06-24 04:33:55', '27', 3, 20, 568, 1),
(2, '2020-05-17 13:59:19', '6', 3, 80, 683, 2),
(3, '2020-08-23 03:04:42', '41', 2, 140, 319, 3), 
(4, '2020-10-24 01:01:57', '37', 3, 200, 1323, 4),
(5, '2021-10-17 00:29:43', '11', 3, 260, 1195, 5),
(6, '2021-03-22 09:18:35', '33', 4, 320, 823, 6),
(7, '2022-03-23 00:47:29', '20', 2, 380, 210, 7),
(8, '2022-02-23 00:10:08', '5', 3, 440, 1945, 8),
(9, '2021-07-02 00:00:53', '10', 1, 500, 1962, 9),
(10, '2020-09-18 09:52:21', '7', 3, 560, 1491, 10);

SELECT * FROM Orders;



--
-- Create Table Payment
--
DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment 
(
    PaymentID INT NOT NULL PRIMARY KEY,
    PaymentMethod VARCHAR(50) NOT NULL,
    Amount FLOAT NOT NULL,
    Tip FLOAT,
    OrderID INT,
    CONSTRAINT fk_Payment_OrderID FOREIGN KEY
	(OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payment (PaymentID, PaymentMethod, Amount, Tip, OrderID) 
VALUES 
(1, 'Cash', 1345, 155, 1),
(2, 'Cash', 500, 50, 2),
(3, 'Cash', 730, 80, 3),
(4, 'Cash', 840, 60, 4),
(5, 'Cash', 880, 120, 5),
(6, 'Cash', 570, 30, 6),
(7, 'Cash', 150, 50, 7),
(8, 'Cash', 50, 20, 8),
(9, 'Cash', 460, 40, 9),
(10, 'Cash', 550, 100, 10);

SELECT * FROM Payment;



--
-- Create Table Feedback
--
DROP TABLE IF EXISTS Feedback;
CREATE TABLE Feedback 
(
    FeedbackID INT NOT NULL PRIMARY KEY,
    Service INT NOT NULL,
    Cleanliness INT NOT NULL,
    FoodQuality INT NOT NULL,
    Comments VARCHAR(255) NOT NULL,
    Suggestions VARCHAR(255) NOT NULL,
    OrderID INT,
    CONSTRAINT fk_Feedback_OrderID FOREIGN KEY 
	(OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Feedback (FeedbackID, Service, Cleanliness, FoodQuality, Comments, Suggestions, OrderID) 
VALUES (1, 8, 9, 7, 'Great service!', 'None', 1),
(2, 9, 8, 9, 'Cleanliness was top-notch!', 'None', 2),
(3, 7, 8, 8, 'Food was delicious!', 'More options please', 3),
(4, 10, 9, 8, 'Excellent service!', 'None', 4),
(5, 9, 7, 9, 'Cleanliness was impressive!', 'None', 5),
(6, 8, 10, 9, 'Food quality was exceptional!', 'None', 6),
(7, 7, 9, 8, 'Great feedback system!', 'None', 7),
(8, 9, 8, 10, 'Service was superb!', 'None', 8),
(9, 10, 9, 9, 'Overall excellent experience!', 'None', 9),
(10, 9, 10, 9, 'Will definitely return!', 'None', 10);

SELECT * FROM Feedback;



--
-- Create Table MenuItem
--
DROP TABLE IF EXISTS MenuItem;
CREATE TABLE MenuItem 
(
    MenuItemID INT NOT NULL PRIMARY KEY,
    ItemName VARCHAR(50) NOT NULL,
    Price FLOAT NOT NULL,
    ItemType VARCHAR(50) NOT NULL
);

INSERT INTO MenuItem (MenuItemID, ItemName, Price, ItemType) VALUES
(1, 'American Steak', 118, 'Main Course'),
(2, 'Vanilla Ice Cream', 50, 'Ice Cream'),
(3, 'Biryani', 112, 'Main Course'),
(4, 'Margeretta', 50, 'Juice'),
(5, 'Chicken Burger', 90, 'Sandwich'),
(6, 'French Fries', 40, 'Side Dish'),
(7, 'Coca Cola', 30, 'Soft Drink'),
(8, 'Greek Salad', 80, 'Salad'),
(9, 'Chicken Wings', 70, 'Appetizer'),
(10, 'Tiramisu', 60, 'Dessert');

SELECT * FROM MenuItem;



--
-- Create Table OrderMenuItem
--
DROP TABLE IF EXISTS OrderMenuItem;
CREATE TABLE OrderMenuItem 
(
    Order_MenuItemID INT NOT NULL PRIMARY KEY,
    Quantity INT NOT NULL,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    CONSTRAINT fk_OrderMenuItem_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_OrderMenuItem_MenuItemID FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID)
);

INSERT INTO OrderMenuItem (Order_MenuItemID, Quantity, OrderID, MenuItemID) VALUES
(1, 3, 5, 4),
(2, 2, 1, 1),
(3, 5, 2, 3),
(4, 1, 4, 1),
(5, 5, 2, 2),
(6, 2, 1, 1),
(7, 2, 4, 2),
(8, 3, 3, 3),
(9, 5, 2, 3),
(10, 3, 1, 4);

SELECT * FROM OrderMenuItem;



--
-- Create Table Users
--
DROP TABLE IF EXISTS Users;
CREATE TABLE Users 
(
    UserID INT NOT NULL PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Pass VARCHAR(50) NOT NULL,
    EmployeeID INT NOT NULL,
    CONSTRAINT fk_Users_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Users (UserID, UserName, Pass, EmployeeID) VALUES
(1, 'Saad', 'QGA17YZK9NC', 1),
(2, 'Hassan', 'JLZ97LRM8YH', 2),
(3, 'Shahzaib', 'FNW13QVM2AU', 3),
(4, 'Aamna', 'HAF02IJV1VD', 4),
(5, 'Asim', 'TMV71TOT6BG', 5),
(6, 'Rafia', 'YVJ45MGH2XL', 6);

SELECT * FROM Users;
 


--
-- Create Table Supplier
--
DROP TABLE IF EXISTS Supplier;
CREATE TABLE Supplier (
    SupplierID INT NOT NULL PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactNo VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, Email, Address) VALUES
(1, 'Fresh Produce Ltd.', '0123456789', 'info@freshproduce.com', '123 Green Street, London'),
(2, 'Meat Supplies Inc.', '0987654321', 'contact@meatsupplies.com', '456 Blue Road, Manchester'),
(3, 'Grain Suppliers', '0111222333', 'contact@grainsuppliers.com', '789 Yellow Avenue, Liverpool'),
(4, 'Dairy Products Co.', '0223344556', 'info@dairyproducts.com', '321 Milk Way, Birmingham'),
(5, 'Spice World', '0334455667', 'support@spiceworld.com', '654 Pepper Lane, Leeds');

SELECT * FROM Supplier;



-- Create Table Supplier

DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory (
    InventoryID INT NOT NULL PRIMARY KEY,
    ItemName VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Unit VARCHAR(20) NOT NULL,
    RestockLevel INT NOT NULL,
    SupplierID INT NOT NULL,
    CONSTRAINT fk_Inventory_SupplierID FOREIGN KEY 
	(SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Inventory (InventoryID, ItemName, Quantity, Unit, RestockLevel, SupplierID) VALUES
(1, 'Chicken', 18, 'kg', 30, 2),
(2, 'Beef', 100, 'kg', 20, 2),
(3, 'Rice', 300, 'kg', 50, 3),
(4, 'Potatoes', 34, 'kg', 40, 1),
(5, 'Tomatoes', 100, 'kg', 20, 1),
(6, 'Lettuce', 10, 'kg', 15, 1),
(7, 'Cucumbers', 60, 'kg', 10, 1),
(8, 'Olives', 50, 'kg', 10, 1),
(9, 'Pasta', 100, 'kg', 20, 3),
(10, 'Flour', 250, 'kg', 50, 3),
(11, 'Cheese', 100, 'kg', 20, 4),
(12, 'Salt', 300, 'kg', 50, 5),
(13, 'Pepper', 200, 'kg', 30, 5),
(14, 'Sugar', 200, 'kg', 30, 5),
(15, 'Butter', 150, 'kg', 25, 4);
SELECT * FROM Inventory;




----------------------------------------------------------------------------------------------
--                                 Queries to Perform Functions                             --
----------------------------------------------------------------------------------------------


-- Update Employee Salary:
UPDATE Employee SET Salary = 4500 WHERE EmployeeID = 3;
SELECT EmployeeID,Salary FROM Employee

-- Delete a Reservation:
DELETE FROM Reservation WHERE ReservationID = 7;
SELECT ReservationID FROM Reservation

--Find Orders Made on a Specific Date:
SELECT * FROM Orders
WHERE OrderDateTime >= '2022-02-23 00:00:00' 
AND OrderDateTime < '2022-02-24 00:00:00';

-- Calculate Average Order Total:
SELECT AVG(TotalAmount) AS AvgTotalAmount 
FROM Orders;


-- Find Maximum Number of Guests in a Reservation:
SELECT MAX(No_guests) AS MaxGuests 
FROM Reservation;



--Orders Above a Certain Amount
SELECT Orders.OrderID, Orders.TotalAmount, Customer.FirstName, Customer.LastName
FROM Orders
INNER JOIN Customer ON Orders.CustomerID = Customer.CustomerID
WHERE Orders.TotalAmount > 1500;


--Items to Restock (Below Restock Level)
SELECT ItemName, Quantity, RestockLevel
FROM Inventory
WHERE Quantity < RestockLevel;



-- List Orders with Customer Details:
SELECT Orders.*, Customer.FirstName, Customer.LastName
FROM Orders
INNER JOIN Customer ON Orders.CustomerID = Customer.CustomerID;


-- Show Menu Items Ordered in Each Order:
SELECT Orders.OrderID, MenuItem.ItemName, OrderMenuItem.Quantity
FROM Orders
INNER JOIN OrderMenuItem ON Orders.OrderID = OrderMenuItem.OrderID
INNER JOIN MenuItem ON OrderMenuItem.MenuItemID = MenuItem.MenuItemID;


-- Find Employees Who Have Not Made Any Orders:
SELECT Employee.*
FROM Employee
LEFT JOIN Users ON Employee.EmployeeID = Users.EmployeeID
WHERE Users.UserID IS NOT NULL



-- Feedback and Corresponding Order Details
SELECT Feedback.FeedbackID, Feedback.Service, Feedback.Cleanliness, 
Feedback.FoodQuality, Feedback.Comments, Feedback.Suggestions, Orders.OrderID
FROM Feedback
INNER JOIN Orders ON Feedback.OrderID = Orders.OrderID;


-- Reservations Made in the Last Month
SELECT Reservation.ReservationID, Reservation.TableNo, Reservation.DateAndTime, Customer.FirstName, Customer.LastName
FROM Reservation
INNER JOIN Customer ON Reservation.CustomerID = Customer.CustomerID
WHERE Reservation.DateAndTime >= DATEADD(MONTH, -1, GETDATE());


--Total Quantity of Each Inventory Item
SELECT ItemName, SUM(Quantity) AS TotalQuantity
FROM Inventory
GROUP BY ItemName;


-- Count Orders Made by Each Customer:
SELECT Customer.FirstName, Customer.LastName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customer
LEFT JOIN Orders ON Customer.CustomerID = Orders.CustomerID
GROUP BY Customer.FirstName, Customer.LastName, Customer.CustomerID;


--Total Quantity of Menu Items Ordered:
SELECT MenuItem.ItemName, SUM(OrderMenuItem.Quantity) AS TotalQuantity
FROM OrderMenuItem
INNER JOIN MenuItem ON OrderMenuItem.MenuItemID = MenuItem.MenuItemID
GROUP BY MenuItem.ItemName;


--Total Inventory Items Supplied by Each Supplier:
SELECT Supplier.SupplierName, SUM(Inventory.Quantity) AS TotalQuantity
FROM Inventory
INNER JOIN Supplier ON Inventory.SupplierID = Supplier.SupplierID
GROUP BY Supplier.SupplierName;


-- Insert New Order and Update Inventory
BEGIN TRANSACTION;

-- Insert new order
INSERT INTO Orders (OrderID, OrderDateTime, TableNo, No_guests, CookingTime, TotalAmount, CustomerID) 
VALUES (11, '2024-06-15 18:30:00', '5', 4, 30, 1500, 3);

-- Insert ordered items
INSERT INTO OrderMenuItem (Order_MenuItemID, Quantity, OrderID, MenuItemID) 
VALUES 
(11, 2, 11, 1), 
(12, 3, 11, 3);

-- Update inventory
UPDATE Inventory SET Quantity = Quantity - 2 WHERE ItemName = 'American Steak';
UPDATE Inventory SET Quantity = Quantity - 3 WHERE ItemName = 'Biryani';

-- Commit Transaction
COMMIT;





-- Create the view DetailedOrderInfo
CREATE VIEW DetailedOrderInfo AS
SELECT 
    o.OrderID,
    o.OrderDateTime,
    o.TableNo,
    o.No_guests,
    o.TotalAmount,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    om.Quantity,
    mi.ItemName
FROM 
    Orders o
    INNER JOIN Customer c ON o.CustomerID = c.CustomerID
    INNER JOIN OrderMenuItem om ON o.OrderID = om.OrderID
    INNER JOIN MenuItem mi ON om.MenuItemID = mi.MenuItemID;

-- Select from the view to check the data
SELECT * FROM DetailedOrderInfo;



----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------