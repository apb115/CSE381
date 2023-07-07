/*
	Monday, March 7th
	Class Notes
*/

/*=======================================================================================================*/
/*=====================================|   Aggregate Expressions    |====================================*/
/*=====================================| AVG(), SUM(), MIN(), MAX() |====================================*/
/*=======================================================================================================*/

	/*======================================================================== Single table, no grouping */
	-- Return the sum of all invoice totals
		--SELECT 
		--	[SUMInvoiceTotal] = SUM(InvoiceTotal),
		--	[AVGInvoiceTotal] = AVG(InvoiceTotal),
		--	[AVGCreditTotal]  = AVG(CreditTotal),
		--	[AVGPaymentTotal] = AVG(PaymentTotal),
		--	[InvoiceCount]	  = COUNT(*)
		--FROM 
		--	Invoices
			
	

	GO
	/*======================================================================== Filter results with WHERE */
	-- Return the sum of all invoice total that still have a balance

	--SELECT
	--	SUM(InvoiceTotal),
	--	SUM(Balance)
	--FROM
	--	vwInvoices
	--WHERE
	--	Balance > 0

	GO
	/*======================================================================== Format number */
	-- Return the SUM, COUNT, and the % of a budget of 1,000,000. Output:
	--			InvoiceTotals	InvoiceCount	PercentOfBudget
	--			$214,290.51		114.00 			21.43% 
	--
	-- Use a variable of type FLOAT called budget and set it to 1000000.00
	-------------------------------------------------------------------------------------------
	--  'C'			= Currency	($1,000.00)
	--	'N'			= Number	(1,000.00)
	--	'P'			= Percent	(25%)
	--	'#,#'		= Number	(,)
	--	'#,#.00'	= Number	(,.00)
	--DECLARE @budget FLOAT = 1000000.00;
	--SELECT
	--	 [InvoiceTotals]	= FORMAT(SUM(InvoiceTotal) , 'C')
	--	,[InvoiceCountF]		= FORMAT(COUNT(*), 'N')		
	--	,[InvoiceCount]		= FORMAT(COUNT(*), '#,#')
	--	,[PercentOfBudget]	= FORMAT(SUM(InvoiceTotal) / @budget , 'P')
	--FROM
	--	Invoices
	--FOR JSON PATH

	GO
	/*======================================================================== Single table, w/ grouping */
	-- Using the query above, group the values by the VendorID 

	--DECLARE @budget FLOAT = 1000000.00;
	--SELECT
	--	 VendorID
	--	,[InvoiceTotals]	= FORMAT(SUM(InvoiceTotal) , 'C')
	--	,[InvoiceCountF]		= FORMAT(COUNT(*), 'N')		
	--	,[InvoiceCount]		= FORMAT(COUNT(*), '#,#')
	--	,[PercentOfBudget]	= FORMAT(SUM(InvoiceTotal) / @budget , 'P')
	--FROM
	--	Invoices
	--GROUP BY 
	--	VendorID

	GO
	/*======================================================================== Adding HAVING */
	-- Using the query above, only return Vendors with more than 2 invoices

	--DECLARE @budget FLOAT = 1000000.00;
	--SELECT
	--	 VendorID
	--	,[InvoiceTotals]	= FORMAT(SUM(InvoiceTotal) , 'C')
	--	,[InvoiceCountF]		= FORMAT(COUNT(*), 'N')		
	--	,[InvoiceCount]		= FORMAT(COUNT(*), '#,#')
	--	,[PercentOfBudget]	= FORMAT(SUM(InvoiceTotal) / @budget , 'P')
	--FROM
	--	Invoices
	--GROUP BY 
	--	VendorID
	--HAVING
	--	COUNT(*) > 2

	GO
	/*======================================================================== Adding HAVING */
	-- Using the query above, only return Vendors with PercentOfBudget > 2%

	--DECLARE @budget FLOAT = 1000000.00;
	--DECLARE @percent FLOAT = .02
	--SELECT
	--	 VendorID
	--	,[InvoiceTotals]	= SUM(InvoiceTotal)
	--	,[InvoiceCount]		= COUNT(*)
	--	,[PercentOfBudget]	= SUM(InvoiceTotal) / @budget
	--FROM
	--	Invoices
	--GROUP BY 
	--	VendorID
	--HAVING
	--	SUM(InvoiceTotal) / @budget > @percent

	GO
	/*======================================================================== 2 Tables */
	-- Return a list of VendorName, the sum of all invoice totals, and the count
	-- of all invoices.  Only return vendors that have more than 2 invoices
	--SELECT 
	--	VendorName,
	--	[InvoiceSum] = ISNULL(SUM(InvoiceTotal), 0),
	--	[InvoiceCount] = COUNT(*)
	--	FROM
	--			Vendors		v
	--	LEFT JOIN	Invoices	I	ON v.VendorID = i.VendorID
	--GROUP BY
	--	VendorName

	GO
	/*======================================================================== Adding AVG() */
	-- Using the above query include the Average invoice for each vendor

	--SELECT 
	--	VendorName,
	--	[InvoiceSum] = ISNULL(SUM(InvoiceTotal), 0),
	--	[InvoiceCount] = COUNT(*)
	--FROM
	--				Vendors		v
	--	LEFT JOIN	Invoices	I	ON v.VendorID = i.VendorID
	--WHERE
	--	VendorState != 'CA'
	--GROUP BY
	--	VendorName

	GO
	/*========================================================================*/
	-- Using the query above query, filter out all vendors from CA

	--SELECT 
	--	VendorName,
	--	[InvoiceSum] = ISNULL(SUM(InvoiceTotal), 0),
	--	[InvoiceCount] = COUNT(*)
	--FROM
	--				Vendors		v
	--	LEFT JOIN	Invoices	I	ON v.VendorID = i.VendorID
	--WHERE
	--	VendorState != 'CA'
	--GROUP BY
	--	VendorName


	GO
	/*========================================================================*/
	-- Return the top 5 (including ties) VendorName, and the sum of all 
	-- InvoiceTotal for each vendor (SumInvoiceTotal). The top 5 should be 
	-- based on the SumInvoiceTotal
 

	--SELECT TOP (5) WITH TIES
	--	VendorName,
	--	[SumInvoiceTotal] = SUM(InvoiceTotal)
	--FROM
	--	Invoices i,
	--	Vendors v
	--WHERE 
	--	v.VendorID = i.VendorID
	--GROUP BY
	--	VendorName
	--ORDER BY
	--	SumInvoiceTotal DESC

	GO
	/*========================================================================*/
	-- Return the average InvoiceTotal, average CreditTotal, and the average
	-- PaymentTotal for all invoices
		


	-- Aggregate Example

	-- OLD
	--SELECT DISTINCT
	--	VendorID,
	--	(SELECT SUM(InvoiceTotal) FROM Invoices WHERE VendorID = i.VendorID)
	--FROM 
	--	Invoices i

	---- NEW
	--SELECT	VendorID,
	--		TermsID,

	--		SUM(invoiceTotal),
	--		COUNT(*),
	--		AVG(InvoiceTotal),
	--		MIN(InvoiceTotal),
	--		MAX(InvoiceTotal)
	--FROM	Invoices I
	--GROUP BY VendorID, TermsID
	--ORDER BY VendorID, TermsID