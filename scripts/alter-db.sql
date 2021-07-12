
USE CloudResource
GO

PRINT N'Adding Notes column'
GO

ALTER TABLE dbo.Resource
  ADD Notes VARCHAR(255) NULL

GO

PRINT N'Completed Add of Notes column'
GO