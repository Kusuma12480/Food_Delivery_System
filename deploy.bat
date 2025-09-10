@echo off
echo Restaurant Ordering System - Deployment Script
echo =============================================

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

echo Step 3: Deployment options:
echo.
echo Option A - Deploy to Tomcat:
echo 1. Copy target\restaurant-ordering-system.war to %CATALINA_HOME%\webapps\
echo 2. Start Tomcat: %CATALINA_HOME%\bin\startup.bat
echo 3. Access: http://localhost:8080/restaurant-ordering-system
echo.

echo Option B - Run with Maven Tomcat plugin:
echo 1. Run: mvn tomcat7:run
echo 2. Access: http://localhost:8080/restaurant-ordering-system
echo.

echo Prerequisites:
echo - MySQL server running with restaurant_db database
echo - Java 8+ and Maven installed
echo - Tomcat server (for Option A)
echo.

echo For detailed setup instructions, see SETUP.md
echo.
pause