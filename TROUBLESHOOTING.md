# 🚨 Menu Not Visible - Troubleshooting Guide

## Quick Diagnosis Steps

### Step 1: Check XAMPP MySQL
1. **Open XAMPP Control Panel**
2. **Start MySQL** service (should be green)
3. **Open phpMyAdmin**: http://localhost/phpmyadmin
4. **Check if `restaurant_db` database exists**
5. **Check if `menu` table exists and has data**

### Step 2: Verify Database Setup
Run this SQL in phpMyAdmin:
```sql
USE restaurant_db;
SELECT COUNT(*) as menu_count FROM menu;
SELECT * FROM menu;
```

**Expected Result**: Should show 6 menu items (Pizza, Burger, Pasta, Coffee, Salad, Sandwich)

### Step 3: Test Menu API Directly
1. **Start the application**: `mvn tomcat7:run-war`
2. **Open**: http://localhost:8080/restaurant-ordering-system/test-menu-simple.html
3. **Click "Test Menu API"**
4. **Check the results**

### Step 4: Check Browser Console
1. **Open main app**: http://localhost:8080/restaurant-ordering-system
2. **Login** with: `admin@restaurant.com` / `admin123`
3. **Click "View Menu"**
4. **Press F12** to open browser console
5. **Look for error messages**

## Common Issues & Solutions

### Issue 1: Database Not Set Up
**Symptoms**: No database or empty tables
**Solution**:
1. Import `database_schema.sql` in phpMyAdmin
2. Or run the SQL commands manually

### Issue 2: XAMPP MySQL Not Running
**Symptoms**: Connection errors
**Solution**:
1. Start MySQL in XAMPP Control Panel
2. Check if port 3306 is available

### Issue 3: Application Not Running
**Symptoms**: 404 errors or connection refused
**Solution**:
1. Run: `mvn tomcat7:run-war`
2. Wait for "Tomcat started" message
3. Check if port 8080 is available

### Issue 4: Browser Cache
**Symptoms**: Old JavaScript code running
**Solution**:
1. Clear browser cache (Ctrl+F5)
2. Or open in incognito/private mode

### Issue 5: Wrong URL
**Symptoms**: API calls failing
**Solution**:
1. Make sure you're accessing: http://localhost:8080/restaurant-ordering-system
2. Not: http://localhost:8080/

## Manual Database Setup

If the database is missing, run these commands in phpMyAdmin:

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

-- Create menu table
CREATE TABLE menu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert menu items
INSERT INTO menu (name, price) VALUES
('Pizza', 200.00),
('Burger', 120.00),
('Pasta', 150.00),
('Coffee', 50.00),
('Salad', 80.00),
('Sandwich', 100.00);

-- Create users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample users
INSERT INTO users (name, email, password) VALUES
('John Doe', 'john@example.com', '1234'),
('Alice Smith', 'alice@example.com', '5678'),
('Admin User', 'admin@restaurant.com', 'admin123');

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDING','CONFIRMED','DELIVERED') DEFAULT 'PENDING',
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create order_details table
CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menu(id) ON DELETE CASCADE
);
```

## Test URLs

- **Main App**: http://localhost:8080/restaurant-ordering-system
- **Simple Menu Test**: http://localhost:8080/restaurant-ordering-system/test-menu-simple.html
- **Functionality Test**: http://localhost:8080/restaurant-ordering-system/test-functionality.html
- **Debug Menu**: http://localhost:8080/restaurant-ordering-system/debug-menu.html
- **phpMyAdmin**: http://localhost/phpmyadmin

## Expected Results

### Menu API Response
```json
{
  "status": "success",
  "menu": [
    {"id": 1, "name": "Pizza", "price": 200.00, "createdAt": "..."},
    {"id": 2, "name": "Burger", "price": 120.00, "createdAt": "..."},
    {"id": 3, "name": "Pasta", "price": 150.00, "createdAt": "..."},
    {"id": 4, "name": "Coffee", "price": 50.00, "createdAt": "..."},
    {"id": 5, "name": "Salad", "price": 80.00, "createdAt": "..."},
    {"id": 6, "name": "Sandwich", "price": 100.00, "createdAt": "..."}
  ],
  "count": 6
}
```

## Still Having Issues?

1. **Check XAMPP logs** in `C:\xampp\mysql\data\`
2. **Check Tomcat logs** in the terminal where you ran `mvn tomcat7:run-war`
3. **Try restarting** XAMPP and the application
4. **Verify ports** 3306 (MySQL) and 8080 (Tomcat) are not in use by other applications
