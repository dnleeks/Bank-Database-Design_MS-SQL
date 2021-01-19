
--Insert at least 5 rows in each table. 

insert into UserLogins values('User1', 'Pass1');
insert into UserLogins values('User2', 'Pass2');
insert into UserLogins values('User3', 'Pass3');
insert into UserLogins values('User4', 'Pass4');
insert into UserLogins values('User5', 'Pass5');
GO

insert into UserSecurityQuestions values('What is your favorite food?');
insert into UserSecurityQuestions values('What was the model of your first car?');
insert into UserSecurityQuestions values('What was the name of your first school?');
insert into UserSecurityQuestions values('What was the first concert you attended?');
insert into UserSecurityQuestions values('Who is your favorite celebrity?');
GO

Insert into AccountType values('Savings');
Insert into AccountType values('Checking');
GO

--Inserting 5 records into table SavingsInterestRates
insert into SavingsInterestRates values(0.5, 'Low');
insert into SavingsInterestRates values(2, 'Medium');
insert into SavingsInterestRates values(3, 'High');
insert into SavingsInterestRates values(4, 'Very high');
insert into SavingsInterestRates values(5, 'Super high');
GO

select * from AccountStatusType;
insert into AccountStatusType values('Closed');
insert into AccountStatusType values('Active');
insert into AccountStatusType values('Dormant');
insert into AccountStatusType values('Passive');
insert into AccountStatusType values('Active');
GO

insert into FailedTransactionErrorType values('Withdraw limit reached');
insert into FailedTransactionErrorType values('Daily limit reached');
insert into FailedTransactionErrorType values('No tenough balance');
insert into FailedTransactionErrorType values('Invalid denomination');
insert into FailedTransactionErrorType values('ATM machine down');
GO

insert into LoginErrorLog values(TRY_CAST('2015/6/4 07:30:56' AS DATETIME), 'Bad Connection');
insert into LoginErrorLog values(TRY_CAST('2018/6/9 12:34:57' AS DATETIME), 'Invalid User');
insert into LoginErrorLog values(TRY_CAST('2016/4/5 02:14:00' AS DATETIME), 'Wrong Password');
insert into LoginErrorLog values(TRY_CAST('2014/7/5 05:56:59' AS DATETIME), 'Server issue');
insert into LoginErrorLog values(TRY_CAST('2009/10/12 08:34:15' AS DATETIME), 'Datacenter down');
GO

insert into Employee values('E3', 'K', 'E3', '0');
insert into Employee values('E5', 'B', 'E5', '1');
insert into Employee values('E7', 'P', 'E7', '0');
insert into Employee values('E9', 'R', 'E9', '1');
insert into Employee values('E11', 'K', 'E11', '1');
GO

insert into TransactionType values('Balance', 'See money', '0');
insert into TransactionType values('Transfer', 'Send money', '450');
insert into TransactionType values('Receive', 'Get money', '300');
insert into TransactionType values('Paid', 'Paid to John', '45000');
insert into TransactionType values('Statement', 'Checked monthly transaction', '0');
GO

insert into FailedTransactionLog values(1, TRY_CAST('2015/6/4 07:30:56' AS DATETIME), 'First');
insert into FailedTransactionLog values(2, TRY_CAST('2018/6/9 12:34:57' AS DATETIME), 'Second');
insert into FailedTransactionLog values(3, TRY_CAST('2016/4/5 02:14:00' AS DATETIME), 'Third');
insert into FailedTransactionLog values(4, TRY_CAST('2014/7/5 05:56:59' AS DATETIME), 'Fourth');
insert into FailedTransactionLog values(5, TRY_CAST('2009/10/12 08:34:15' AS DATETIME), 'Fifth');
GO

insert into UserSecurityAnswers values('Apples', 1);
insert into UserSecurityAnswers values('Spiderman', 2);
insert into UserSecurityAnswers values('School1', 3);
insert into UserSecurityAnswers values('Ram', 4);
insert into UserSecurityAnswers values('Toyota', 5);
GO

insert into Account values(15000.7, 1, 1, 1);
insert into Account values(25000.5, 2, 2, 2);
insert into Account values(17000.2, 1, 1, 1);
insert into Account values(45000, 2, 2, 2);
insert into Account values(2320, 2, 2, 2);
GO

insert into LoginAccount values(1, 1);
insert into LoginAccount values(2, 2);
insert into LoginAccount values(3, 3);
insert into LoginAccount values(4, 4);
insert into LoginAccount values(5, 5);
GO

insert into Customer values(1, 'Address1', 'Address2', 'Customer1', 'U', 'CLastname1', 'Ottawa', 'ON', '3A5z9z', 'user5@user.com', '141655555', '453554464', '3462325', 'A12345', 1);
insert into Customer values(2, 'Address1', 'Address2', 'Customer2', 'K', 'CLastname2', 'Hamilton', 'ON', 'fe3453', 'user6@user.com', '141655555', '567435345', '6332423', 'D34353', 2);
insert into Customer values(3, 'Address1', 'Address2', 'Customer3', 'P', 'CLastname3', 'Vacouver', 'BC', 'fdf45', 'user7@user.com', '141655555', '681316226', '9202521', 'J56361', 3);
insert into Customer values(4, 'Address1', 'Address2', 'Customer4', 'B', 'CLastname4', 'London', 'ON', '23ffbfs', 'user8@user.com', '141655555', '795197107', '8674252', 'I78369', 4);
insert into Customer values(5, 'Address1', 'Address2', 'Customer5', 'K', 'CLastname5', 'Calgary', 'AB', 'hg4536', 'user9@user.com', '141655555', '909077988', '9209371', 'K10377', 5);
GO

insert into CustomerAccount values(1, 1);
insert into CustomerAccount values(2, 2);
insert into CustomerAccount values(3, 3);
insert into CustomerAccount values(4, 4);
insert into CustomerAccount values(5, 5);
GO

insert into TransactionLog values('2015/6/4 07:30:56', 1,15000.7, 7869878, 1, 1, 1, 1);
insert into TransactionLog values('2018/6/9 12:34:57', 2,435435, 675687, 2, 2, 2, 2);
insert into TransactionLog values('2016/4/5 02:14:00', 3,855869.3, 34512356, 3, 3, 3, 3);
insert into TransactionLog values('2014/7/5 05:56:59', 4,1276303.6, 4643234, 4, 4, 4, 4);
insert into TransactionLog values('2009/10/12 08:34:15', 5,1696737.9, 325344, 5, 5, 5, 5);
GO

insert into OverDraftLog values('2015/6/4 07:30:56', 0, 'Clear');
insert into OverDraftLog values('2018/6/9 12:34:57', 5, 'Pending');
insert into OverDraftLog values('2016/4/5 02:14:00', 10, 'Clear');
insert into OverDraftLog values('2014/7/5 05:56:59', 15, 'Pending');
insert into OverDraftLog values('2009/10/12 08:34:15', 20, 'Clear');