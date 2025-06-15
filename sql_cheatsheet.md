# 🧾 SQL Cheatsheet — Full Version

A complete reference of essential SQL syntax, functions, logic, and patterns — perfect for practice, interviews, and day-to-day analysis.

---

## 1. 🔹 SELECT Basics

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column ASC|DESC
LIMIT n OFFSET m;

Aggregations + GROUP BY
Aggregate functions: COUNT(), SUM(), AVG(), MIN(), MAX()

SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 10;

JOINs

-- INNER JOIN
SELECT a.id, b.name
FROM table_a a
JOIN table_b b ON a.id = b.a_id;

-- LEFT JOIN
SELECT a.id, b.name
FROM table_a a
LEFT JOIN table_b b ON a.id = b.a_id;

-- FULL JOIN (some DBs use UNION)
SELECT * FROM table_a
FULL OUTER JOIN table_b ON table_a.id = table_b.a_id;

-- RIGHT JOIN
SELECT a.id, b.name
FROM table_a a
RIGHT JOIN table_b b ON a.id = b.a_id;

Window Functions
sql
Copiar
Editar
-- Number rows per group
SELECT user_id,
       ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp) AS row_num
FROM logins;

-- Running total
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS running_total
FROM orders;
📌 Also: RANK(), DENSE_RANK(), LAG(), LEAD()


CASE WHEN / COALESCE
sql
Copiar
Editar
-- CASE WHEN
SELECT amount,
       CASE 
         WHEN amount > 100 THEN 'High'
         WHEN amount > 50 THEN 'Medium'
         ELSE 'Low'
       END AS tier
FROM sales;

-- COALESCE (return first non-null)
SELECT COALESCE(phone, email, 'No contact') AS contact
FROM users;

Advanced GROUPING
sql
Copiar
Editar
-- ROLLUP: adds subtotal and grand total
SELECT category, subcategory, SUM(sales)
FROM products
GROUP BY ROLLUP (category, subcategory);

-- CUBE: all combinations
SELECT region, product, SUM(sales)
FROM sales
GROUP BY CUBE (region, product);

-- GROUPING SETS: custom breakdowns
SELECT region, category, SUM(sales)
FROM sales
GROUP BY GROUPING SETS (
  (region, category),
  (region),
  (category),
  ()
);

CTE (WITH) + Subqueries
sql
Copiar
Editar
-- CTE
WITH recent_orders AS (
  SELECT * FROM orders WHERE order_date > CURRENT_DATE - INTERVAL '30 days'
)
SELECT customer_id, COUNT(*) FROM recent_orders GROUP BY customer_id;

-- Subquery in WHERE
SELECT name FROM users
WHERE id IN (
  SELECT user_id FROM logins WHERE login_date > CURRENT_DATE - 7
);

Set Logic & Existence
sql
Copiar
Editar
-- UNION: combine results
SELECT email FROM users_us
UNION
SELECT email FROM users_eu;

-- EXCEPT
SELECT name FROM table1
EXCEPT
SELECT name FROM table2;

-- EXISTS
SELECT name FROM customers c
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.customer_id = c.id
);

📌 BONUS: NULL Handling
IS NULL, IS NOT NULL

COALESCE() for fallback values

NULLIF() for conditional nulls

🔎 Tip: Query Execution Order
FROM

JOIN

WHERE

GROUP BY

HAVING

SELECT

ORDER BY

LIMIT

✅ Practice ideas
 JOINs with conditions

 Subqueries inside SELECT

 Aggregation with HAVING

 Use of ROW_NUMBER() or RANK()

 Build a dashboard query using ROLLUP or GROUPING SETS

