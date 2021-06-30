
GO
USE MASTER
GO

CREATE LOGIN wimc_app WITH PASSWORD = '$(appPassword)';

GO

CREATE USER wimc_app FOR LOGIN wimc_app WITH DEFAULT_SCHEMA = [dbo]

GO

USE CloudResource
GO

CREATE USER wimc_app FOR LOGIN wimc_app WITH DEFAULT_SCHEMA = [dbo]

GO

CREATE ROLE WimcApplicationRole AUTHORIZATION [dbo]

GO


GRANT 
	DELETE, 
	EXECUTE, 
	INSERT, 
	SELECT, 
	UPDATE
ON SCHEMA :: dbo
	TO WimcApplicationRole
GO

EXEC sp_addrolemember 'WimcApplicationRole', 'wimc_app';

GO