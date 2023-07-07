----------------------------------------------------------------------------------------------------
--	Lab-04
--	Name(s): Andrew Boothe, Michael Glum
--
----------------------------------------------------------------------------------------------------

--**************************************************************************************************
-- Q1 (5 pts) [34 rows]
-- 
--	Write a query that returns VendorID, and the sum of all PaymentTotal called PaymentSum.
--**************************************************************************************************

USE AP
GO

--SELECT 
--	i.VendorID,
--	[PaymentSum] = SUM(i.PaymentTotal)
--FROM 
--	Invoices i
--GROUP BY
--	i.VendorID
	

--**************************************************************************************************
-- Q2 (5 pts) [10 rows]
--
--	Write a query that returns the top 10 VendorName, and sum of all PaymentTotal called PaymentSum
--	and order the list by the PaymentSum from largest to smallest
--**************************************************************************************************

--SELECT TOP(10)
--	v.VendorName,
--	[PaymentSum] = SUM(i.PaymentTotal)
--FROM
--			Vendors			v
--	JOIN	Invoices		i	ON i.VendorID = v.VendorID
--GROUP BY
--	v.VendorName
--ORDER BY
--	PaymentSum DESC

--**************************************************************************************************
-- Q3 (5 pts) [34 rows]
--	Write a query that returns VendorName, the count of invoices, and the sum of the InvoiceTotal
--	called InvoiceSum
--**************************************************************************************************

--SELECT
--	v.VendorName,
--	[InvoiceCount]	 = COUNT(*),
--	[InvoiceSum] = SUM(i.InvoiceTotal)
--FROM	
--			Vendors			v
--	JOIN	Invoices		i	ON i.VendorID = v.VendorID
--GROUP BY
--	v.VendorName

--**************************************************************************************************
-- Q4 (10 pts) [10 rows]
--	Write a query that returns the GLAccounts AccountDescription, the count of the line 
--	items (LineItemCount) and the sum of the InvoiceLineItemAmount (LineItemSum). Only include
--	rows where the count is > 1.  Order the list by the count from highest to lowest
--**************************************************************************************************

--SELECT
--	g.AccountDescription,
--	[LineItemCount] = COUNT(*),
--	[LineItemSum] = SUM(ili.InvoiceLineItemAmount)
--FROM
--	GLAccounts g
--	JOIN	InvoiceLineItems ili	ON	ili.AccountNo = g.AccountNo
--GROUP BY
--	g.AccountDescription
--HAVING
--	COUNT(*) > 1
--ORDER BY
--	LineItemCount DESC

--**************************************************************************************************
-- Q5 (10 pts) [6 rows]
--	Write a query that returns the GLAccounts AccountDescription, the count of the line 
--	items (LineItemCount) and the sum of the InvoiceLineItemAmount (LineItemSum). Only include
--	rows where the count is > 2 and the invoice date is in February or March of 2016.  Order the 
--	list by the count from highest to lowest
--**************************************************************************************************

--SELECT
--	g.AccountDescription,
--	[LineItemCount] = COUNT(*),
--	[LineItemSum] = SUM(ili.InvoiceLineItemAmount)
--FROM
--	GLAccounts g
--	JOIN	InvoiceLineItems ili	ON	ili.AccountNo = g.AccountNo
--	JOIN	Invoices		i	ON  ili.InvoiceID = i.InvoiceID
--WHERE
--	(YEAR(i.InvoiceDate) = 2016) AND (MONTH(i.InvoiceDate) BETWEEN 2 AND 3)
--GROUP BY
--	g.AccountDescription
--HAVING
--	COUNT(*) > 2
--ORDER BY LineItemCount DESC

	
--**************************************************************************************************
-- Q6 (10 pts) [4 rows]
--	Write a query that returns VendorName, GLAccounts AccountDescription, the count of items on
--	invoices (LineItemCount) and the sum of the InvoiceLineItemAmount (LineItemSum). Only return
--	rows where there are more than 2 LineItemCount and the LineItemSum > 1000
--**************************************************************************************************

--SELECT
--	v.VendorName,
--	g.AccountDescription,
--	[LineItemCount] = COUNT(*),
--	[LineItemSum] = SUM(ili.InvoiceLineItemAmount)
--FROM
--	Vendors v
--	JOIN	Invoices			i		ON i.VendorID = v.VendorID
--	JOIN	InvoiceLineItems	ili		ON ili.InvoiceID = i.InvoiceID
--	JOIN	GLAccounts			g		ON g.AccountNo = ili.AccountNo
--GROUP BY
--	v.VendorName,
--	g.AccountDescription
--HAVING
--	COUNT(*) > 2 AND 
--	SUM(ili.InvoiceLineItemAmount) > 1000



--**************************************************************************************************
-- Q7 5 pts Extra Credit [2 rows]
--	Write a query that returns VendorName and the number of unique AccountNo (NumOfAccounts) the
--	vendor has used in the InvoiceLineItem table. Filter out vendors that have used less than 2 
--	unique AccountNo.  Order the list by vendor name
--**************************************************************************************************
	
--SELECT
--	v.VendorName,
--	[NumOfAccounts] = COUNT(DISTINCT ili.AccountNo)
--FROM	
--	Vendors v
--	JOIN	Invoices			i			ON i.VendorID = v.VendorID
--	JOIN	InvoiceLineItems	ili		ON ili.InvoiceID = i.InvoiceID
--GROUP BY
--	v.VendorName
--HAVING
--	COUNT(DISTINCT ili.AccountNo) >= 2
--ORDER BY
--	v.VendorName
