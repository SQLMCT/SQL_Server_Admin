--Create a job with the following job steps.
--Run a database consistency check and save the results to a file.
DBCC CHECKDB ('AdventureWorks2016')

--Backup the AdventureWorks Database
BACKUP DATABASE [AdventureWorks2016] 
TO  DISK = N'D:\Databases\AdventureWorks2016.bak' 

--Schedule the Job to run in 5 minutes

--Setup an Alert to fire the job if Error 9002 happens.