-- 🔗 Exemplo de INNER JOIN: retorna apenas registros com correspondência nas duas tabelas
SELECT c.customer_id, c.customer_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 🔗 Exemplo de LEFT JOIN: retorna todos os clientes, mesmo que não tenham pedidos
SELECT c.customer_id, c.customer_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 🔗 Exemplo de RIGHT JOIN: retorna todos os pedidos, mesmo que não saibamos quem é o cliente
SELECT c.customer_id, c.customer_name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- 🔗 Exemplo de FULL JOIN: retorna todos os registros de ambas as tabelas, com ou sem correspondência
SELECT c.customer_id, o.order_id
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

-- ⚠️ Observação:
-- Alguns bancos de dados como MySQL não suportam FULL JOIN diretamente.
-- Pode-se simular com UNION:

-- Simulação de FULL JOIN no MySQL:
SELECT c.customer_id, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
