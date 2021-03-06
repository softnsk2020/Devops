USE [devops]
GO
/****** Object:  StoredProcedure [dbo].[AddCustomerDetails]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCustomerDetails] @Name varchar(50),@Address varchar(max),
@ContactNumber bigint,@AlternateContactNumber bigint,@Specialty varchar(max),
@QualificationSummary varchar(max)
AS
BEGIN
SET NOCOUNT ON;

insert into CustomerDetails_tbl values
(@Name,@Address,@ContactNumber,@AlternateContactNumber,@Specialty,@QualificationSummary)

END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomerDetails]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCustomerDetails] @CustomerId int
AS
BEGIN
SET NOCOUNT ON;

Delete from CustomerDetails_tbl where CustomerId=@CustomerId
END

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerDetails]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerDetails] 
AS
BEGIN
SET NOCOUNT ON;

select * from CustomerDetails_tbl

END

GO
/****** Object:  StoredProcedure [dbo].[GetLoginDetails]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLoginDetails] @Email varchar(50)
AS
BEGIN
SET NOCOUNT ON;

select * from UserRegistrations_tbl 
where Email=@Email 

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomerDetails]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCustomerDetails] @CustomerId int,@Name varchar(50),@Address varchar(max),
@ContactNumber bigint,@AlternateContactNumber bigint,@Specialty varchar(max),
@QualificationSummary varchar(max)
AS
BEGIN
SET NOCOUNT ON;

update CustomerDetails_tbl 
	set 
		 Name=@Name
		,Address=@Address
		,ContactNumber=@ContactNumber
		,AlternateContactNumber=@AlternateContactNumber
		,Specialty=@Specialty
		,QualificationSummary=@QualificationSummary
Where
	CustomerId=@CustomerId
END

GO
/****** Object:  StoredProcedure [dbo].[UserRegistrations]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserRegistrations] @Email varchar(50),@Password varchar(100)
AS
BEGIN
SET NOCOUNT ON;

insert into UserRegistrations_tbl values
(@Email,@Password)

END

GO
/****** Object:  Table [dbo].[CustomerDetails_tbl]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDetails_tbl](
	[CustomerId] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[ContactNumber] [bigint] NULL,
	[AlternateContactNumber] [bigint] NULL,
	[Specialty] [varchar](max) NULL,
	[QualificationSummary] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRegistrations_tbl]    Script Date: 21-07-2017 12:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegistrations_tbl](
	[Email] [varchar](50) NULL,
	[password] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
