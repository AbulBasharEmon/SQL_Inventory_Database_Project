---create database
go
create database MicroCreditManagementSystem
on 
primary
(
name= 'MicroCredit',
filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MicroCredit.mdf',
filegrowth=5%,
size=25MB,
maxsize=100MB
)
log
on
(
name='MicroCredit_Log',
filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MicroCredit_Log.ldf',
filegrowth=1MB,
size=2MB,
maxsize=50MB
)

go

create login  Emon with password ='Emon123#', DEFAULT_DATABASE =MicroCreditManagementSystem;

go
alter server role serveradmin
add member Emon
go
use MicroCreditManagementSystem
go
create role UserRole
go
alter role db_owner
add member UserRole
go
create schema UserSchema
go
grant select,insert, update, delete, execute
on schemas::UserSchema
to UserRole
go
create user ProjectDBUser for login Emon
with default_schema=UserSchema
go
alter role UserRole
add member ProjectDBUser


-- Create Customers table
use MicroCreditManagementSystem
go

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Occupation VARCHAR(100)
);
	

-- Create Loans table
 use MicroCreditManagementSystem
go
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType INT,
    Amount DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Create Payments table
use MicroCreditManagementSystem
go
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    LoanID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);
	

-- Create Loan Types table
CREATE TABLE LoanTypes (
    LoanTypeID INT PRIMARY KEY,
    TypeName VARCHAR(100),
    Description varchar(200)
);


-- Create Branches table
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(255),
    Manager VARCHAR(100)
);
	

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    BranchID INT,
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);


	---create view
	go

	create view vwname
	with schemabinding
	as
	Select c.CustomerID,c.Name,c.Occupation,l.Amount
	from dbo.Customers as c
	join dbo.Loans as l
	on c.CustomerID=l.CustomerID



	---create cte
	go

	with CTE
	as
	(Select c.CustomerID,c.Name,c.Occupation,l.Amount
	from dbo.Customers as c
	join dbo.Loans as l
	on c.CustomerID=l.CustomerID)

	select *
	from CTE

	go

	---create scaler-valued function
	go
	create function dbo.getcustomername
	(
	@ID int
	)
	returns varchar(50)
	as
	begin
	declare @name varchar(50);

	select @name=Name
	from Customers
	where CustomerID=@ID;

	return @name;

	end;
	go
	


	---create table-valued function
	go
	create function dbo.getcustomersbyaddress
	(
	@address varchar(255)
	)
	returns table
	as
	return
	(
	select *
	from Customers
	where Address=@address
	)

	go


	---create multi-table function
	go

	create function dbo.getcustomer
	(
	@address varchar(255)
	)
	returns @customers table
	(
	CustomerID int,
	Name varchar(100),
	Address varchar(255)
	)
	as
	begin
	insert into @customers(CustomerID,Name,Address)
	select CustomerID,Name,Address
	from Customers
	where Address=@address
	return
	end;

	go



Go
	--Create Store procedure
	CREATE PROCEDURE GetCustomerLoans
    @CustomerName VARCHAR(100)
AS
BEGIN
    SELECT
        c.Name AS CustomerName,
        l.LoanID,
        lt.TypeName AS LoanType,
        l.Amount AS LoanAmount,
        l.InterestRate AS InterestRate,
        l.StartDate,
        l.EndDate
    FROM
        Customers c
    INNER JOIN
        Loans l ON c.CustomerID = l.CustomerID
    INNER JOIN
        LoanTypes lt ON l.LoanType = lt.LoanTypeID
    WHERE
        c.Name = @CustomerName;
END;


GO
	--Create Trigger

	CREATE TRIGGER InsertLoanStatus
ON Payments
AFTER INSERT
AS
BEGIN

    print 'payment insert operation complete'

    END
    
Go


CREATE TRIGGER UpdateLoanStatus
ON Payments
AFTER Update
AS
BEGIN

    print 'payment update operation complete'

    END
    
Go
