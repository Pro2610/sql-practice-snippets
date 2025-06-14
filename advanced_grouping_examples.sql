-- Total sales by country and year + subtotal per country + grand total
SELECT country, EXTRACT(YEAR FROM order_date) AS year, SUM(amount) AS total
FROM orders
GROUP BY ROLLUP (country, EXTRACT(YEAR FROM order_date));

-- Sales breakdown for all combinations of country and product
SELECT country, product, SUM(sales) AS total_sales
FROM orders
GROUP BY CUBE (country, product);

-- Specific groupings using GROUPING SETS
SELECT region, category, SUM(sales) AS total
FROM sales
GROUP BY GROUPING SETS (
  (region, category),
  (region),
  (category),
  ()
);


Generates all possible combinations of grouped columns (e.g. cross-tab reports).

sql
Copiar
Editar
SELECT country, product, SUM(sales) AS total_sales
FROM orders
GROUP BY CUBE (country, product);


🧩 GROUPING SETS
Lets you define custom grouping combinations manually.

SELECT region, category, SUM(sales) AS total
FROM sales
GROUP BY GROUPING SETS (
  (region, category),
  (region),
  (category),
  ()
);

