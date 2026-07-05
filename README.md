# Retail Sales SQL Analysis

## Overview
This project uses SQL to clean, explore, and analyze a retail sales dataset. It demonstrates data cleaning, exploratory data analysis (EDA), and business-focused querying — including customer behavior, category performance, and time-based sales trends.

## Objectives
- Set up a retail sales database and validate data quality
- Explore the dataset's key dimensions (customers, categories, transactions)
- Answer business questions using SQL (sales trends, top customers, shift-wise order volume, etc.)

## Dataset
The `retail_sales` table includes:
- `transactions_id`, `sale_date`, `sale_time`
- `customer_id`, `gender`, `age`
- `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`

## Data Cleaning
Checked for and handled NULL values across all key columns to ensure data integrity before analysis.

## Business Questions Answered
1. Retrieve all sales made on a specific date
2. Find high-quantity Clothing transactions in a given month
3. Calculate total sales per category
4. Find average customer age for a specific category
5. Identify high-value transactions (> 1000)
6. Count transactions by gender and category
7. Calculate average monthly sales and identify the best-selling month per year
8. Find the top 5 customers by total sales
9. Count unique customers per category
10. Segment orders into Morning / Afternoon / Evening shifts and count orders per shift

## Skills Demonstrated
- SQL data cleaning and validation
- Aggregate functions (`SUM`, `AVG`, `COUNT`)
- Window functions (`RANK() OVER (PARTITION BY ...)`)
- `CASE` statements for custom segmentation (shift analysis)
- Common Table Expressions (CTEs)
- Date/time functions (`MONTH()`, `YEAR()`, `EXTRACT()`)

## How to Use
1. Run the `CREATE TABLE` statement to set up the schema
2. Load your retail sales data into the table
3. Run the queries in order, or jump to any specific business question

## Author
Gaurav — Operations professional transitioning into data-driven roles, building SQL skills for billing, order-to-cash, and analytics work.
