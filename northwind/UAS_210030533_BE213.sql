---------- UAS PRAKTEK BASIS DATA  ---------

-- 1,
USE NORTHWIND;

-- 2,
SET IDENTITY_INSERT [Employees] ON
INSERT INTO [Employees] (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, 
Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath)
VALUES ('10', 'mikey', 'corleone', 'gamer', 'Mr.', '1990-04-01', '2012-01-06', 'lincoln 123', 'tahoma', 'US', '12345', 'USA', '(45) 555-9856', '0001', 'NULL', 'mikey graduate of michelin university', '1', 'NULL'),
('11', 'quill', 'miss', 'programmer', 'Mr.', '1983-01-12', '2010-04-06', 'rockwell st', 'countys', 'UK', '12344', 'USA', '(62) 555-9855', '0011', 'NULL', 'quil graduate of saint university', '2', 'NULL'),
('12', 'sydos', 'hashwalt', 'driver', 'Mr.', '1993-05-01', '2013-08-19', 'st petersburg', 'henrico', 'EU', '12343', 'German', '(80) 555-9854', '0111', 'NULL', 'sydos graduate of utah university', '3', 'NULL'),
('13', 'ichigo', 'ywach', 'pilot', 'Mr.', '1988-07-23', '2009-12-12', 'apache', 'moseley', 'EU', '12342', 'Suth Africa', '(12) 555-9853', '1111', 'NULL', 'ichigo graduate of california university', '4', 'NULL'),
('14', 'murayama', 'michi', 'tenchnician', 'Mr.', '1980-08-01', '2006-09-13', 'windsor', 'bellwood', 'CN', '12341', 'Japan', '(76) 555-9852', '1110', 'NULL', 'murayama graduate of wahington university', '5', 'NULL')

SET IDENTITY_INSERT [Orders] ON
INSERT INTO [Orders] (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, 
ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES ('11078', 'MISS', '2', '1999-05-01', '1999-06-01', '1999-05-05', '1', '10,35', 'michelin', 'missomoti', 'dallas', 'US', '11111', 'USA'),
('11079', 'SYND', '3', '1999-05-02', '1999-06-02', '1999-05-10', '2', '25,24', 'xinon', 'xulu', 'florida', 'US', '11112', 'USA'),
('11080', 'QWER', '6', '1999-05-03', '1999-06-03', '1999-05-15', '3', '11,23', 'purify', 'kataknata', 'delaware', 'US', '11113', 'USA'),
('11081', 'UIOP', '1', '1999-05-04', '1999-06-04', '1999-05-20', '4', '65,34', 'cumash', 'mauri', 'nagata', 'JP', '11114', 'Japan'),
('11082', 'PETE', '9', '1999-05-05', '1999-06-05', '1999-05-25', '5', '14,41', 'saintlost', 'kurotsuchi', 'beijing', 'CN', '11115', 'China')

INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES ('11077', '11', '41,00', '2', '0' ),
('11077', '15', '41,00', '2', '0' ),
('11077', '21', '35,00', '2', '0' ),
('11077', '22', '39,00', '2', '0' ),
('11077', '30', '15,14', '2', '0' )

SELECT * FROM [Order Details]

-- 3,
SELECT [CategoryID] FROM [Products]
WHERE [ProductName] IN ('Gravad lax','Perth Pasties');

-- 4,
SELECT Miss.CustomerID, Miss.OrderDate FROM Orders AS Miss
INNER JOIN [Order Details] AS Zulu
ON Miss.OrderID = Zulu.OrderID
INNER JOIN Products AS Rowing 
ON Rowing.ProductID = Zulu.ProductID
INNER JOIN Categories AS Trash
ON Rowing.CategoryID = Trash.CategoryID;
WHERE (DAY(OrderDate) IN (15,23,10));

-- 5, 
SELECT Country, COUNT(CustomerID) AS [negaranya]
FROM Customers 
GROUP BY Country; 









