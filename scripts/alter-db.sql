
USE CloudResource
GO

PRINT N'Adding RawJSON column'
GO

ALTER TABLE dbo.ResourceContainer
  ADD RawJson VARCHAR(MAX) NULL

GO


UPDATE dbo.ResourceContainer
  SET RawJSON = '{}'

GO

PRINT N'Setting RawJSON column to not null'
GO

ALTER TABLE dbo.ResourceContainer
  ALTER COLUMN RawJSON VARCHAR(MAX) NOT NULL
GO

PRINT N'Completed Add of RawJSON column'
GO