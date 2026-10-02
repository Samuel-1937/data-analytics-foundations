-- QUERY 1: Monthly revenue and month-on-month performance
-- Business question:
-- How much revenue was made each month, and how did each month
-- perform compared with the month before it?
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS month,
        SUM(quantity * unit_price) AS total_revenue,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),
monthly_comparison AS (
    SELECT
        month,
        total_revenue,
        total_orders,
        LAG(total_revenue) OVER (ORDER BY month) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    month,
    ROUND(total_revenue::numeric, 2) AS total_revenue,
    total_orders,
    ROUND(previous_month_revenue::numeric, 2) AS previous_month_revenue,
    ROUND(
        ((total_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100)::numeric, 2
    ) AS month_on_month_change_pct
FROM monthly_comparison
ORDER BY month;
-- Business meaning:
-- A positive month_on_month_change_pct means revenue increased
-- from the previous month. A negative value means revenue fell.


-- QUERY 2: Rank products by revenue inside each category
-- Business question:
-- Which products make the most revenue inside their own category?
WITH product_sales AS (
    SELECT
        p.category,
        p.product_id,
        p.product_name,
        SUM(o.quantity * o.unit_price) AS total_revenue
    FROM orders o
    INNER JOIN products p
        ON o.product_id = p.product_id
    GROUP BY p.category, p.product_id, p.product_name
)
SELECT
    category,
    product_id,
    product_name,
    ROUND(total_revenue::numeric, 2) AS total_revenue,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM product_sales
ORDER BY category, revenue_rank, product_id;

-- Business meaning:
-- Rank 1 is the highest-revenue product in that category.
-- The ranking shows which products lead each product group.


-- QUERY 3: Top 3 customers in each region
-- Business question:
-- Who are the three highest-spending customers in each region?
-- This helps management see the strongest customers in every area.
WITH customer_spend AS (
    SELECT
        c.region,
        c.customer_id,
        c.customer_name,
        SUM(o.quantity * o.unit_price) AS total_spend
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.region, c.customer_id, c.customer_name
),
ranked_customers AS (
    SELECT
        region,
        customer_id,
        customer_name,
        total_spend,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY total_spend DESC, customer_id
        ) AS region_rank
    FROM customer_spend
)
SELECT
    region,
    customer_id,
    customer_name,
    ROUND(total_spend::numeric, 2) AS total_spend,
    region_rank
FROM ranked_customers
WHERE region_rank <= 3
ORDER BY region, region_rank;

-- Business meaning:
-- These customers contribute the most revenue in their regions.


-- QUERY 4: Percentage contribution of each category
-- Business question:
-- What percentage of total revenue comes from each product category?
WITH category_sales AS (
    SELECT
        p.category,
        SUM(o.quantity * o.unit_price) AS category_revenue
    FROM orders o
    INNER JOIN products p
        ON o.product_id = p.product_id
    GROUP BY p.category
)
SELECT
    category,
    ROUND(category_revenue::numeric, 2) AS category_revenue,
    ROUND(
        (category_revenue / SUM(category_revenue) OVER () * 100)::numeric,
        2
    ) AS revenue_percentage
FROM category_sales
ORDER BY category_revenue DESC;

-- Business meaning:
-- A larger percentage means that category provides a bigger share
-- of total sales revenue.

-- QUERY 5: Classify customers as High, Medium or Low value
-- Business question:
-- How can customers be grouped by total spend using one clear rule?
-- The average customer spend is used as the benchmark.
-- High   = at least 150% of average customer spend
-- Medium = at least 75% but less than 150% of average
-- Low    = less than 75% of average
WITH customer_spend AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.region,
        SUM(o.quantity * o.unit_price) AS total_spend
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name, c.region
),
customer_benchmark AS (
    SELECT
        *,
        AVG(total_spend) OVER () AS average_customer_spend
    FROM customer_spend
)
SELECT
    customer_id,
    customer_name,
    region,
    ROUND(total_spend::numeric, 2) AS total_spend,
    ROUND(average_customer_spend::numeric, 2) AS average_customer_spend,
    CASE
        WHEN total_spend >= average_customer_spend * 1.50 THEN 'High'
        WHEN total_spend >= average_customer_spend * 0.75 THEN 'Medium'
        ELSE 'Low'
    END AS customer_value_group
FROM customer_benchmark
ORDER BY total_spend DESC;

-- Business meaning:
-- This gives management a simple way to separate customers by value.


-- QUERY 6: Regions below the average regional revenue
-- Business question:
-- Which regions generated less revenue than the average region?
WITH region_sales AS (
    SELECT
        c.region,
        SUM(o.quantity * o.unit_price) AS region_revenue
    FROM orders o
    INNER JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY c.region
)
SELECT
    region,
    ROUND(region_revenue::numeric, 2) AS region_revenue,
    ROUND((SELECT AVG(region_revenue) FROM region_sales)::numeric, 2)
        AS average_region_revenue
FROM region_sales
WHERE region_revenue < (
    SELECT AVG(region_revenue)
    FROM region_sales
)
ORDER BY region_revenue DESC;

-- Business meaning:
-- These regions are below the average regional revenue.

-- QUERY 7: Yearly revenue using EXTRACT
-- Business question:
-- How much revenue was generated in each year?
SELECT
    EXTRACT(YEAR FROM order_date)::int AS sales_year,
    ROUND(SUM(quantity * unit_price)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY sales_year;

-- Business meaning:
-- This makes it easy to compare the years covered by the dataset.

-- QUERY 8: Categories above average category revenue
-- Business question:
-- Which categories generated more revenue than the average category?
SELECT
    p.category,
    ROUND(SUM(o.quantity * o.unit_price)::numeric, 2) AS category_revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.quantity * o.unit_price) > (
    SELECT AVG(category_total)
    FROM (
        SELECT
            SUM(o2.quantity * o2.unit_price) AS category_total
        FROM orders o2
        INNER JOIN products p2
            ON o2.product_id = p2.product_id
        GROUP BY p2.category
    ) category_totals
)
ORDER BY category_revenue DESC;

-- QUERY 9: Check customers with no orders
-- Business question:
-- Are there customers in the customer table who have no matching order?
SELECT
    c.customer_id,
    c.customer_name,
    c.region
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

-- Business meaning:
-- If this returns no rows, every customer has at least one order.