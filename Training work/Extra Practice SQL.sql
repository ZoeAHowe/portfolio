--1.Create a report that shows CategoryName and Description from the Categories
-- table sorted by CategoryName
use
	Northwind
select 
	CategoryName,
	Description
from Categories
order by
	CategoryName

--2. Create a report that shows the ContactName, CompanyName, ContactTitle, and
-- Phone number from the customers table sorted by Phone
select 
	ContactName,
	ContactTitle,
	CompanyName,
	Phone
from Customers
order by Phone

-- 3. Create a report that shows the caplitalized FirstName and capitalized LastName
-- renamed as FirstName and LastName respectively and HireDate from the employees
-- table sorted from oldest to newest employee
select 
	upper(FirstName) as FirstName,
	upper(LastName) as LastName,
	HireDate
from Employees
order by
	HireDate asc

-- 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID,
-- Freight from the orders table sorted by Freight is descending order
select top 10
	OrderID,
	OrderDate,
	ShippedDate,
	CustomerID,
	Freight
from
	Orders
order by
	Freight desc

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID
-- from the Customer table
select
	lower(CustomerID) as ID
from
	Customers

-- 6. Create a report that show the CompanyName, Fax, Phone, Country, Homepage from the Suppliers
-- table sorted by the Country in descending order then by CompanyName is ascending order
select
	CompanyName,
	Fax,
	Phone,
	Country,
	HomePage
from
	Suppliers
order by
	Country desc,
	CompanyName asc

-- 7. Create a report that shows CompanyName, ContactName of all customers from 'Buenos Aires'
-- only
select 
	CompanyName,
	ContactName
from
	Customers
where
	City = 'Buenos Aires'

-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock
select 
	ProductName,
	UnitPrice,
	QuantityPerUnit
from
	Products
where
	UnitsInStock = 0

-- 9. Create a report showing all the ContactName, Address, City of all customers not from Germany,
-- Mexico, Spain
select 
	ContactName,
	Address,
	City
from
	Customers
where
	Country != 'Germany, Mexico, Spain' 

-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed
-- on 21 May 1996
select 
	OrderDate,
	ShippedDate,
	CustomerID,
	Freight
from
	Orders
where
	OrderDate = '1996-05-21'

-- 11. Create a report showing FirstName, LastName, Country from the employees not from United States
select 
	FirstName,
	LastName,
	Country
from
	Employees
where
	Country != 'USA'

-- 12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from
-- all orders shipped later than the required date
select 
	EmployeeID,
	OrderID,
	CustomerID,
	RequiredDate,
	ShippedDate
from
	Orders
where
	ShippedDate > RequiredDate

-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting
-- with A or B
select 
	City,
	CompanyName,
	ContactName
from
	Customers
where
	City like 'a%' or
	City like 'b%'

-- 14. Create a report showing all the even numbers of OrderID from the Orders table
select 
	OrderID
from
	Orders
where
	(OrderID%2)=0
-- 15. Create a report that shows all the orders where the freight cost more than $500
select *
from
	Orders
where
	Freight > 500

-- 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of
-- all products that are up for reorder
select 
	ProductName,
	UnitsInStock,
	UnitsOnOrder,
	ReorderLevel
from
	Products
where 
	ReorderLevel > 0

-- 17. Create a report that shows the CompanyName, ContactName, number of all customer that
-- no fax number
select 
	CompanyName,
	ContactName,
	Phone
from
	Customers
where
	Fax is null
	
-- 18. Create a report that shows the FirstName, LastName of all employees that do not report
-- to anybody
select 
	FirstName,
	LastName
from
	Employees
where
	ReportsTo is null

-- 19. Create a report showing all the odd numbers of OrderID from the orders tables
select 
	OrderID
from
	Orders
where
	(OrderID%2)=1

-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have a Fax number 
-- and sorted by ContactName
select 
	CompanyName,
	ContactName,
	Fax
from
	Customers
where
	Fax is null
order by 
	ContactName

-- 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has a letter 
-- L in the name, sorted by ContactName
select 
	City,
	CompanyName,
	ContactName
from
	Customers
where
	City like '%l%'
order by
	ContactName

-- 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s
select 
	FirstName,
	LastName,
	BirthDate
from
	Employees
where
	BirthDate between '1950-01-01' and '1959-12-31'

-- 23. Create a report that shows the FirstName, LastName, the year of BirthDate as birth year from the
-- employees table
select 
	FirstName,
	LastName,
	year(BirthDate) as BirthYear
from
	Employees

-- 24. Create a report showing OrderID, total number of OrderID as NumberofOrders from the orderdetails
-- table grouped by OrderID and sorted by NumberofOrders in descending order
select 
	OrderID,
	count(OrderID) as NumberofOrders
from
	[Order Details]
group by
	OrderID
order by
	NumberofOrders desc

-- 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product supplied by
-- Exotic Liquids, Speciality Biscuits, Ltd., Escargots Nouveaux sorted by supplier ID
select 
	S.SupplierID,
	P.ProductName,
	S.CompanyName
from
	Suppliers as S
join 
	Products as P
on S.SupplierID = P.SupplierID
where
	S.CompanyName = 'Exotic Liquids' or
	S.CompanyName = 'Specialty Biscuits, Ltd.' or
	S.CompanyName = 'Escargots Nouveaux'
order by
	S.SupplierID

-- 26. Create a report that shows ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
-- of all orders with ShipPostalCode beginning with '98124'
select 
	ShipPostalCode,
	OrderID,
	OrderDate,
	RequiredDate,
	ShippedDate,
	ShipAddress
from
	Orders
where
	ShipPostalCode like '98124%'

-- 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that have no
-- 'Sales' in their ContactTitle
select 
	ContactName,
	ContactTitle,
	CompanyName
from
	Customers
where
	ContactTitle not like '%sales%'

-- 28. Create a report that shows the LastName, FirstName, City of employees in cities other than Seattle
select 
	LastName,
	FirstName,
	City
from
	Employees
where 
	City != 'Seattle'

-- 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in 
-- Mexico or other cities in Spain other than Madrid
select 
	CompanyName,
	ContactTitle,
	City,
	Country
from
	Customers
where
	Country = 'Mexico' or
	Country = 'Spain' and
	City != 'Madrid'

-- 30. 
select 
	(FirstName + ' ' + LastName + ' can be reached at x' + Extension) as Contactinfo
from
	Employees

-- 31. Create a report that shows the ContactName of all customers that do not have a letter A as the second 
-- alphabet in their ContactName
select 
	ContactName
from
	Customers
where
	ContactName not like '_a%'

-- 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of 
-- UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock
-- and MaxOrder respectively.
select 
	round(avg(UnitPrice), 0) as AveragePrice,
	sum(UnitsInStock) as TotalStock,
	max(UnitsOnOrder) as MaxOrder
from
	Products

-- 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice
-- from the products, suppliers and category table
select 
	P.SupplierID,
	S.CompanyName,
	C.CategoryName,
	P.ProductName,
	P.UnitPrice
from
	Products as P
join
	Suppliers as S
on 
	P.SupplierID = S.SupplierID
join
	Categories as C
on
	P.CategoryID = C.CategoryID

-- 34. Create a report that shows the CustomerID, sum of Freight, from the orders table with the sum of Freight
-- greater than $200, grouped by CustomerID
select 
	CustomerID,
	sum(Freight) as TotalFreight
from
	Orders
group by
	CustomerID
having
	sum(Freight) > 200

-- 35. Create a report that showsthe OrderID, ContactName, UnitPrice, Quantity, Discount from Order Details,
-- orders and customers table with discount given on every purchase
select 
	OD.OrderID,
	C.ContactName,
	OD.UnitPrice,
	OD.Quantity,
	OD.Discount,
	(OD.UnitPrice - OD.Discount) as Price_with_Discount
from
	[Order Details] as OD
join
	Orders as O
on
	OD.OrderID = O.OrderID
join
	Customers as C
on
	O.CustomerID = C.CustomerID

-- 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and 
-- FirstName of who they report to as manager from the employees table, sorted by Employee
select 
	concat(Emp.LastName, ' ', Emp.FirstName) as Employee,
	concat(Mgr.LastName, ' ', Mgr.FirstName) as Manager
from
	Employees as Emp
left join
	Employees as Mgr
on 
	Mgr.EmployeeID = Emp.ReportsTo
order by
	Emp.EmployeeID

-- 37. Create a report that showsthe average, minimum and maximum UnitPrice of all products as AveragePrice,
-- MinimumPrice and MaximumPrice respectively
select 
	round(avg(UnitPrice), 2) as AveragePrice,
	min(UnitPrice) as MinimumPrice,
	max(UnitPrice) as MaximumPrice
from
	[Order Details]

-- 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle,
-- Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table
create view vCustomerInfo as
select 
	C.CustomerID,
	C.CompanyName,
	C.ContactName,
	C.ContactTitle,
	C.Address,
	C.City,
	C.Country,
	C.Phone,
	O.OrderDate,
	O.RequiredDate,
	O.ShippedDate
from
	Customers as C
join 
	Orders as O
on
	C.CustomerID = O.CustomerID;


-- 39. Change the name of the view you created from CustomerInfo to customer details
-- Done through menu on the right

-- 40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description,
-- QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and 
-- categories tables

create view ProductDetails as
select 
	P.ProductID,
	S.CompanyName,
	P.ProductName,
	C.CategoryName,
	C.Description,
	P.QuantityPerUnit,
	P.UnitPrice,
	P.UnitsInStock,
	P.UnitsOnOrder,
	P.ReorderLevel,
	P.Discontinued
from
	Suppliers as S
join
	Products as P
on S.SupplierID = P.SupplierID
join
	Categories as C
on P.CategoryID = C.CategoryID

-- 41. Drop CustomerDetails view
drop view if exists CustomerDetails

-- 42. Create a report that fetch the first 5 character of CategoryName from the category
-- table and renamed as ShortInfo
select 
	substring(CategoryName, 0, 5) as ShortInfo
from
	Categories

-- 43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers
-- data into the new table
drop table if exists shippers_dup;
select * into shippers_dup
from Shippers

-- 44. Create a select statement that outputs the following from the shippers_duplicate
select *
from shippers_dup

-- 45. Create a report that shows the CompanyName and ProductName from all product in the
-- Seafood category
select
	C.CompanyName,
	P.ProductName
from
	Customers as C
join
	Orders as O
on 
	C.CustomerID = O.CustomerID
join 
	[Order Details] as OD
on 
	O.OrderID = OD.OrderID
join
	Products as P
on
	OD.ProductID = P.ProductID
join
	Categories as Cat
on
	P.CategoryID = Cat.CategoryID
where
	Cat.CategoryName = 'Seafood'

-- 46. Create a report that shows the CategoryID, CompanyName and ProductName from all
-- product in categoryID 5
select
	C.CategoryID,
	Cust.CompanyName,
	P.ProductName
from
	Categories as C
join
	Products as P
on
	C.CategoryID = P.CategoryID
join
	[Order Details] as OD
on
	P.ProductID = OD.ProductID
join
	Orders as O
on
	OD.OrderID = O.OrderID
join
	Customers as Cust
on
	O.CustomerID = Cust.CustomerID
where
	C.CategoryID = 5

-- 47. Delete the shippers_duplicate table
drop table if exists shippers_dup

-- 48. Create a select statement that outputs LastName, FirstName, Title, Age from Employees table
select 
	LastName,
	FirstName,
	Title,
	datediff(year, BirthDate, getdate()) as Age
from
	Employees

-- 49. Create a report that the CompanyName and total number of orders by customer renamed as number of 
-- orders since December 31, 1994. Show number of orders greater than 10
select 
	C.CompanyName,
	count(O.CustomerID) as NumberofOrders
from
	Customers as C
join
	Orders as O
on 
	C.CustomerID = O.CustomerID
where
	O.OrderDate >= '1994-12-31'
group by
	C.CompanyName
having
	count(O.CustomerID) > 10

-- 50.  Create a select statement that outputs ' Chai weighs/is 10 boxes x 20 bags and cost $18'
select
	concat(ProductName,' weighs/is ',QuantityPerUnit,' and cost ', '$', round(UnitPrice,2)) as ProductInfo
from
	Products
