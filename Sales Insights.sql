USE SALES;
SELECT * FROM CUSTOMERS;
SELECT COUNT(*) FROM TRANSACTIONS;

-- Data Analysis Using SQL

/*
1. Show all customer records
2. Show total number of customers
3. Show transactions for Chennai market (market code for chennai is Mark001)
4. Show distrinct product codes that were sold in chennai
5. Show transactions where currency is US dollars
6. Show transactions in 2020 join by date table
7. Show total revenue in year 2020
8. Show total revenue in year 2020, January Month
9. Show total revenue in year 2020 in Chennai.
*/
-- 1. Show all customer records
	SELECT * FROM CUSTOMERS;
-- 2. Show total number of customers
	SELECT COUNT(*) FROM CUSTOMERS;
-- 3. Show transactions for Chennai market (market code for chennai is Mark001
	SELECT * FROM TRANSACTIONS WHERE market_code = 'Mark001';
-- 4. Show distrinct product codes that were sold in chennai
	SELECT DISTINCT product_code,market_code FROM TRANSACTIONS WHERE market_code = 'Mark001';
-- 5. Show transactions where currency is US dollars
	SELECT * FROM TRANSACTIONS WHERE  currency = 'USD';
-- 6. Show transactions in 2020 join by date table
	/*SELECT * FROM DATE;
    SELECT * FROM TRANSACTIONS;*/
    SELECT TRANSACTIONS.*
	FROM TRANSACTIONS
	INNER JOIN DATE
	ON DATE.year = YEAR(TRANSACTIONS.order_date)
	WHERE DATE.year = 2020;
-- 7. Show total revenue in year 2020
	SELECT SUM(sales_amount) FROM TRANSACTIONS WHERE year(ORDER_DATE)= '2020';
-- 8.Show total revenue in year 2020, January Month
	SELECT SUM(sales_amount), dt.month_name, dt.year
    FROM transactions as t
    INNER JOIN
    DATE as dt ON t.order_date= dt.date
    where dt.year = '2020' and dt.month_name= 'January';
-- 9. Show total revenue in year 2020 in Chennai.
	SELECT SUM(sales_amount), t.market_code, dt.year
    FROM transactions as t
    INNER JOIN 
    date as dt ON t.order_date= dt.date
    WHERE dt.year='2020' and t.market_code = 'Mark001';
    