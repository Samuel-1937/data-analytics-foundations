-- 1. Which customers generate the most revenue?
SELECT 
    c.customer_name, 
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 2. Which products perform best in each region?
WITH RegionProductSales AS (
    SELECT 
        c.region, 
        p.product_name, 
        SUM(o.quantity * p.unit_price) AS total_revenue,
        RANK() OVER(PARTITION BY c.region ORDER BY SUM(o.quantity * p.unit_price) DESC) as rank
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    INNER JOIN products p ON o.product_id = p.product_id
    GROUP BY c.region, p.product_name
)
SELECT region, product_name, total_revenue 
FROM RegionProductSales 
WHERE rank = 1;

-- 3. What is monthly revenue by category?
SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM') AS order_month, 
    p.category, 
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM'), p.category
ORDER BY order_month, total_revenue DESC;

-- 4. Are there customers with no orders?
SELECT 
    c.customer_id, 
    c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 5. Which categories contribute most to revenue?
SELECT 
    p.category, 
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 6. Are there noticeable customer purchasing patterns? (Monthly Sales Trend)
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS order_month, 
    COUNT(DISTINCT customer_id) AS active_customers,
    SUM(quantity) as total_items_bought
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY order_month;

-- 7. Is revenue heavily concentrated in particular regions or products?
SELECT 
    c.region, 
    SUM(o.quantity * p.unit_price) AS regional_revenue,
    (SUM(o.quantity * p.unit_price) / (SELECT SUM(quantity * p2.unit_price) FROM orders o2 JOIN products p2 ON o2.product_id = p2.product_id)) * 100 AS percentage_of_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY c.region
ORDER BY regional_revenue DESC;

-- ADDITIONAL QUESTION
-- 1: Who is the top-performing salesperson by region?
WITH SalespersonRegion AS (
    SELECT 
        c.region, 
        o.salesperson, 
        SUM(o.quantity * p.unit_price) AS total_revenue,
        RANK() OVER(PARTITION BY c.region ORDER BY SUM(o.quantity * p.unit_price) DESC) as rank
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    INNER JOIN products p ON o.product_id = p.product_id
    GROUP BY c.region, o.salesperson
)
SELECT region, salesperson, total_revenue 
FROM SalespersonRegion 
WHERE rank = 1;

-- 2: What is the Average Order Value (AOV) by category?
SELECT 
    p.category, 
    SUM(o.quantity * p.unit_price) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY average_order_value DESC;