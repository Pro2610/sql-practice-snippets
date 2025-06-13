-- Sort customers by total purchases (descending)
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Get top 5 products by total sales
SELECT product_id, SUM(sales) AS total_sales
FROM products
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

-- Paginate: skip first 10 results, then return next 5
SELECT *
FROM users
ORDER BY created_at DESC
LIMIT 5 OFFSET 10;

-- Combined: Top 3 customers with highest average purchase
SELECT customer_id, AVG(amount) AS avg_purchase
FROM orders
GROUP BY customer_id
ORDER BY avg_purchase DESC
LIMIT 3;

-- Pagination: skip 10, take 5
SELECT *
FROM users
ORDER BY created_at DESC
LIMIT 5 OFFSET 10;
