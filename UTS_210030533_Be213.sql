-- 1,
-- NAMA		: Dewa Gede Agung Krishnananda Sudewa
-- NIM		: 210030533
-- KELAS	: BE213

---------- UTS PRAKTEK BASIS DATA  ---------


-- 2,
CREATE DATABASE [STIKOM BE213];


-- 3,
USE [STIKOM BE213];


-- 4,
CREATE TABLE [dbo].[Tbl_Mhs](
	[Nim] [char](5) PRIMARY KEY NOT NULL,
	[Nama] [varchar](50),
	[JK] [bit],
	[Tgl Lahir] [date],
	[Status] [bit],
	[Tgl Input] [date])


CREATE TABLE [dbo].[Tbl_Matakuliah](
	[Kd Mk] [char](4) PRIMARY KEY NOT NULL,
	[Nama Mk] [varchar](50),
	[Sks] [tinyint],
	[Keterangan] [text],
	[Status] [bit],
	[Tgl Input] [date])


CREATE TABLE [dbo].[Tbl_Kelas](
	[Kd Kls] [char](4) PRIMARY KEY NOT NULL,
	[Kd Ruang] [char](4),
	[Kd Dosen] [char](4),
	[Hari] [tinyint],
	[Jam Mulai] [time](7) ,
	[Jam Selesai] [time](7),
	[Status] [bit],
	[Tgl Input] [date])


CREATE TABLE [dbo].[Tbl_Nilai](
	[Nim] [char](5),
	[Kd Mk] [char](4),
	[Kd Kls] [char](4),
	[Nilai] [int],
	[Tgl Input] [date],
	PRIMARY KEY (Nim,[Kd Mk], [Kd Kls]))


-- 5,
insert into [Tbl_Mhs] (Nim, Nama, JK, [tgl lahir], Status, [Tgl Input])
values ('01234', 'putu', 1, '2002-02-14', 0, '2002-02-09'),
('03245', 'eka', 1,  '2001-03-07', 0, '2022-02-11'),
('07865', 'andi', 1, '2000-02-20', 1, '2022-02-15'),
('02375', 'mike', 1,  '2002-03-21', 1, '2022-09-11'),
('02321', 'reyna', 0,  '2002-03-19', 1, '2022-07-12'),
('02398', 'nugroho', 1,  '2002-02-24', 1, '2022-05-15'),
('02345', 'collin', 1,  '2002-05-01', 1, '2022-12-17'),
('02957', 'putri', 0,  '2002-12-21', 1, '2022-06-19'),
('02343', 'adrian', 1,  '2002-09-19', 1, '2022-05-20'),
('02311', 'alexander', 1,  '2002-11-25', 1, '2022-04-14')

insert into [Tbl_Matakuliah] ([Kd Mk], [Nama Mk], Sks, Keterangan, [Status], [Tgl Input])
values ('0001', 'Basis Data', 2, 'Aktif', 1, '2022-05-11'),
('0002', 'Praktek Basis Data', 2, 'Aktif', 1, '2022-05-12'),
('0003', 'Bahasa Inggris', 2, 'Aktif', 1, '2022-05-13'),
('0004', 'Pendidikan Pancasila', 2, 'Aktif', 1, '2022-05-14'),
('0005', 'Jaringan Komputer', 1, 'Aktif', 1, '2022-05-15'),
('0006', 'Matematika', 3, 'Aktif', 1, '2022-05-16'),
('0007', 'Praktek Jaringan Komputer', 2, 'Aktif', 1, '2022-05-17'),
('0008', 'Sistem Informasi', 2, 'Aktif', 1, '2022-05-18'),
('0009', 'Sistem Operasi', 2, 'Aktif', 1, '2022-05-19'),
('0010', 'Algoritma Dan Struktur Data', 2, 'Aktif', 1, '2022-05-10')

insert into [Tbl_Kelas] ([Kd Kls], [Kd Ruang], [KD Dosen], Hari, [Jam Mulai], [Jam Selesai], Status, [Tgl Input])
values ('BE', '1010','1000', 1, '09:00', '11:00', 1, '2022-04-16'),
('BZ', '0101','1002', 1, '08:30', '11:00', 1, '2022-04-16'),
('BA', '0102','1003', 1, '09:30', '11:00', 1, '2022-04-16'),
('BB', '0103','1004', 1, '08:00', '10:00', 1, '2022-04-16'),
('BC', '0104','1005', 1, '09:00', '11:00', 1, '2022-04-16'),
('BF', '0105','1006', 1, '10:00', '11:30', 1, '2022-04-16'),
('BG', '0106','1007', 1, '10:30', '12:00', 1, '2022-04-16'),
('BH', '0107','1008', 1, '11:00', '15:00', 1, '2022-04-16'),
('BI', '0108','1009', 1, '12:00', '16:00', 1, '2022-04-16'),
('BJ', '0109','1010', 1, '07:00', '09:00', 1, '2022-04-16')

insert into [Tbl_Nilai] (Nim, [Kd Mk], [Kd Kls], Nilai, [Tgl Input])
values ('01234', '0001', '1010', 90, '2022-05-21'),
('03245', '0002', '0102', 80, '2002-05-21'),
('07865', '0003', '0103', 80, '2002-05-21'),
('02375', '0004', '0104', 85, '2002-05-21'),
('02321', '0005', '0105', 75, '2002-05-21'),
('02398', '0006', '0106', 66, '2002-05-21'),
('02345', '0007', '0107', 85, '2002-05-21'),
('02957', '0008', '0108', 90, '2002-05-21'),
('02343', '0009', '0109', 77, '2002-05-21'),
('02311', '0010', '1010', 95, '2002-05-21')


-- 6,
SELECT * FROM dbo.Tbl_Mhs ORDER BY [Tgl Lahir] DESC;
SELECT [Nama Mk], SKS FROM dbo.Tbl_Matakuliah ORDER BY SKS ASC;

SELECT [Nama Mk], SKS FROM dbo.Tbl_Matakuliah WHERE SKS <4;


-- 7,
UPDATE [Tbl_Mhs]
SET [Nama] = 'xixi',[Tgl Lahir] = '2003-05-14' 
WHERE Nim = '07865';

UPDATE [Tbl_Mhs]
SET [Nama] = 'mamaw',[Tgl Lahir] = '2003-06-12' 
WHERE Nim = '01234';

UPDATE [Tbl_Mhs]
SET [Nama] = 'cacwa',[Tgl Lahir] = '2003-09-11' 
WHERE Nim = '02311';

UPDATE [Tbl_Mhs]
SET [Nama] = 'zaza',[Tgl Lahir] = '2003-10-12' 
WHERE Nim = '02345';


-- 8,
DELETE FROM [Tbl_Mhs] WHERE Nim = '01234';
DELETE FROM [Tbl_Mhs] WHERE Nama = 'eka';
DELETE FROM [Tbl_Mhs] WHERE Nama = 'mike';
DELETE FROM [Tbl_Mhs] WHERE Nim = '02345';


-- 9,
DROP TABLE [dbo].[Tbl_Kelas];
DROP TABLE [dbo].[Tbl_Matakuliah];
DROP TABLE [dbo].[Tbl_Mhs];
DROP TABLE [dbo].[Tbl_Nilai];


-- 10,
DROP DATABASE [STIKOM BE213];