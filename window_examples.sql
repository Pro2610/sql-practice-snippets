# SQL Snippets – Window Functions Examples

Este arquivo contém exemplos essenciais de **funções de janela** (Window Functions) com explicações em **português** e **inglês**.

📘 **Funções abordadas:**
- `ROW_NUMBER()`
- `RANK()` e `DENSE_RANK()`
- `SUM() OVER`
- `LAG()` e `LEAD()`
- Uso de `PARTITION BY` e `ORDER BY` com janela

Cada exemplo tem aplicação prática comum em análise de dados.

---

## 🔍 O que são Window Functions?

💡 **Definição simples:**  
As funções de janela permitem calcular valores agregados, rankings e comparações entre linhas **sem agrupar os dados**, mantendo o detalhe por linha.

---

## 📊 Exemplos rápidos

```sql
-- Exemplo 1: Numerar compras por usuário
SELECT user_id, purchase_date,
       ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY purchase_date) AS purchase_rank
FROM purchases;

-- Exemplo 2: Total acumulado de vendas por mês
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS total,
       SUM(amount) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS running_total
FROM orders;

🧠 Diferença entre ROW_NUMBER, RANK e DENSE_RANK
  
Função	Gaps em empates?	                              Explicação
ROW_NUMBER()	                                          ✅ Sim	Cada linha recebe um número único
RANK()	                                                ✅ Sim	Empates recebem o mesmo rank, com gaps
DENSE_RANK()	                                          ❌ Não	Empates recebem o mesmo rank, sem gaps
