--UNTUK MENJALANKAN SCRIPT INI MAKA HARUS MENGGUNAKAN DATABASE NORTWIND

USE Northwind;

--menampilkan hanya kolom Country
SELECT Country FROM Customers;

--menampilkan beberapa kolom/atribut/field
SELECT CompanyName, City FROM Customers;

--menampilkan seluruh kolom/atribut/field
SELECT * FROM Customers;

SELECT * FROM Products;
select ProductName, QuantityPerUnit, UnitPrice FROM Products;

SELECT * FROM Categories;
SELECT CategoryName,CategoryID FROM Categories;




SELECT * FROM Customers; --91 rows

--tanpa distinct: terdapat nama negara yang sama (namun ini bukan redudansi)
SELECT Country FROM Customers;--91 rows

--dengan distinct: menampilkan data yg unik sesuai kolom yang dipilih
SELECT DISTINCT Country FROM Customers; --21 rows

--menampilkan data (kombinasi) kota dan negara yang unik
SELECT DISTINCT Country, City FROM Customers; --69rows

SELECT DISTINCT Country, City, [Address] FROM Customers;--91 rows




--menampilkan semua pelanggan
SELECT * FROM Customers;

SELECT distinct country from Customers;

SELECT distinct country, city from Customers;

select ProductID, Discount from [Order Details]
order by ProductID asc;

--menampilkan pelanggan dari mexico
SELECT * FROM Customers 
WHERE (Country='Mexico'); --5rows

--menampilkan pelanggan dengan kode ALFKI
SELECT * FROM Customers 
WHERE (CustomerID = 'ALFKI'); --1 rows (karena difilter berdsarkan PK)

SELECT * FROM Orders 
WHERE (EmployeeID = 1); 

SELECT * FROM Products 
WHERE (UnitPrice = 18); 

SELECT * FROM Products 
WHERE (UnitPrice <> 18); 

SELECT * FROM Products 
WHERE (UnitPrice != 18);

SELECT * FROM Products 
WHERE (UnitPrice > 30); 

SELECT * FROM Products 
WHERE (UnitPrice < 30); 

SELECT * FROM Products 
WHERE (UnitPrice >= 30);

SELECT * FROM Products 
WHERE (UnitPrice <= 30);

select * from orders
where OrderDate = '1996-07-04'

select * from [Order Details]
where (OrderID = 10248)
and (ProductID = 72)

--harga produk antara $10 sampai dengan $20
SELECT * FROM Products 
WHERE (UnitPrice BETWEEN 10 AND 20);

--harga produk TIDAK diantara $10 sampai dengan $20
SELECT * FROM Products 
WHERE (UnitPrice NOT BETWEEN 10 AND 20);

--pemesanan antara tanggal 1 Juli 1996 sampai dengan 31 Juli 1996
SELECT * FROM Orders 
WHERE (OrderDate BETWEEN '1996-07-01' AND '1996-07-31');




--nama perusahaan DIMULAI dengan huruf "a"
SELECT * FROM Customers 
WHERE (CompanyName LIKE 'a%'); -- %w = wildcard

--nama perusahaan DIAKHIRI dengan huruf "a"
SELECT * FROM Customers 
WHERE (CompanyName LIKE '%a');

--nama perusahaan mengandung huruf/kata "or" (baik di depan, ditengah, ataupun dibelakang)
SELECT * FROM Customers
WHERE (CompanyName LIKE '%or%');

--huruf kedua pada nama perusahaan adalah "r" (tanda % -> mengabaikan huruf dibelakangnya)
SELECT * FROM Customers
WHERE (CompanyName LIKE '_r%'); --jumlah tanda underscore menentukan posisi huruf

--test
SELECT * FROM Customers
where Country like 'Germany'

--huruf ketiga pada nama perusahaan adalah "a"
SELECT * FROM Customers
WHERE (CompanyName LIKE '__a%');

--huruf keempat pada nama kontak adalah "n"
SELECT * FROM Customers
WHERE (ContactName LIKE '___n%');

--nama kontak diawali dengan huruf "a" dan diakhiri dengan huruf "o"
SELECT * FROM Customers
WHERE (ContactName LIKE 'a%o');

--nama perusahaan yang TIDAK diawali dengan huruf "a"
SELECT * FROM Customers
WHERE (CompanyName NOT LIKE 'a%');

--nama perusahaan yang TIDAK diakhiri dengan huruf/kata "es"
SELECT * FROM Customers
WHERE (CompanyName NOT LIKE '%es');



--negara pelanggan: Germany, France, dan UK (multiple criteria dalam 1 atribut)
SELECT * FROM Customers
WHERE (Country IN ('Germany', 'France', 'UK'));

--negasi (berarti TIDAK)
SELECT * FROM Customers
WHERE (Country NOT IN ('Germany', 'France', 'UK'));


SELECT * FROM Products;
SELECT * FROM Suppliers WHERE (Country='USA');
SELECT SupplierID FROM Suppliers WHERE (Country='USA');

--subquery (perintah SELECT di dalam SELECT)
--menampilkan daftar produk yang disupply oleh supplier yang berasal dari USA
SELECT * FROM Products
WHERE (SupplierID IN (SELECT SupplierID FROM Suppliers WHERE (Country='USA')));



--penggunaan tanda dalam kurung: "( )"
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin'; --kurang tepat
--sebainya dibuat seperti berikut:
SELECT * FROM Customers
WHERE (Country='Germany') AND (City='Berlin');

SELECT * FROM Customers
WHERE (Country='Germany') OR (Country='Spain');

SELECT * FROM Customers 
WHERE NOT Country = 'USA';--kurang tepat
--sebainya dibuat seperti berikut:
SELECT * FROM Customers 
WHERE (NOT (Country = 'USA'))

SELECT * FROM Customers 
WHERE NOT Country = 'Germany' AND NOT Country = 'USA' --kurang tepat
--sebainya dibuat seperti berikut:
SELECT * FROM Customers
WHERE (NOT (Country = 'Germany')) AND (NOT (Country = 'USA'))

--penggunaan NOT pada operator OR
SELECT * FROM Customers
WHERE (NOT (Country = 'Germany' OR Country = 'USA'))

--perintah diatas juga bisa menggunakan operator: IN
SELECT * FROM Customers
WHERE (Country NOT IN ('Germany', 'USA'));
