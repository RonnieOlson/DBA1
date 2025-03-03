USE ap;

SELECT COUNT(invoice_id) AS total_invoices -- Selects and counts the ammount of invoice_id columms 
FROM invoices;

SELECT SUM(invoice_total) AS total_invoice_amount -- Selects and adds up the invoice_total columns into a total amount
FROM invoices;

SELECT AVG(invoice_total) AS average_invoice_window -- Selects the invoice_total column and returns an average 
FROM invoices;

SELECT MAX(invoice_total) AS highest_invoice_total , MIN(invoice_total) AS lowest_invoice_total -- Selects the invoice_total column while using MIN and MAX functions to display smallest and largest numbers
FROM invoices;

SELECT invoice_total - payment_total - credit_total AS total_amount_paid, vendor_id -- calculates the total amount paid and displays table in descending order
FROM invoices
ORDER BY total_amount_paid DESC;

SELECT vendor_id, COUNT(invoice_id) AS total_invoices, SUM(invoice_total) AS total_invoice_amount  -- Shows how many invoices and the total invoice amount that vendors have 
FROM invoices
GROUP BY vendor_id
ORDER BY total_invoice_amount;

SELECT account_number, SUM(line_item_amount) AS total_line_item_amount -- displays account number and the total amount of line items and sorts by the total in Descending
FROM invoice_line_items
GROUP BY account_number
ORDER BY total_line_item_amount DESC;

SELECT vendor_id, SUM(invoice_total) AS total_invoice_amount 
FROM invoices
GROUP BY vendor_id WITH ROLLUP
ORDER BY total_invoice_amount ASC
