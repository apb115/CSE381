USE AP
GO

/*
	Name(s)	: Andrew Boothe
	Section	: CSE 385-B

	Create the following queries using an explicit join (unless stated otherwise)
	Use "old-school" naming for alias columns
*/


/*	Q1: [113 rows if using vwInvoices, 114 if using Invoices]
		Write a select statement that returns all columns from the 
		Vendors table and the Invoices table
*/

--SELECT *
--FROM 
--			Vendors			v
--	JOIN	Invoices		i		ON		v.VendorID = i.InvoiceID


/*	Q2: [117 rows if using vwInvoices, 118 if using Invoices]
		Write a select statement that returns the columns:
			VendorName
			InvoiceNumber
			InvoiceDate
			Balance
			InvoiceLineItemDescription
			InvoiceLineItemAmount
*/

--SELECT
--		v.VendorName,
--		vI.InvoiceNumber,
--		vI.InvoiceDate,
--		vI.Balance,
--		ili.InvoiceLineItemDescription,
--		ili.InvoiceLineItemAmount
--FROM		Vendors			v
--	JOIN	vwInvoices		vI		ON		v.VendorID = vI.VendorID
--	JOIN	InvoiceLineItems ili	ON		ili.InvoiceID = vI.InvoiceID



/*	Q3: [117 rows if using vwInvoices, 118 if using Invoices]
		Using an implicit join, write the same query as Q2 
*/

--SELECT
--		v.VendorName,
--		vI.InvoiceNumber,
--		vI.InvoiceDate,
--		vI.Balance,
--		ili.InvoiceLineItemDescription,
--		ili.InvoiceLineItemAmount
--FROM		Vendors			v	,	
--			vwInvoices		vI	,	
--		InvoiceLineItems ili	
--WHERE
--	v.VendorID = vI.VendorID AND
--	vI.InvoiceID = ili.InvoiceID


/*	Q4: [122 rows]
		Write a select statement that returns one row for each vendor and includes
		the following columns:
			VendorName
			DefaultAccountNo
			AccountDescription
*/

--SELECT DISTINCT
--	v.VendorName,
--	v.DefaultAccountNo,
--	g.AccountDescription
	
--FROM	 
--		 Vendors		v
--		 JOIN GLAccounts		g	ON g.AccountNo = v.DefaultAccountNo


/*	Q5: [117 rows if using vwInvoices, 118 if using Invoices]
		Write a select statement that returns the following columns
		using the given alias names
			Vendor		VendorName
			Date		InvoiceDate
			Number		InvoiceNumber
			SortOrder	InvoiceSequence
			Item		InvoiceLineItemDescription
			Cost		InvoiceLineItemAmount
		Assign the following correlation names to the tables:
			v			Vendors
			i			Invoices
			ili			InvoiceLineItems
		Sort the final result by the vendor's name, the invoice date, 
		the invoice number and the sort order
*/

--SELECT
--	[Vendor] = v.VendorName,
--	[Date]	= i.InvoiceDate,
--	[Number] = i.InvoiceNumber,
--	[SortOrder] = ili.InvoiceSequence,
--	[Item] = ili.InvoiceLineItemDescription,
--	[Cost] = ili.InvoiceLineItemAmount
--FROM
--	Vendors v
--	JOIN	vwInvoices			i		ON		i.VendorID = v.VendorID
--	JOIN	InvoiceLineItems	ili		ON		ili.InvoiceID = i.InvoiceID
--ORDER BY
--	v.VendorName,
--	i.InvoiceDate,
--	SortOrder



/*	Q6: [6 rows]
		Write a select statement that returns the following columns:
			VendorID
			VendorName
			Name		(VendorContactFName, space, VendorContactLName)
		Return vendors who share the same first name (VendorContactFName)
		Sort the result by the vendor's full name. (hint: use self join)
		NOTE: You can use an implicit or explicit join for this question
*/

--SELECT DISTINCT
--	v1.VendorID,
--	v1.VendorName,
--	[Name] = CONCAT(v1.VendorContactFName, ' ', v1.VendorContactLName)

--FROM 
--	Vendors v1,
--	Vendors v2
--WHERE
--	v1.VendorID != v2.VendorID AND
--	v1.VendorContactFName = v2.VendorContactFName
--ORDER BY
--	Name
	



/*	Q7: [54 rows]
		Write a select statement that returns two columns from the
		GLAccounts table: AccountNo and AccountDescription for 
		every account number that has never been used. Sort by AccountNo
*/

--????????????????????????????????????????

--SELECT DISTINCT
--	gl.AccountNo,
--	gl.AccountDescription
--FROM
--	GLAccounts gl,
--	InvoiceLineItems ili
--WHERE
--	gl.AccountNo NOT IN (SELECT DISTINCT ili.AccountNo FROM InvoiceLineItems ili)
--ORDER BY
--	gl.AccountNo
	

/*	Q8: [122 rows]
		Use a UNION operator to generate a result set consisting of two 
		columns from the Vendors table: VendorName and VendorState. If
		the vendor is in California, the VendorState should be "CA";
		otherwise, the VendorState should be "Outside CA" Sort the 
		list by VendorName
*/

--SELECT 
--	v.VendorName,
--	[VendorState] = 'Outside CA'
--FROM
--	Vendors v
--WHERE
--	v.VendorState != 'CA'

--UNION

--SELECT
--	v.VendorName,
--	v.VendorState
--FROM
--	Vendors v
--WHERE
--	v.VendorState = 'CA'
--ORDER BY
--	v.VendorName

