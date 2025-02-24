-- Inserting Sample Data

-- Customers
use MicroCreditManagementSystem
go

INSERT INTO Customers (CustomerID, Name, Age, Address, Phone, Occupation) VALUES
(1, 'Rahim Ahmed', 35, 'Dhaka', '01754327681', 'Engineer'),
    (2, 'Fatima Khan', 28, 'Chittagong', '01832456541', 'Doctor'),
    (3, 'Kamal Hasan', 45, 'Sylhet', '01943256436', 'Businessman'),
    (4, 'Aisha Rahman', 30, 'Khulna', '01532145671', 'Teacher'),
    (5, 'Nazmul Islam', 40, 'Rajshahi', '01643256789', 'Accountant'),
    (6, 'Sadia Akter', 25, 'Barisal', '01765432678', 'Student'),
    (7, 'Abdul Bari', 55, 'Comilla', '01854325678', 'Retired'),
    (8, 'Shahida Begum', 38, 'Mymensingh', '01987654890', 'Lawyer'),
    (9, 'Imran Khan', 32, 'Dinajpur', '01565432456', 'Software Developer'),
    (10, 'Taslima Akhter', 42, 'Jessore', '01654325674', 'Nurse');

-- Loans
INSERT INTO Loans (LoanID, CustomerID, LoanType, Amount, InterestRate, StartDate, EndDate) VALUES
	(1, 1, 1, 50000.00, 8.5, '2024-01-01', '2025-01-01'),
    (2, 2, 2, 75000.00, 9.0, '2024-02-01', '2025-02-01'),
    (3, 3, 1, 100000.00, 7.5, '2024-03-01', '2025-03-01'),
    (4, 4, 2, 60000.00, 8.0, '2024-04-01', '2025-04-01'),
    (5, 5, 1, 80000.00, 7.0, '2024-05-01', '2025-05-01'),
    (6, 6, 2, 55000.00, 8.25, '2024-06-01', '2025-06-01'),
    (7, 7, 1, 90000.00, 6.5, '2024-07-01', '2025-07-01'),
    (8, 8, 2, 70000.00, 8.75, '2024-08-01', '2025-08-01'),
    (9, 9, 1, 120000.00, 7.25, '2024-09-01', '2025-09-01'),
    (10, 10, 2, 65000.00, 9.5, '2024-10-01', '2025-10-01');
;

-- Payments
INSERT INTO Payments (PaymentID, LoanID, PaymentAmount, PaymentDate) VALUES
	(1, 1, 6000.00, '2024-02-15'),
    (2, 2, 8000.00, '2024-03-20'),
    (3, 3, 9000.00, '2024-04-25'),
    (4, 4, 7000.00, '2024-05-15'),
    (5, 5, 10000.00, '2024-06-10'),
    (6, 6, 7500.00, '2024-07-12'),
    (7, 7, 8500.00, '2024-08-18'),
    (8, 8, 9500.00, '2024-09-22'),
    (9, 9, 11000.00, '2024-10-30'),
    (10, 10, 6000.00, '2024-11-05');


-- Loan Types
INSERT INTO LoanTypes (LoanTypeID, TypeName, Description) VALUES
(1, 'Business Loan', 'Loan for business purposes'),
(2, 'Education Loan', 'Loan for educational expenses');

-- Branches
INSERT INTO Branches (BranchID, BranchName, Location, Manager) VALUES
	(1, 'Dhaka Branch', 'Dhaka', 'Md. Rahman'),
    (2, 'Chittagong Branch', 'Chittagong', 'Fatema Akhter'),
    (3, 'Sylhet Branch', 'Sylhet', 'Kamal Ahmed'),
    (4, 'Khulna Branch', 'Khulna', 'Nazrul Islam'),
    (5, 'Rajshahi Branch', 'Rajshahi', 'Rahima Begum'),
    (6, 'Barisal Branch', 'Barisal', 'Sohel Rana'),
    (7, 'Comilla Branch', 'Comilla', 'Ayesha Khan'),
    (8, 'Mymensingh Branch', 'Mymensingh', 'Ali Hasan'),
    (9, 'Dinajpur Branch', 'Dinajpur', 'Anwar Hossain'),
    (10, 'Jessore Branch', 'Jessore', 'Taslima Khan');

-- Employees
INSERT INTO Employees (EmployeeID, Name, BranchID, Position, Salary) VALUES
(1, 'Abdul Karim', 1, 'Branch Manager', 80000.00),
    (2, 'Jannatul Ferdous', 2, 'Loan Officer', 50000.00),
    (3, 'Mosharraf Hossain', 3, 'Accountant', 45000.00),
    (4, 'Shamim Ahmed', 4, 'Customer Service Representative', 40000.00),
    (5, 'Farhana Akter', 5, 'Branch Manager', 75000.00),
    (6, 'Rakib Hasan', 6, 'Loan Officer', 50000.00),
    (7, 'Nadia Rahman', 7, 'Accountant', 45000.00),
    (8, 'Imtiaz Hossain', 8, 'Customer Service Representative', 40000.00),
    (9, 'Sadia Islam', 9, 'Branch Manager', 70000.00),
    (10, 'Arif Khan', 10, 'Loan Officer', 50000.);

	go
	Select *
	From Customers

	go
	Select *
	From Loans

	go
	Select *
	From Payments

	go
	Select *
	From LoanTypes

	go
	Select *
	From Branches

	go
	Select *
	From Employees

	go

	-----------------------------------------------------------------
	----Some Query Example From MicroCreditManagementSystem
	go
	select *
	from Payments 
	order by PaymentAmount desc

	go
	Select * 
	from Customers as c
	join Loans as l
	on c.CustomerID=l.CustomerID

	go

	select *
	from Loans
	where Amount between 25000 and 55000


	go

	Select name
	from Customers
	union
	select Name
	from Employees

	go
	select *
	from Customers
	where Name like 'a%'

	go

	select *
	from Employees
	where Salary Is Null


	go
	select Name, Address,count(*) as Qty
	from Customers as c
	join Loans as l
	on c.CustomerID=l.CustomerID
	Group by Name, Address
	having count(*)>=1

	go
	
	select Name, Position,count(*) as Qty
	from Employees 
	where Position like 'Branch Manager'
	Group by rollup(Name, Position)
	
	go

	select Name, Position,count(*) as Qty
	from Employees 
	where Position like 'Branch Manager'
	Group by cube(Name, Position)

	go

	SELECT LoanID, LoanType, Amount
	FROM Loans
	Where Amount> 
	(select avg(Amount) 
	from Loans )
	order by Amount

	go

	SELECT *
	FROM Loans
	Where CustomerID in
	(select CustomerID 
	from Customers 
	where address= 'Chittagong')
	order by StartDate


	go

	SELECT *
	FROM Loans
	Where CustomerID >all
	(select CustomerID 
	from Customers 
	where address= 'Chittagong')
	order by StartDate

	go

	SELECT *
	FROM Loans
	Where CustomerID >some
	(select CustomerID 
	from Customers 
	where address= 'Chittagong')
	order by StartDate

	go

	SELECT *
	FROM Loans
	Where CustomerID >any
	(select CustomerID 
	from Customers 
	where address= 'Chittagong')
	order by StartDate

	go

	SELECT *
	FROM Loans
	Where exists
	(select * 
	from Customers 
	where address= 'Chittagong')
	order by StartDate

	---calling view
	select *
	from vwname

	---calling scaler valued function
	declare @ID int=2
	declare @name varchar(50);
	set @name=dbo.getcustomername(@ID)


	select @name as Name


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


	---calling table function

	declare @address varchar(255)='Chittagong'
	select *
	from dbo.getcustomersbyaddress(@address)


	---calling  multi table function
	declare @address varchar(255)='Dhaka'
	select *
	from dbo.getcustomer(@address)


	---calling store procedure

	EXEC GetCustomerLoans 'Rahim Ahmed';