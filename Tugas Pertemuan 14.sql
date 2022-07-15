-- 1,  Buatlah database dengan nama db-Pelanggan
CREATE DATABASE [db.Pelanggan]

---Kemudian USE terlebih dahulu database yang digunakan
USE [db.Pelanggan]

-- 2,  Buatlah 2 Buah Tabel seperti contoh di bawah ini dilengkapi dengan constraintnya
CREATE TABLE [Tbl_Pelanggan](
	[ID Pelanggan] VARCHAR(7) NOT NULL,
	Nama CHAR(20) NULL,
	Email VARCHAR (30) NULL,
CONSTRAINT [PK_Pelanggan] PRIMARY KEY ([ID Pelanggan]) 
)

--- VALUE TABEL PELANGGAN
INSERT INTO [Tbl_Pelanggan]([ID Pelanggan], Nama, Email)
VALUES ('P001','Wayan Surya','wayan@gmail.com'),
('P002','Agus','agus@gmail.com'),
('P003','Budi','budi@gmail.com'),
('P004','Rani','rani@gmail.com'),
('P005','Tika','tika@gmail.com');

CREATE TABLE [Tbl_Pesan](
	[ID Pesan] VARCHAR(7) NOT NULL,
	[ID Pelanggan] CHAR(20) NULL,
	[Tgl Pesan] DATE NULL,
CONSTRAINT [PK_Pesan] PRIMARY KEY ([ID Pesan])
)

--- VALUE TABEL PESAN
INSERT INTO [Tbl_Pesan]
VALUES ('1','P001','2022-1-2'),
('2','P002','2022-1-7'),
('3','P003','2022-1-11'),
('4','P004','2022-1-25'),
('5','P005','2022-1-29');

-- 3, Berikan contoh perintah mengubah type data menggunakan tabel pelanggan
ALTER TABLE [Tbl_Pelanggan]
ALTER COLUMN Nama VARCHAR(30) NULL

-- 4, Berikan contoh perintah menambahkan kolom menggunakan tabel Pelanggan
ALTER TABLE [Tbl_Pelanggan]
ADD [No.Telp] CHAR(15) NULL

-- 5, Berikan Contoh perintah update data pada tabel pelanggan 
UPDATE [Tbl_Pelanggan]
SET  Nama = 'Michael', Email = 'Michael@gmail.com'
WHERE [ID Pelanggan] = 'P005';

-- 6, Berikan contoh perintah dengan menggunakan klausa where 
SELECT * FROM [Tbl_Pelanggan]
WHERE Nama = 'Rani'

-- 7, Gabungkan tabel pelanggan dengan tabel pesan
SELECT [Tbl_Pelanggan].[ID Pelanggan],[Tbl_Pelanggan].Nama,[Tbl_Pelanggan].Email,
[Tbl_Pesan].[ID Pesan],[Tbl_Pesan].[Tgl Pesan]
FROM [Tbl_Pelanggan] 
INNER JOIN [Tbl_Pesan]
ON [Tbl_Pelanggan].[ID Pelanggan] = [Tbl_Pesan].[ID Pelanggan]

-- 8, Joinkan tabel pelanggan dengan tabel pesan 
SELECT * FROM [Tbl_Pelanggan] AS Pelanggan
INNER JOIN [Tbl_Pesan] AS Pesan
ON Pelanggan.[ID Pelanggan] = Pesan.[ID Pelanggan]





DROP DATABASE [db.Pelanggan]

USE NORTHWIND;
SELECT * FROM []
