/*
	Homework-03
	Chapter 4

	Name: Andrew Boothe

*/
-- Use the...
-- AP database for Questions 1 - 3 
-- ProductOrders database for Question 4
-- Examples database for Questions 5 - 7

--=============================================================================== AP DATABASE
USE AP;
GO
/* Q1: [11 rows]
	You may NOT use vwInvoices for this question. 
	You may NOT use a subquery for this question

	Write a SELECT statement that returns vendors with invoices
	that still have a balance. Return the following columns
		VendorName
		InvoiceNumber
		Balance
	Sort the list by Balance from largest to smallest

*/

--SELECT
--	v.VendorName,
--	i.InvoiceNumber,
--	[Balance] = (i.InvoiceTotal - i.PaymentTotal - i.CreditTotal)

--FROM
--	Invoices i,
--	Vendors v
--WHERE
--	i.VendorID = v.VendorID AND
--	i.InvoiceTotal - i.PaymentTotal - i.CreditTotal > 0
--ORDER BY
--	Balance DESC
	
		

/* Q2: [202 rows]
	You may NOT use vwInvoices for this question. 
	You may NOT use a subquery for this question.
	You may NOT use IIF() for this question

	Write a SELECT statement that returns all Vendors
		VendorName
		InvoiceNumber
		Balance
	Sort the result by VendorName, then by InvoiceNumber
	Do not show NULLs by converting InvoiceNumber to blank and Balance to 0
*/

--SELECT
--	v.VendorName,
--	[InvoiceNumber] = ISNULL(InvoiceNumber, ''),
--	[Balance] = ISNULL(i.InvoiceTotal - i.PaymentTotal - i.CreditTotal, 0)
--FROM
--	Vendors v
--	LEFT JOIN Invoices i ON i.VendorID = v.VendorID
--ORDER BY
--	v.VendorName,
--	i.InvoiceNumber


/* Q3: [79 rows]
	You must use the AP database to run this query
	You will need to retrieve data from the Vendors table in the Examples database

	Write a SELECT statement that returns all Vendors
		VendorName						from the AP database
		LastTranDate					from the Examples database
		LastYTDPurchases (must be > 0)	from the Examples database
	Sort the result by LastYTDPurchases from highest to lowest
*/


--SELECT
--	v.VendorName,
--	v1.LastTranDate,
--	v1.LastYTDPurchases
--FROM
--	Vendors v
--	JOIN Examples..Vendors v1 ON v1.VendorID = v.VendorID
--WHERE
--	v1.LastYTDPurchases > 0
--ORDER BY
--	v1.LastYTDPurchases DESC

--=============================================================================== ProductOrders DATABASE
USE ProductOrders;
GO
/* Q4: [7 rows]
	
	Write a SELECT statement that returns the following columns
		CustFirstName
		CustLastName
		Title
		UnitPrice
	for all orders that have not been shipped
*/

--SELECT
--	c.CustFirstName,
--	c.CustLastName,
--	i.Title,
--	i.UnitPrice
--FROM
--	Customers c
--	JOIN Orders o ON o.CustID = c.CustID
--	JOIN OrderDetails od ON od.OrderID = o.OrderID
--	JOIN Items i ON i.ItemID = od.ItemID
--WHERE
--	o.ShippedDate IS NULL

	

--=============================================================================== Examples DATABASE
USE Examples;
GO

/* Q5: [9 rows]
	
	Write a SELECT statement that returns the following columns
		Customer  = CustomerFirst and CustomerLast			from the Examples database
		OrderID												from the ProductOrders database

	for all orders that were ordered in 2015
*/

--SELECT
--	[Customer] = CONCAT(c.CustomerFirst, ' ', c.CustomerLast),
--	po.OrderID
--FROM
--	Customers c
--	JOIN ProductOrders..Orders po ON po.CustID = c.CustID
--WHERE
--	po.OrderDate BETWEEN '2015/01/01' AND '2015/12/31'


/* Q6: [18 rows]
	
	Write a SELECT statement that returns the following columns
		Customer  = CustFirstName and CustLastName			from the ProductOrders database
		OrderID												from the ProductOrders database

	for all orders that were ordered in 2015
*/

--Use ProductOrders
--GO

--SELECT
--	[Customer] = CONCAT(c.CustFirstName, ' ', c.CustLastName),
--	o.OrderID
--FROM
--	ProductOrders..Orders o CROSS JOIN ProductOrders..Customers c
--WHERE
--	o.CustID = c.CustID AND
--	o.OrderDate BETWEEN '2015/01/01' AND '2015/12/31'

/* Q7: [9 rows]
	
	Write a SELECT statement that returns the following columns
		Employee
		Manager
	Using the Employees table create a SELECT statement that 
	lists every Employee and who their manager is. If an employee
	doesn't have a manager (i.e., Cindy Smith) then their manager
	should read 'Shareholders'. For the Employee and Manager 
	columns you should return their first name, a space, and their
	last name.  Sort the list by the manager's name and then the 
	employee's name

*/

--USE Examples;
--GO

--SELECT DISTINCT
--	[Employees] = CONCAT(e.FirstName, ' ', e.LastName),
--	[Manager] = IIF (e.ManagerID IS NOT NULL, CONCAT(e.FirstName, ' ', e.LastName), 'Shareholders')
--FROM
--	Employees e
--	LEFT JOIN Employees e2 ON e.EmployeeID = e2.EmployeeID
--WHERE
--	e.ManagerID IN (SELECT EmployeeID FROM Employees) OR e.ManagerID IS NULL
--ORDER BY
--	Manager,
--	Employees