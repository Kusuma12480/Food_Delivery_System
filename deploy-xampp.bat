@echo off
echo Restaurant Ordering System - XAMPP Deployment Script
echo ==================================================

echo.
echo Checking XAMPP MySQL service...
sc query mysql >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo WARNING: MySQL service not found. Please start XAMPP MySQL manually.
    echo Open XAMPP Control Panel and start MySQL service.
    echo.
    pause
)

echo.
echo Step 1: Building the application...
call mvn clean package -DskipTests

if %ERRORLEVEL% neq 0 (
    echo Build failed! Please check the errors above.
    pause
    exit /b 1
)

echo.
echo Step 2: Build successful! WAR file created at target\restaurant-ordering-system.war
echo.

echo Step 3: XAMPP Setup Instructions:
echo.
echo 1. Start XAMPP Control Panel
echo 2. Start MySQL service
echo 3. Open phpMyAdmin: http://localhost/phpmyadmin
echo 4. Create database 'restaurant_db'
echo 5. Import database_schema.sql file
echo.

echo Step 4: Deployment options:
echo.
echo Option A - Deploy to Tomcat:
echo 1. Download and install Tomcat
echo 2. Copy target\restaurant-ordering-system.war to Tomcat webapps folder
echo 3. Start Tomcat
echo 4. Access: http://localhost:8080/restaurant-ordering-system
echo.

echo Option B - Run with Maven Tomcat plugin:
echo 1. Run: mvn tomcat7:run-war
echo 2. Access: http://localhost:8080/restaurant-ordering-system
echo.

echo XAMPP Configuration:
echo - MySQL Host: localhost:3306
echo - Username: root
echo - Password: (empty)
echo - Database: restaurant_db
echo.

echo Sample Users:
echo - Admin: admin@restaurant.com / admin123
echo - Customer: john@example.com / 1234
echo - Customer: alice@example.com / 5678
echo.

echo For detailed XAMPP setup instructions, see XAMPP_SETUP.md
echo.
pause
