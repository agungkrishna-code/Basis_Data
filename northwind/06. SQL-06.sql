--gunakanlah database Northwind untuk mengeksekusi perintah-perintah dibawah ini
USE Northwind;

-- fungsi (AS)
select a.ProductName as [nama produk],
a.CategoryID as [kode kategori],
b.Quantity as [jml jual],
b.UnitPrice as 'harga jual'
from Products as A
inner join [Order Details] as B
on a.ProductID = b.ProductID
--------------------------------------------------------------------------------------------
--PERINTAH INNER JOIN

--menampilkan data dari 2 tabel yang berbeda
SELECT * FROM Products; --menampilkan data produk
SELECT * FROM Categories; --menampilkan data kategori
--jika kedua perintah diatas dieksekusi bersamaan, 
--maka hasilnya adalah 2 result set yang berbeda (terpisah)


--menggabungkan tabel produk dan kategori dgn INNER JOIN
SELECT * FROM Products --tabel 1 (kiri)
INNER JOIN Categories --tabel 2 (kanan)
ON Categories.CategoryID = Products.CategoryID; --relasi PK-FK (boleh dibolak-balik)
--pada relasi atribut PK-FK WAJIB ditambahkan nama tabel untuk menghilangkan ambigu (nama atribut yg sama)


--menampilkan produk yang nama kategorinya beverages
SELECT Products.*, CategoryName  --menampilkan semua atribut tabel produk, dan hanya CategoryName dari tabel Categories
FROM Categories --tabel 1 (kiri)
INNER JOIN Products --tabel 2 (kanan)
ON Products.CategoryID = Categories.CategoryID --relasi FK-PK
WHERE (CategoryName = 'beverages'); --kriteria


--bisa ditambahkan alias (AS) dari tabel untuk mempermudah penulisan query
SELECT * FROM Categories AS A --tabel 1 (kiri)
INNER JOIN Products AS B --tabel 2 (kanan)
ON A.CategoryID = B.CategoryID --relasi FK-PK (wajib menuliskan nama alias tabel)
WHERE (B.UnitsInStock between 30 and 50) --kriteria 1
AND (A.CategoryID in (2,8,7)) --kriteria 2
ORDER BY A.CategoryID; --sorting data

--menampilkan atribut tertentu dan kriteria tertentu
SELECT ProductID, ProductName, UnitPrice, --tidak perlu menuliskan nama alias tabel
B.CategoryID, CategoryName --B.CategoryID wajib menggunakan nama alias karena nama atributnya sama
FROM Categories AS A --tabel 1 (kiri)
INNER JOIN Products AS B --tabel 2 (kanan)
ON A.CategoryID = B.CategoryID --relasi FK-PK (wajib menggunakan nama alias tabel)
WHERE (ProductName LIKE '%n%') --kriteria dari produk (boleh tanpa nama alias tabel)
AND (CategoryName = 'Seafood') --kriteria dari kategori (boleh tanpa nama alias tabel)
ORDER BY ProductName DESC; --sorting data


--menggabungkan tabel produk dan suplier dgn INNER JOIN
SELECT ProductID, ProductName, UnitPrice
FROM Products AS A --tabel 1 (kiri)
INNER JOIN Suppliers AS B --tabel 2 (kanan)
ON A.SupplierID = B.SupplierID --relasi PK-FK (wajib menuliskan nama alias tabel)
WHERE (CompanyName like 'exotic%')
ORDER BY ProductName;

--perintah subquery dengan hasil yang sama dengan
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE SupplierID IN --masukkan sub query untuk keyword IN
(SELECT SupplierID FROM Suppliers WHERE (CompanyName like 'exotic%'))
ORDER BY ProductName;


--menampilkan data dari 3 tabel yang berbeda
SELECT * FROM Customers; --menampilkan data pelanggan
SELECT * FROM Orders; --menampilkan data pemesanan
SELECT * FROM Employees; --menampilkan data karyawan
--jika ketiga perintah diatas dieksekusi bersamaan, 
--maka hasilnya adalah 3 result set yang berbeda (terpisah)


--menggabungkan tabel pelanggan dan pemesanan dgn INNER JOIN
SELECT * FROM Customers AS A --tabel 1 (kiri)
INNER JOIN Orders AS B --tabel 2 (kanan)
ON A.CustomerID = B.CustomerID; --relasi PK-FK (wajib menuliskan nama alias tabel)


--menggabungkan tabel karyawan dan pemesanan dgn INNER JOIN
SELECT * FROM Employees AS A --tabel 1 (kiri)
INNER JOIN Orders AS B --tabel 2 (kanan)
ON A.EmployeeID = B.EmployeeID; --relasi PK-FK (wajib menuliskan nama alias tabel)


--menggabungkan 3 buah tabel (Categories-Products-Supplier)
SELECT * FROM Categories AS Cat --tabel 1 (kiri)
INNER JOIN Products AS Pro--tabel 2 (kanan)
ON Cat.CategoryID = Pro.CategoryID --relasi PK-FK tabel Categories-Products
INNER JOIN Suppliers AS Sup --tabel 3 (kanan)
ON Sup.SupplierID = Pro.SupplierID; --relasi PK-FK tabel Suppliers-Products
--untuk menhubungkan 3 tabel (atau lebih) kita perlu mengetahui atribut PK-FK yang menghubungkan setiap tabel tersebut


--menggabungkan 3 buah tabel (Customers-Orders-Employees)
SELECT * FROM Customers AS A --tabel 1 (kiri)
INNER JOIN Orders AS B --tabel 2 (kanan)
ON A.CustomerID = B.CustomerID --relasi PK-FK tabel Customers-Orders
INNER JOIN Employees AS C	--tabel 3 (kanan)
ON C.EmployeeID = B.EmployeeID; --relasi PK-FK tabel Employees-Orders


--menggabungkan 5 buah tabel (Customers-Orders-Employees-Order Details-Products)
SELECT TOP 500 * --menampilkan 500 data (optional-agar execute query tidak terlalu lama)
FROM Customers AS A --tabel 1: pelanggan
INNER JOIN Orders AS B --tabel 2: pemesanan
ON A.CustomerID = B.CustomerID --relasi PK-FK tabel Customers-Orders
INNER JOIN Employees AS C	--tabel 3: karyawan
ON C.EmployeeID = B.EmployeeID --relasi PK-FK tabel Employees-Orders
INNER JOIN [Order Details] AS D --tabel 4: detail pemesanan
ON B.OrderID = D.OrderID --relasi PK-FK tabel Orders-[Order Details]
INNER JOIN Products AS E --tabel 5: produk
ON D.ProductID = E.ProductID; --relasi PK-FK tabel Products-[Order Details]



--------------------------------------------------------------------------------------------
--PERINTAH LEFT OUTER JOIN

--tambahkan 2 record baru ke tabel Categories (data baru ini belum memiliki pasangan ke tabel Products)
INSERT INTO Categories (CategoryName, [Description])
VALUES ('Alat Tulis', 'Kategori alat tulis'), 
('Lain-lain', 'Kategori lainnya');

SELECT * FROM Categories ORDER BY CategoryID DESC;
SELECT * FROM Products WHERE CategoryID IN (9,10);

--inner join dari data yg memiliki pasangan (CategoryID)
SELECT * FROM Categories AS A --tabel 1 (kiri)
left outer JOIN Products AS B --tabel 2 (kanan)
ON B.CategoryID = A.CategoryID --relasi PK-FK (boleh dibolak-balik)
ORDER BY A.CategoryID DESC;

--menampilkan semua data kategori walaupun belum/tidak ada pasangannya (di tabel produk)
SELECT A.*, B.ProductID, B.ProductName --memilih atribut yg akan ditampilkan
FROM Categories AS A --tabel 1 (kiri)
LEFT OUTER JOIN Products AS B --tabel 2 (kanan)
ON B.CategoryID = A.CategoryID --relasi PK-FK (boleh dibolak-balik)
ORDER BY A.CategoryID DESC; --sorting data
--hasilnya ada record yang kolom ProductID dan ProductName-nya = NULL


INSERT INTO Suppliers (CompanyName, ContactName)
VALUES ('PT. ABC Indonesia', 'Agus Rahardjo'),
('PT. XYZ Investama','Komang Agus Aryawan');

SELECT * FROM Suppliers ORDER BY SupplierID DESC;
SELECT * FROM Products WHERE SupplierID IN (30,31);

SELECT Sup.SupplierID, Sup.CompanyName, Sup.ContactName,
Pro.ProductID, Pro.ProductName, Pro.UnitPrice
FROM Suppliers AS Sup 
LEFT OUTER JOIN Products AS Pro 
ON Sup.SupplierID = Pro.SupplierID 
ORDER BY SupplierID DESC;


SELECT A.EmployeeID, A.FirstName, A.Title, 
B.FirstName AS Atasan, B.Title AS [Title Atasan]
FROM Employees AS A 
LEFT OUTER JOIN Employees AS B 
ON A.ReportsTo = B.EmployeeID


--------------------------------------------------------------------------------------------
--PERINTAH RIGHT OUTER JOIN

SELECT * FROM Categories 
RIGHT OUTER JOIN Products 
ON Categories.CategoryID = Products.CategoryID;


SELECT Pro.ProductID, Pro.ProductName, Pro.UnitPrice,
Sup.SupplierID, Sup.CompanyName
FROM Products AS Pro
RIGHT OUTER JOIN Suppliers AS Sup 
ON Sup.SupplierID = Pro.SupplierID 
ORDER BY Sup.SupplierID DESC;

--exerxise
SELECT Country, * Products as pro
INNER JOIN Suppliers as sup 
on sup.SupplierID = pro.SupplierID
where Country in ('uk','usa');


SELECT Products.*, City
FROM Suppliers 
INNER JOIN Products 
ON Products.SupplierID = Suppliers.SupplierID 
WHERE City in ('tokyo','london','osaka');