/* ## MS-SQL PROJECT on Banking Transactions by Gyan Kumar GM ! */

-- (dnleeks): I have cleaned up the project.
-- 1. Do not create objects if they exist. For updates use the ALTER keyword.
-- 2. Test data will be in another file.


CREATE DATABASE dbBankGM;
GO

USE [dbBankGM]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create all tables if they do not exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentBalance] [int] NOT NULL,
	[AccountTypeID] [tinyint] NOT NULL,
	[AccountStatusTypeID] [tinyint] NOT NULL,
	[InterestSavingRatesID] [tinyint] NOT NULL,
 CONSTRAINT [pk_A_AccounID] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountStatusType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountStatusType](
	[AccountStatusTypeID] [tinyint] IDENTITY(1,1) NOT NULL,
	[AccountStatusTypeDescription] [nvarchar](30) NOT NULL,
 CONSTRAINT [pk_AST_AccountStatusTypeID] PRIMARY KEY CLUSTERED 
(
	[AccountStatusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountType](
	[AccountTypeID] [tinyint] IDENTITY(1,1) NOT NULL,
	[AccountTypeDescription] [nvarchar](30) NOT NULL,
 CONSTRAINT [pk_AT_AccountTypeID] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[CustomerAddress2] [nvarchar](30) NULL,
	[CustomerFirstName] [nvarchar](30) NOT NULL,
	[CustomerMiddleInitial] [nchar](1) NULL,
	[CustomerLastName] [nvarchar](30) NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[ZipCode] [nchar](10) NOT NULL,
	[EmailAddress] [nchar](40) NOT NULL,
	[HomePhone] [nvarchar](10) NOT NULL,
	[CellPhone] [nvarchar](10) NOT NULL,
	[WorkPhone] [nvarchar](10) NOT NULL,
	[SSN] [nvarchar](9) NULL,
	[UserLoginID] [smallint] NOT NULL,
 CONSTRAINT [pk_C_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAccount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAccount](
	[AccountID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeFirstName] [nvarchar](25) NOT NULL,
	[EmployeeMiddleInitial] [nchar](1) NULL,
	[EmployeeLastName] [nvarchar](25) NULL,
	[EmployeeisManager] [bit] NULL,
 CONSTRAINT [pk_E_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FailedTransactionErrorType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FailedTransactionErrorType](
	[FailedTransactionErrorTypeID] [tinyint] IDENTITY(1,1) NOT NULL,
	[FailedTransactionErrorTypeDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_FTET_FailedTransactionErrorTypeID] PRIMARY KEY CLUSTERED 
(
	[FailedTransactionErrorTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FailedTransactionLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FailedTransactionLog](
	[FailedTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[FailedTransactionErrorTypeID] [tinyint] NOT NULL,
	[FailedTransactionErrorTime] [datetime] NULL,
	[FailedTransactionErrorXML] [xml] NULL,
 CONSTRAINT [pk_FTL_FailedTransactionID] PRIMARY KEY CLUSTERED 
(
	[FailedTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginAccount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoginAccount](
	[UserLoginID] [smallint] NOT NULL,
	[AccountID] [int] NOT NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginErrorLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoginErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[FailedTransactionXML] [xml] NULL,
 CONSTRAINT [pk_LEL_ErrorLogID] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OverDraftLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OverDraftLog](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[OverDraftDate] [datetime] NOT NULL,
	[OverDraftAmount] [money] NOT NULL,
	[OverDraftTransactionXML] [xml] NOT NULL,
 CONSTRAINT [Pk_ODL_AccountID] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingsInterestRates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingsInterestRates](
	[InterestSavingRatesID] [tinyint] IDENTITY(1,1) NOT NULL,
	[InterestRatesValue] [numeric](9, 9) NOT NULL,
	[InterestRatesDescription] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_SIR_InterestSavingRatesID] PRIMARY KEY CLUSTERED 
(
	[InterestSavingRatesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransactionLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransactionLog](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionTypeID] [tinyint] NOT NULL,
	[TransactionAmount] [money] NOT NULL,
	[NewBalance] [money] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[UserLoginID] [smallint] NOT NULL,
 CONSTRAINT [pk_TL_TransactionID] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransactionType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [nchar](10) NOT NULL,
	[TransactionTypeDescription] [nvarchar](50) NULL,
	[TransactionFeeAmount] [smallmoney] NULL,
 CONSTRAINT [pk_TT_TransactionTypeID] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserLogins](
	[UserLoginID] [smallint] IDENTITY(1,1) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_UL_UserLoginID] PRIMARY KEY CLUSTERED 
(
	[UserLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSecurityAnswers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserSecurityAnswers](
	[UserLoginID] [smallint] IDENTITY(1,1) NOT NULL,
	[UserSecurityAnswers] [nvarchar](25) NOT NULL,
	[UserSecurityQuestionID] [tinyint] NOT NULL,
 CONSTRAINT [pk_USA_UserLoginID] PRIMARY KEY CLUSTERED 
(
	[UserLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSecurityQuestions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserSecurityQuestions](
	[UserSecurityQuestionID] [tinyint] IDENTITY(1,1) NOT NULL,
	[UserSecurityQuestion] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_USQ_UserSecurityQuestionID] PRIMARY KEY CLUSTERED 
(
	[UserSecurityQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

-- Create all constraints. If they do not exist then alter the table to add them.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Account__Account__4F7CD00D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountType] ([AccountTypeID])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_AST_AccountStatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [fk_AST_AccountStatusTypeID] FOREIGN KEY([AccountStatusTypeID])
REFERENCES [dbo].[AccountStatusType] ([AccountStatusTypeID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_AST_AccountStatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [fk_AST_AccountStatusTypeID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_SIR_InterestSavingRatesID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [fk_SIR_InterestSavingRatesID] FOREIGN KEY([InterestSavingRatesID])
REFERENCES [dbo].[SavingsInterestRates] ([InterestSavingRatesID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_SIR_InterestSavingRatesID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [fk_SIR_InterestSavingRatesID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [fk_A_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [fk_A_AccountID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_C_UserLoginID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [fk_UL_C_UserLoginID] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogins] ([UserLoginID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_C_UserLoginID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [fk_UL_C_UserLoginID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_CA_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [fk_A_CA_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_CA_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [fk_A_CA_AccountID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_C_CA_CustomerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [fk_C_CA_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_C_CA_CustomerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [fk_C_CA_CustomerID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_FTET_FailedTransactionErrorTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[FailedTransactionLog]'))
ALTER TABLE [dbo].[FailedTransactionLog]  WITH CHECK ADD  CONSTRAINT [fk_FTET_FailedTransactionErrorTypeID] FOREIGN KEY([FailedTransactionErrorTypeID])
REFERENCES [dbo].[FailedTransactionErrorType] ([FailedTransactionErrorTypeID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_FTET_FailedTransactionErrorTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[FailedTransactionLog]'))
ALTER TABLE [dbo].[FailedTransactionLog] CHECK CONSTRAINT [fk_FTET_FailedTransactionErrorTypeID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoginAccount]'))
ALTER TABLE [dbo].[LoginAccount]  WITH CHECK ADD  CONSTRAINT [fk_A_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoginAccount]'))
ALTER TABLE [dbo].[LoginAccount] CHECK CONSTRAINT [fk_A_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_UserLogins]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoginAccount]'))
ALTER TABLE [dbo].[LoginAccount]  WITH CHECK ADD  CONSTRAINT [fk_UL_UserLogins] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogins] ([UserLoginID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_UserLogins]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoginAccount]'))
ALTER TABLE [dbo].[LoginAccount] CHECK CONSTRAINT [fk_UL_UserLogins]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_ODL_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverDraftLog]'))
ALTER TABLE [dbo].[OverDraftLog]  WITH CHECK ADD  CONSTRAINT [fk_A_ODL_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_ODL_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverDraftLog]'))
ALTER TABLE [dbo].[OverDraftLog] CHECK CONSTRAINT [fk_A_ODL_AccountID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_TL_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD  CONSTRAINT [fk_A_TL_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_A_TL_AccountID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog] CHECK CONSTRAINT [fk_A_TL_AccountID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_C_TL_CustomerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD  CONSTRAINT [fk_C_TL_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_C_TL_CustomerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog] CHECK CONSTRAINT [fk_C_TL_CustomerID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_E_TL_EmployeeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD  CONSTRAINT [fk_E_TL_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_E_TL_EmployeeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog] CHECK CONSTRAINT [fk_E_TL_EmployeeID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_TT_TL_TransactionTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD  CONSTRAINT [fk_TT_TL_TransactionTypeID] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[TransactionType] ([TransactionTypeID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_TT_TL_TransactionTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog] CHECK CONSTRAINT [fk_TT_TL_TransactionTypeID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_TL_UserLoginID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog]  WITH CHECK ADD  CONSTRAINT [fk_UL_TL_UserLoginID] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogins] ([UserLoginID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_TL_UserLoginID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransactionLog]'))
ALTER TABLE [dbo].[TransactionLog] CHECK CONSTRAINT [fk_UL_TL_UserLoginID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_UserLoginID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSecurityAnswers]'))
ALTER TABLE [dbo].[UserSecurityAnswers]  WITH CHECK ADD  CONSTRAINT [fk_UL_UserLoginID] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogins] ([UserLoginID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UL_UserLoginID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSecurityAnswers]'))
ALTER TABLE [dbo].[UserSecurityAnswers] CHECK CONSTRAINT [fk_UL_UserLoginID]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_USQ_UserSecurityQuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSecurityAnswers]'))
ALTER TABLE [dbo].[UserSecurityAnswers]  WITH CHECK ADD  CONSTRAINT [fk_USQ_UserSecurityQuestionID] FOREIGN KEY([UserSecurityQuestionID])
REFERENCES [dbo].[UserSecurityQuestions] ([UserSecurityQuestionID])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_USQ_UserSecurityQuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserSecurityAnswers]'))
ALTER TABLE [dbo].[UserSecurityAnswers] CHECK CONSTRAINT [fk_USQ_UserSecurityQuestionID]
GO


-- Create the views if they do not exist
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_Customer_ACC]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[VW_Customer_ACC] 
AS
SELECT c.CustomerFirstName, at.AccountTypeDescription, COUNT(*) AS Total_AC_Types FROM Customer c
JOIN Account a
ON c.AccountID = a.AccountId
JOIN AccountType at
ON a.AccountTypeID = at.AccountTypeID
GROUP BY c.CustomerFirstName, at.AccountTypeDescription;
' 
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_Customer_OD]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[VW_Customer_OD] 
AS
SELECT DISTINCT c.CustomerFirstName, o.OverDraftAmount
FROM OverDraftLog o
JOIN Customer c
ON o.AccountID = c.AccountID;
' 
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_Customer_ON]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[VW_Customer_ON] AS
SELECT DISTINCT c.* FROM Customer c
JOIN Account a
ON c.AccountID = a.AccountId
JOIN AccountType at
ON a.AccountTypeID = at.AccountTypeID
WHERE at.AccountTypeDescription = ''Checking'' and c.State = ''ON'';
' 
GO

-- Create all stored procedures. Only create if they do not exist; Otherwise, alter the existing stored procedure
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Customer_Details]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Customer_Details] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Customer_Details] @AccountID INT
AS
SELECT c.CustomerFirstName + ' ' + c.CustomerMIddleInitial + ' ' + c.CustomerLastName AS Customer_Full_Name
FROM Customer c
JOIN Account a
ON c.AccountID = a.AccountId
WHERE a.AccountID = @AccountID;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Delete_Errors]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Delete_Errors] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Delete_Errors]
AS
delete FROM LoginErrorLog
WHERE  ErrorTime BETWEEN DATEADD(hh, -1, GETDATE()) AND GETDATE();
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Delete_Question]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Delete_Question] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Delete_Question] @UserLoginID SMALLINT
AS
DELETE UserSecurityQuestions
FROM UserSecurityQuestions uq
JOIN UserSecurityAnswers ua
ON ua.UserSecurityQuestionID = uq.UserSecurityQuestionID
JOIN UserLogins ul
ON ua.UserLoginID = ul.UserLoginID
WHERE ul.UserLoginID = @UserLoginID;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Errors_24]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Errors_24] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Errors_24]
AS
SELECT * FROM LoginErrorLog
WHERE  ErrorTime BETWEEN DATEADD(hh, -24, GETDATE()) AND GETDATE();
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Remove_Column]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Remove_Column] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Remove_Column]
AS
ALTER TABLE CUSTOMER
DROP COLUMN CustomerAddress1;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Update_cBalance_After_Deposit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Update_cBalance_After_Deposit] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Update_cBalance_After_Deposit] @AccountID INT, @Deposit INT
AS
UPDATE Account
SET CurrentBalance = CurrentBalance + @Deposit
where AccountID = @AccountID;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Update_cBalance_After_Withdraw]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Update_cBalance_After_Withdraw] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Update_cBalance_After_Withdraw] @AccountID INT, @Withdraw INT
AS
UPDATE Account
SET CurrentBalance = CurrentBalance - @Withdraw
WHERE AccountID = @AccountID;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Update_Login]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Update_Login] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_Update_Login]
AS
UPDATE UserLogins
SET UserLogin = Concat('User_', UserLogin);
GO
