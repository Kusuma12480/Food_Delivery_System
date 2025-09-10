# Restaurant Ordering System - XAMPP Setup Guide

## Prerequisites

1. **XAMPP** - Download and install from https://www.apachefriends.org/
2. **Java 8 or higher** - Make sure Java is installed and JAVA_HOME is set
3. **Maven 3.9.11** - For building the project (verified compatible)
4. **Apache Tomcat 9.0+** - Download separately (XAMPP doesn't include Tomcat)

## XAMPP Setup

### Step 1: Install and Start XAMPP

1. **Download XAMPP** from https://www.apachefriends.org/
2. **Install XAMPP** (typically to `C:\xampp\`)
3. **Start XAMPP Control Panel**
4. **Start MySQL** service in XAMPP Control Panel
5. **Start Apache** service (optional, for phpMyAdmin)

### Step 2: Database Setup

1. **Open phpMyAdmin**:
   - Go to `http://localhost/phpmyadmin`
   - Or click "Admin" button next to MySQL in XAMPP Control Panel

2. **Create Database**:
   - Click "New" in the left sidebar
   - Database name: `restaurant_db`
   - Collation: `utf8mb4_general_ci`
   - Click "Create"

3. **Import Database Schema**:
   - Select the `restaurant_db` database
   - Click "Import" tab
   - Choose file: `database_schema.sql` from your project directory
   - Click "Go"

4. **Verify Data**:
   - Check that tables are created: `users`, `menu`, `orders`, `order_details`
   - Verify sample data is inserted

### Step 3: Database Configuration

The application is pre-configured for XAMPP MySQL:
- **Host**: localhost
- **Port**: 3306 (default XAMPP MySQL port)
- **Username**: root
- **Password**: (empty - XAMPP default)
- **Database**: restaurant_db

## Building the Application

1. **Navigate to project directory**:
   ```bash
   cd C:\Users\Argha\Downloads\java
   ```

2. **Build the application**:
   ```bash
   mvn clean package -DskipTests
   ```

## Deployment Options

### Option 1: Deploy to Tomcat (Recommended)

1. **Download Tomcat** from https://tomcat.apache.org/
2. **Extract Tomcat** to a directory (e.g., `C:\tomcat\`)
3. **Copy WAR file**:
   ```bash
   copy target\restaurant-ordering-system.war C:\tomcat\webapps\
   ```
4. **Start Tomcat**:
   ```bash
   C:\tomcat\bin\startup.bat
   ```
5. **Access application**:
   ```
   http://localhost:8080/restaurant-ordering-system
   ```

### Option 2: Use Maven Tomcat Plugin

1. **Tomcat plugin** is already configured in pom.xml
2. **Run application**:
   ```bash
   mvn tomcat7:run-war
   ```
3. **Access application**:
   ```
   http://localhost:8080/restaurant-ordering-system
   ```

## XAMPP Services

### Required Services
- **MySQL** - Must be running for database access
- **Apache** - Optional, only needed for phpMyAdmin

### Service Management
- **Start/Stop**: Use XAMPP Control Panel
- **Ports**: 
  - MySQL: 3306
  - Apache: 80 (if using phpMyAdmin)
  - Tomcat: 8080

## Sample Users

The database includes these test users:
- **Admin**: admin@restaurant.com / admin123
- **Customer**: john@example.com / 1234
- **Customer**: alice@example.com / 5678

## Troubleshooting

### Common XAMPP Issues

1. **MySQL Won't Start**:
   - Check if port 3306 is already in use
   - Run XAMPP as Administrator
   - Check XAMPP logs in `C:\xampp\mysql\data\`

2. **Database Connection Error**:
   - Verify MySQL is running in XAMPP Control Panel
   - Check database exists in phpMyAdmin
   - Verify credentials (root user, no password)

3. **Port Conflicts**:
   - MySQL (3306) - Change in XAMPP MySQL config if needed
   - Apache (80) - Change in XAMPP Apache config if needed
   - Tomcat (8080) - Change in Tomcat server.xml if needed

### Database Connection Test

Test database connection using phpMyAdmin:
1. Go to `http://localhost/phpmyadmin`
2. Select `restaurant_db` database
3. Browse tables to verify data

## Development Workflow

1. **Start XAMPP MySQL** service
2. **Make code changes** in your IDE
3. **Rebuild application**: `mvn clean package -DskipTests`
4. **Redeploy WAR file** to Tomcat
5. **Test changes** in browser

## File Structure

```
C:\xampp\
├── mysql\           # MySQL data and configuration
├── apache\          # Apache web server
└── phpmyadmin\      # Database management interface

C:\Users\Argha\Downloads\java\
├── src\             # Source code
├── target\          # Build output
├── database_schema.sql  # Database setup script
└── XAMPP_SETUP.md   # This guide
```

## Quick Start Commands

```bash
# Build application
mvn clean package -DskipTests

# Deploy to Tomcat (if Tomcat is in C:\tomcat\)
copy target\restaurant-ordering-system.war C:\tomcat\webapps\

# Start Tomcat
C:\tomcat\bin\startup.bat

# Access application
# http://localhost:8080/restaurant-ordering-system
```

## Support

- **XAMPP Documentation**: https://www.apachefriends.org/docs/
- **MySQL Documentation**: https://dev.mysql.com/doc/
- **Tomcat Documentation**: https://tomcat.apache.org/tomcat-9.0-doc/
