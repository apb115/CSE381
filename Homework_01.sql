/*
	Homework_01
	
	Section:
	Name(s):
	
*/


/*========== PART I (20 pts)
	Using draw.io, create a complete ERD of the AP database. Be sure to review all tables and
	columns as well as the constraints on each of the dB objects. Make sure you include ALL
	dB objects. 
	Do not make connections to InvoiceArchive, ContactUpdates, or vwInvoices
	Include the header block. Export your ERD as a PDF ON 1 PAGE (i.e., entire drawing should 
	fit on one page and have NO overlapping connectors). Do not "Crop", or have a transparent
	background. Upload it to Canvas
*/

/*========== PART II (50 pts) */
/* Q1:
	Write a SELECT statement that returns 3 columns from the Vendors table:
	VendorContactFName, VendorContactLName, and VendorName. 
	Sort the result set by the last name, then by first name
*/


/* Q2:
	Write a SELECT statement that returns the following 4 columns from the Invoice table:
		number		alias for InvoiceNumber
		total		alias for InvoiceTotal 
		credits		PaymentTotal + CreditTotal
		balance		InvoiceTotal - PaymentTotal - CreditTotal
	use "Old-School" notation for assigning the column aliases
*/


/* Q3:
	Write a SELECT statement that returns one column from the Vendors table: fullName.
	Create this column from the VendorContactFName and VendorContactLName columns.
	Format it as last name, first name (ex: Stahr, Michael) Sort the set by last name
	then first name.
*/



/* Q4:
	Write a SELECT statement that returns 3 columns:
		invoiceTotal	From the Invoices table
		interest		10% of the value of InvoiceTotal
		grandTotal		InvoiceTotal + the interest
*/



/* Q5:
	Write the same query from question #2 but modify the query to filter for invoices with 
	an InvoiceTotal that's greater than or equal to 500 but less than or equal to 10000
*/



/* Q6:
	Write the same query from question #3 but modify the query to filter for contacts 
	whose last name begins with the letter A, B, C, or E
*/



/* Q7:
	Write a SELECT statement that determines whether the PaymetDate column of the Invoices
	table has any invalid values. To be valid, PaymentDate must be a null value if there's a
	balance due and a non-null value if there's no balance due. Code a compound condition in
	the WHERE clause that tests for these conditions.
*/


/* Q8:
	Write a query that returns all invoices that have not been paid off and that the PaymentTotal
	was more than 50% of the InvoiceTotal
*/


/*
   Q9:
    Write a query that returns all InvoiceLineItems that has an line item amount > 25,000 or
	is marked as "Health Insurance" or "Cover design"
*/



/*
   Q10:
    Write a query that returns the top 10 invoices with an InvoiceDate from 2016-01-01 and 2016-01-15 
	order by the InvoiceDate. Return all columns and include records that tie
*/