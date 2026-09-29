-- 1. How many orders are in the data?
select count(*) as total_orders from sales_data;

-- 2. What is total revenue?
select round(sum(total_revenue), 2) as total_revenue from sales_data;

-- 3. How many unique customers are there?
select count(distinct customer_id) as unique_customers from sales_data;

-- 4. What is the average order value?
select round(avg(total_revenue), 2) as AOV from sales_data;

-- 5. Which five products generate the most revenue?
select product, sum(total_revenue) as product_revenue
from sales_data
group by product
order by product_revenue desc
limit 5;

-- 6. What is revenue by region?
select region, sum(total_revenue) as region_revenue
from sales_data
group by region
order by region_revenue desc;

-- 7. What is revenue by category?
select category, sum(total_revenue) as category_revenue
from sales_data
group by category
order by category_revenue desc;

-- 8. How does revenue change by month?
select to_char(order_date, 'yyyy-mm') as sales_month,
	   round(sum(total_revenue), 2) as monthly_revenue
from sales_data 
group by to_char(order_date, 'yyyy-mm')
order by sales_month asc;

-- 9. Which salesperson generates the most revenue?
select salesperson, round(sum(total_revenue), 2) as salesperson_revenue
from sales_data
group by salesperson
order by salesperson_revenue desc
limit 1;

-- 10. Which customers spend the most?
select customer_id, customer_name, round(sum(total_revenue), 2) as total_spent
from sales_data
group by customer_id, customer_name
order by total_spent desc
limit 10;

-- 11. Which categories exceed a chosen revenue threshold?
select category, round(sum(total_revenue), 2) as category_revenue
from sales_data
group by category
having sum(total_revenue) > 50000
order by category_revenue desc;

-- 12. What is the average quantity of items purchased per transaction across our different product categories?
select category, round(avg(quantity), 2) as avg_unit_per_order
from sales_data
group by category
order by avg_unit_per_order desc;
