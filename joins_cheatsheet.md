# 🧩 SQL JOIN Cheat Sheet

Este guia rápido resume os principais tipos de JOIN em SQL com exemplos e quando utilizá-los.

---

## 🔹 1. INNER JOIN

🎯 Retorna apenas os registros que têm correspondência nas duas tabelas.

```sql
SELECT c.customer_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

🟢 Quando usar: quando você precisa apenas dos dados relacionados nas duas tabelas.

## 🔹 2. LEFT JOIN
🎯 Retorna todos os registros da tabela da esquerda e os correspondentes da direita (se houver).

SELECT c.customer_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

🟡 Quando usar: para encontrar registros da esquerda mesmo sem correspondência na direita (ex: clientes sem pedidos).

##  🔹 3. RIGHT JOIN
🎯 Retorna todos os registros da tabela da direita e os correspondentes da esquerda.

SELECT c.customer_name, o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

🔵 Quando usar: quando você quer manter todos os registros da tabela da direita (ex: todos os pedidos, com ou sem cliente associado).

## 🔹 4. FULL OUTER JOIN
🎯 Retorna todos os registros de ambas as tabelas. Onde não há correspondência, preenche com NULL.

SELECT c.customer_name, o.order_date
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

🟠 Quando usar: quando você quer ver tudo — correspondências e não correspondências de ambos os lados.

⚠️ Alguns bancos como MySQL não suportam diretamente. Alternativa:

SELECT c.customer_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

🧠 Dica extra: Visual de comparação

Tipo de JOIN                   	Inclui registros sem correspondência?	                 Lado esquerdo	                        Lado direito
INNER JOIN                              	❌ Não                                           ✅	                                  ✅
LEFT JOIN	                             ✅ Sim (esquerda)	                                  ✅	                                  ❌
RIGHT JOIN	                           ✅ Sim (direita)                                   	❌	                                  ✅
FULL OUTER JOIN	                       ✅ Sim (ambos os lados)	                            ✅	                                  ✅

📌 Resumo rápido:

INNER = interseção

LEFT = tudo da esquerda + o que casar na direita

RIGHT = tudo da direita + o que casar na esquerda

FULL = tudo de ambos os lados
