#!/bin/bash

echo "Restaurant Ordering System - Deployment Script"
echo "============================================="

echo ""
echo "1. Building the project..."
mvn clean package

if [ $? -ne 0 ]; then
    echo "Build failed! Please check the errors above."
    exit 1
fi

echo ""
echo "2. Build successful! WAR file created."
echo ""

echo "3. To deploy to Tomcat:"
echo "   - Copy target/restaurant-ordering-system.war to your Tomcat webapps directory"
echo "   - Start Tomcat server"
echo "   - Access the application at: http://localhost:8080/restaurant-ordering-system/"
echo ""

echo "4. Don't forget to:"
echo "   - Set up MySQL database using database_schema.sql"
echo "   - Update database credentials in DatabaseConnection.java"
echo ""

echo "Deployment script completed!"
