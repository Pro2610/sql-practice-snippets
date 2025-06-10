
# SQL Snippets – JOIN Examples

This file contains essential SQL JOIN examples with comments in Portuguese for bilingual understanding.

Covered JOIN types:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- MySQL FULL JOIN workaround using UNION

Each query includes real-world logic for practicing JOINs in relational databases.

## 🔄 JOIN Types Explained

| JOIN Type        | Resultado em PT (Português)                           | Result in EN (English)                      |
|------------------|-------------------------------------------------------|---------------------------------------------|
| INNER JOIN       | Apenas registros que existem em ambas as tabelas     | Only matching rows from both tables         |
| LEFT JOIN        | Tudo da tabela da esquerda + casamentos da direita   | All from the left + matched from right      |
| RIGHT JOIN       | Tudo da tabela da direita + casamentos da esquerda   | All from the right + matched from left      |
| FULL OUTER JOIN  | Tudo de ambos os lados                                | All records from both sides                 |

✅ Atalhos de memória:
- INNER = interseção dos dados
- LEFT = tudo da esquerda + o que casar na direita
- RIGHT = tudo da direita + o que casar na esquerda
- FULL = tudo de ambos os lados

---
## 🪟 Window Functions

Window functions allow you to perform calculations across a set of table rows that are somehow related to the current row — **without grouping** the data.

📌 Key functions include:
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- `SUM() OVER`, `AVG() OVER`
- `LAG()`, `LEAD()`
- `PARTITION BY`, `ORDER BY` inside window frames

---

### 🔍 Examples

```sql
-- Number purchases per user in order
SELECT user_id, purchase_date,
       ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY purchase_date) AS purchase_rank
FROM purchases;
