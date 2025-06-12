-- Total purchases per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Total sales per month
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month;

-- Filter groups with HAVING (e.g. customers with more than 5 orders)
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- Average order value per country, only where avg > 100
SELECT country, AVG(order_value) AS avg_value
FROM orders
GROUP BY country
HAVING AVG(order_value) > 100;

-- Filter: only customers with more than 5 orders
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- Group sales by month
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS monthly_sales
FROM orders
GROUP BY month;

-- Average order value per country above 100
SELECT country, AVG(order_value) AS avg_value
FROM orders
GROUP BY country
HAVING AVG(order_value) > 100;
