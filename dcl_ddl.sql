CREATE DATABASE TestDb;
GO
USE TestDb
GO
CREATE SCHEMA TestSchema;
GO
CREATE TABLE TestSchema.TestTable
(ID INT NOT NULL,
 Name VARCHAR(20),
 IsSold BIT,
 InvoiceDate DATE);
GO

USE TestDb
GO
INSERT INTO TestSchema.TestTable
VALUES
(1, 'Boat', 1, '2020-11-08'),
(2,'Auto', 0, '2020-11-09'),
(3,'Plane', null, '2020-12-09')

GO
EXEC sp_configure 'CONTAINED DATABASE AUTHENTICATION', 1;
GO
RECONFIGURE;
GO
USE [master]
GO
ALTER DATABASE TestDb SET CONTAINMENT = PARTIAL;
GO

USE TestDb
GO
CREATE USER TestUser WITH PASSWORD='Cheb0ks@ry'
GO
GRANT CONNECT TO TestUser	
GO
GRANT SELECT ON TestSchema.TestTable TO TestUser 
GO
SELECT CURRENT_USER
GO
DROP USER TestUser