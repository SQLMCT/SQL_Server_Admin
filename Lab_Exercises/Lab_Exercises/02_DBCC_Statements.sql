USE TestDB
GO
SELECT DB_ID() as Database_ID
GO

--Turn on trace flag so DBCC results display as message
DBCC TRACEON(3604) 

--Run DBCC IND statement to locate Database Pages
DBCC IND(0,'Accounting.BankAccounts',-1)

--Run DBCC PAGE statement to loook inside Database Pages
DBCC PAGE(0, 1, 336, 3)

--New in SQL Server 2016
SELECT * FROM sys.dm_db_database_page_allocations
(DB_ID(), object_ID('Accounting.BankAccounts'), NULL, NULL, 'LIMITED')

--New in SQL Server 2019
SELECT * FROM sys.dm_db_page_info(DB_ID(), 1, 336, 'Detailed')