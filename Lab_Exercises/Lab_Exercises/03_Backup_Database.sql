--Switch Adventure Works to Full Recovery Model
ALTER DATABASE [AdventureWorks2016] 
SET RECOVERY FULL 
GO

--Perform Full Backup
BACKUP DATABASE [AdventureWorks2016] 
TO  DISK = N'D:\Databases\AdventureWorks2016.bak' 
WITH FORMAT, INIT 
GO

--Perform Differential Backup
BACKUP DATABASE [AdventureWorks2016] TO  DISK = N'D:\Databases\AdventureWorks2016.bak'
WITH  DIFFERENTIAL , NOFORMAT, NOINIT
GO

--Perform Log Backup
BACKUP LOG [AdventureWorks2016] TO  DISK = N'D:\Databases\AdworksLog.trn' 
WITH NOFORMAT, NOINIT

--Delete a table from the database
--Wait a few minutes
--Restore database to the point in time before the table was deleted.


