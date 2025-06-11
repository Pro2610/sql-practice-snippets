-- Classify purchases based on amount
SELECT user_id,
       amount,
       CASE 
           WHEN amount >= 100 THEN 'High Value'
           WHEN amount >= 50 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS value_category
FROM purchases;

-- Replace nulls with COALESCE
SELECT user_id,
       COALESCE(phone_number, email, 'No contact') AS contact_method
FROM users;

-- Delivery status based on delivery_date
SELECT order_id,
       delivery_date,
       CASE 
           WHEN delivery_date IS NOT NULL THEN 'Delivered'
           ELSE 'Pending'
       END AS status
FROM orders;

-- Handle missing comments
SELECT order_id,
       COALESCE(comment, 'No comment provided') AS comment_display
FROM orders;
