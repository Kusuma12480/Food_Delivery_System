-- Check if database and tables exist
SHOW DATABASES;
USE restaurant_db;
SHOW TABLES;

-- Check if menu table has data
SELECT COUNT(*) as menu_count FROM menu;
SELECT * FROM menu;

-- Check if users table has data
SELECT COUNT(*) as user_count FROM users;
SELECT * FROM users;

-- Check if orders table has data
SELECT COUNT(*) as order_count FROM orders;
SELECT * FROM orders;
