Create table retail_sales
(
transactions_id INt primary key,
sale_date Date,
sale_time time,
customer_id int,
gender varchar(10),
age int,
category varchar(35),
quantity int,
price_per_unit float,
cogs float,
total_sale float);

select * from retail_sales
Limit 10;

select count(*) from retail_sales;

-- Data Cleaning

-- To check NULL Values

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date IS NULL OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantity IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL
        OR total_sale IS NULL;
        
-- Data Exploration

-- How many sales we have?

select count(*) as total from retail_sales;

-- How many unique customers we have?

select count(distinct(customer_id)) as total_customers from retail_sales;

-- How many category are there?

select distinct category from retail_sales;

-- DATA ANALYSIS

-- Q1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'.

select * from retail_sales
where sale_date ='2022-11-05';

-- Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**.

SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'Clothing'
        AND MONTH(sale_date) = 11
        AND YEAR(sale_date) = 2022
        AND quantity >= 4;

-- Q3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category, SUM(total_sale) AS total_sales
FROM
    retail_sales
GROUP BY category;

-- Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
    ROUND(AVG(age), 2) AS avg_age
FROM
    retail_sales
WHERE
    category = 'Beauty';
 
 -- Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
 
 SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > 1000;
 
 -- Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
 
SELECT 
    COUNT(*) AS total, gender, category
FROM
    retail_sales
GROUP BY gender , category;

-- Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

select * from 
(
select Round(avg(total_sale),2) as avg_sale, month(sale_date) as month, year(sale_date) as year,
rank () over (partition by year(sale_date) order by Round(avg(total_sale),2) desc) as rnk 
from retail_sales
group by month, year) as t1
where rnk =1;

-- Q8 Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT 
    customer_id, SUM(total_sale) AS highest_sale
FROM
    retail_sales
GROUP BY customer_id
ORDER BY highest_sale DESC
LIMIT 5;

-- Q9 Write a SQL query to find the number of unique customers who purchased items from each category.

select count(Distinct(customer_id)) as number, category from retail_sales
group by category;

-- Q10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

with hourly_sale
as 
(
select *,
 case
        when extract(hour from sale_time) < 12 then 'Morning'
        when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
		Else 'Evening'
		End as shift 
from retail_sales      
)
select 
 shift,
 count(*) as total_orders
from hourly_sale
group by shift;

-- End of Project
    
    
    





        


