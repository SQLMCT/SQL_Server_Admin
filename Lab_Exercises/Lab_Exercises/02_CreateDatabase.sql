--Database Lab
USE master;

/*
For this Lab, the database files are located under the Data folder. 
You may need to create a folder in a new location on your local drive.
*/

--Build Database for Demo
DROP DATABASE IF EXISTS TestDB;
CREATE DATABASE TestDB ON
(NAME = Test_DB,
 FILENAME = 'D:\DATA\TestDB.mdf',
	SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON
(NAME = Test_DB_Log,
 FILENAME = 'D:\DATA\TestDB.ldf',
	SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB);
GO

--Now see where your files are located.

USE TestDB
SELECT * 
FROM sys.database_files


--Next we will drop the database and re-create it into separate files into filegroups.
--First we need to switch the session context to Master database.
USE MASTER
GO

DROP DATABASE IF EXISTS TestDB;
CREATE DATABASE TestDB ON
(NAME = Test_DB,
 FILENAME = N'D:\DATA\TestDB.mdf',
	SIZE = 10, MAXSIZE = 50),
FILEGROUP[PartFG1] ( 
	NAME = N'PartFile1', 
	FILENAME = N'D:\DATA\TestDB1.ndf' , 
	SIZE = 10, MAXSIZE = 50),
FILEGROUP[PartFG2] ( 
	NAME = N'PartFile2', 
	FILENAME = N'D:\DATA\TestDB2.ndf' , 
	SIZE = 10, MAXSIZE = 50),
FILEGROUP[PartFG3] ( 
	NAME = N'PartFile3', 
	FILENAME = N'D:\DATA\TestDB3.ndf' , 
	SIZE = 10, MAXSIZE = 50)
LOG ON
(NAME = Test_DB_Log,
 FILENAME = 'D:\DATA\TestDB.ldf',
	SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB);
GO

USE TestDB
SELECT file_id, name, physical_name
FROM sys.database_files
WHERE type_desc = 'Rows'

SELECT data_space_id, name, type_desc
FROM sys.filegroups;










