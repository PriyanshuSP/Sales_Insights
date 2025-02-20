# Sales Insights: Uncovering Trends with SQL & Power BI 

## Project Overview

**Project Title**: Sales Insights.

**Database**: `db_dump.sql`

## Objectives

1. **Set up a retail sales database**: Create and populate a sales database with the provided data.
2. **Data Cleaning & ETL**: Identify and remove any records with missing or null values.
3. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.
4. **Data Visualization**: Deriving visual insights from the loaded data for better analysis.

## Project Structure

### 1. Database Setup
- **Database Creation**: The project starts by importing a database dump to MySQL named `db_dump.sql`.

### 2. Data Exploration & Cleaning
- **Record Count**: Determining the total number of records in the dataset.
- **Customer Count**: Finding out how many unique customers are in the dataset.
- **Category Count**: Identifying all unique product categories in the dataset.
- **Null Value Check**: Checking for any null values in the dataset and delete records with missing data.

### 3. Data Analysis & Findings
The following SQL queries were developed to answer specific business questions:

**1. Show all customer records**
```sql
 SELECT * FROM CUSTOMERS;
```
**2. Show total number of customers**
```sql
 SELECT COUNT(*) FROM CUSTOMERS;
```
**3. Show transactions for Chennai market (market code for chennai is Mark001**
```sql
 SELECT * FROM TRANSACTIONS WHERE market_code = 'Mark001';
```
**4. Show distrinct product codes that were sold in chennai**
```sql
 SELECT DISTINCT product_code,market_code FROM TRANSACTIONS WHERE market_code = 'Mark001';
```
**5. Show transactions where currency is US dollars**
```sql
 SELECT * FROM TRANSACTIONS WHERE  currency = 'USD';
```
**6. Show transactions in 2020 join by date table**
```sql
 SELECT TRANSACTIONS.*
    FROM TRANSACTIONS
    INNER JOIN DATE
    ON DATE.year = YEAR(TRANSACTIONS.order_date)
    WHERE DATE.year = 2020;
```
**7. Show total revenue in year 2020**
```sql
 SELECT SUM(sales_amount) FROM TRANSACTIONS WHERE year(ORDER_DATE)= '2020';
```
**8.Show total revenue in year 2020, January Month**
```sql
SELECT SUM(sales_amount), dt.month_name, dt.year
    FROM transactions as t
    INNER JOIN
    DATE as dt ON t.order_date= dt.date
    where dt.year = '2020' and dt.month_name= 'January';
```
**9. Show total revenue in year 2020 in Chennai.**
```sql
 SELECT SUM(sales_amount), t.market_code, dt.year
    FROM transactions as t
    INNER JOIN 
    date as dt ON t.order_date= dt.date
    WHERE dt.year='2020' and t.market_code = 'Mark001';
```
## Dashboard
![dashboard image](https://github.com/user-attachments/assets/4f0ca663-f1c9-4d7d-bd2a-120791f720ee)


## Findings
- **Market Focus**: Chennai is a significant market, contributing substantially to the overall revenue. Consider increasing marketing efforts or expanding product offerings in this region.

- **Seasonal Trends**: The revenue in January 2020 was [insert insights], indicating potential seasonal trends. Investigate further to identify opportunities for targeted promotions during peak months.

- **Currency Impact**: Transactions in USD suggest international sales. Analyze these transactions to understand their impact on revenue and explore opportunities for expanding global reach.

- **Product Performance**: The distinct products sold in Chennai (from Query 4) indicate customer preferences in this market. Use this data to optimize inventory and marketing strategies.

- **Revenue Growth Opportunities**: The total revenue for 2020 provides a benchmark for future growth. Identify underperforming markets or products and develop strategies to improve their performance.

## Conclusion

The analysis reveals key trends and opportunities for growth, particularly in the Chennai market and international sales. By leveraging these insights, the company can optimize its sales strategy, focus on high-performing markets, and explore new opportunities for revenue growth. Further analysis, such as customer segmentation and product performance by region, can provide deeper insights for strategic decision-making.

