-- Return the first available contact method
SELECT user_id,
       COALESCE(phone_number, email, 'No contact') AS contact_method
FROM users;

-- Replace null comments with default message
SELECT order_id,
       COALESCE(comment, 'No comment provided') AS comment_display
FROM orders;

-- Prioritize discount value if exists, fallback to general discount
SELECT product_id,
       COALESCE(customer_discount, general_discount, 0) AS final_discount
FROM products;

-- Show most recent update (prefer updated_at, then created_at)
SELECT id,
       COALESCE(updated_at, created_at) AS last_modified
FROM records;

-- Replace NULLs in numeric calculations
SELECT user_id,
       COALESCE(reward_points, 0) + 100 AS bonus_applied
FROM loyalty;
