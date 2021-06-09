CREATE TABLE [dbo].[Table]
(
	[firstName] NVARCHAR(15) NOT NULL , 
    [lastName] NVARCHAR(15) NOT NULL, 
    [email] NVARCHAR(40) NOT NULL, 
    [password] NVARCHAR(18) NOT NULL, 
    PRIMARY KEY ([email])
)
