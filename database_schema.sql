-- Restaurant Ordering System Database Schema
-- Create database
CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Menu table
CREATE TABLE menu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDING','CONFIRMED','DELIVERED') DEFAULT 'PENDING',
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Order details table
CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menu(id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO users (name, email, password) VALUES
('John Doe', 'john@example.com', '1234'),
('Alice Smith', 'alice@example.com', '5678'),
('Admin User', 'admin@restaurant.com', 'admin123');

INSERT INTO menu (name, price, image_url) VALUES
('Pizza', 200.00, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop'),
('Burger', 120.00, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop'),
('Pasta', 150.00, 'https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=400&h=300&fit=crop'),
('Coffee', 50.00, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=300&fit=crop'),
('Salad', 80.00, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=300&fit=crop'),
('Sandwich', 100.00, 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?w=400&h=300&fit=crop');

-- Insert sample order
INSERT INTO orders (user_id, order_date, status, total_amount) VALUES
(1, '2025-09-05 10:00:00', 'CONFIRMED', 450.00);

-- Insert sample order details
INSERT INTO order_details (order_id, menu_id, quantity, price) VALUES
(1, 1, 2, 200.00),  -- 2 Pizzas
(1, 4, 1, 50.00);   -- 1 Coffee
