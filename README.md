
# 📘 SQL Practice Snippets

This repository contains practical SQL snippets with clear examples and bilingual explanations (English + Portuguese when helpful).  
It’s designed for quick reference, daily practice, and interview prep.

---

## 📚 Contents

- [JOIN Examples](#join-examples)
- [Window Functions](#window-functions)


---

## 🔗 JOIN Examples

This section contains essential SQL JOIN types with examples and bilingual comments.

📘 Covered JOIN types:
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- MySQL-style FULL JOIN using `UNION`

### 🔍 Summary Table

| JOIN Type        | Português (PT)                                         | English                                      |
|------------------|--------------------------------------------------------|----------------------------------------------|
| INNER JOIN       | Apenas registros que existem em ambas as tabelas      | Only matching rows from both tables          |
| LEFT JOIN        | Tudo da esquerda + casamentos da direita              | All from left + matched from right           |
| RIGHT JOIN       | Tudo da direita + casamentos da esquerda              | All from right + matched from left           |
| FULL OUTER JOIN  | Tudo de ambos os lados                                 | All records from both sides                  |

✅ Memory shortcuts:
- **INNER** = interseção
- **LEFT** = tudo da esquerda + matching da direita
- **RIGHT** = tudo da direita + matching da esquerda
- **FULL** = todos os dados de ambos os lados

🪟 Window Functions

Window functions allow you to perform calculations across a set of rows that are related to the current row — without grouping the data.

📌 Key functions:

ROW_NUMBER(), RANK(), DENSE_RANK()

SUM() OVER, AVG() OVER

LAG(), LEAD()

PARTITION BY, ORDER BY inside window frames

🔍 Examples

-- Number purchases per user
SELECT user_id, purchase_date,
       ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY purchase_date) AS purchase_rank
FROM purchases;

-- Running total of monthly sales
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS monthly_sales,
       SUM(amount) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS running_total
FROM orders;

🧩 CASE WHEN and COALESCE
These tools are essential for adding logic and handling nulls directly in your SQL queries.

🔍 What is CASE WHEN?

It works like an IF / ELSE structure, directly in SQL.

SELECT user_id,
       amount,
       CASE 
           WHEN amount >= 100 THEN 'High Value'
           WHEN amount >= 50 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS value_category
FROM purchases;

📌 Use cases:

Labeling values

Creating conditional columns

Customizing outputs in reports

🔄 What is COALESCE()?

COALESCE() returns the firstnon-null value from a list of columns or expressions.

SELECT user_id,
       COALESCE(phone_number, email, 'No contact') AS contact_method
FROM users;

📌 Use cases:

Handling missing data

Setting default values

Replacing NULLs in results

## 📊 GROUP BY and HAVING

`GROUP BY` is used to group rows based on the value of one or more columns.  
`HAVING` is used to filter **aggregated results** (unlike `WHERE`, which filters rows).

---

## 🔽 ORDER BY, LIMIT, OFFSET

Use these to control sorting and pagination in your SQL queries.

---

## 🧮 ROLLUP, CUBE, GROUPING SETS

These advanced grouping options allow you to create **subtotals**, **grand totals**, and **multi-dimensional aggregations** in a single query.

---

### 🔁 ROLLUP

Adds hierarchical subtotals (e.g. per year → per country → grand total).


