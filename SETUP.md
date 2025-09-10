# Restaurant Ordering System - Setup Guide

## Prerequisites

1. **Java 8 or higher** - Make sure Java is installed and JAVA_HOME is set
2. **Maven 3.9.11** - For building the project (verified compatible)
3. **Database Server** - Choose one:
   - **XAMPP** (Recommended) - Includes MySQL, Apache, and phpMyAdmin
   - **MySQL 8.0+** - Standalone MySQL server
4. **Apache Tomcat 9.0+** - Application server

## Database Setup

### Option 1: Using XAMPP (Recommended)

1. **Install XAMPP** from https://www.apachefriends.org/
2. **Start MySQL** service in XAMPP Control Panel
3. **Open phpMyAdmin**: http://localhost/phpmyadmin
4. **Create database** `restaurant_db`
5. **Import** `database_schema.sql` file
6. **Default credentials**: root user, no password

### Option 2: Using Standalone MySQL

1. **Install MySQL** and start the service
2. **Create the database** by running the SQL script:
   ```bash
   mysql -u root -p < database_schema.sql
   ```
3. **Update database credentials** in `DatabaseConnection.java` or use system properties:
   ```bash
   -Ddb.url=jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&serverTimezone=UTC
   -Ddb.username=your_username
   -Ddb.password=your_password
   ```

## Building the Application

1. **Navigate to project directory**:
   ```bash
   cd C:\Users\Argha\Downloads\java
   ```

2. **Clean and compile**:
   ```bash
   mvn clean compile
   ```

3. **Package the application**:
   ```bash
   mvn clean package -DskipTests
   ```

## Deployment

### Option 1: Deploy to Tomcat

1. **Copy the WAR file** to Tomcat's webapps directory:
   ```bash
   copy target\restaurant-ordering-system.war %CATALINA_HOME%\webapps\
   ```

2. **Start Tomcat**:
   ```bash
   %CATALINA_HOME%\bin\startup.bat
   ```

3. **Access the application**:
   ```
   http://localhost:8080/restaurant-ordering-system
   ```

### Option 2: Run with Maven Tomcat Plugin

1. **Add Tomcat plugin** to pom.xml (if not already present)
2. **Run the application**:
   ```bash
   mvn tomcat7:run
   ```

## Configuration

### Database Configuration

The application uses system properties for database configuration:

- `db.url` - Database connection URL (default: jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&serverTimezone=UTC)
- `db.username` - Database username (default: root)
- `db.password` - Database password (default: password)

### Sample Users

The database comes with sample users:
- **Admin**: admin@restaurant.com / admin123
- **Customer**: john@example.com / 1234
- **Customer**: alice@example.com / 5678

## Features

- **User Registration & Login**
- **Menu Management**
- **Order Placement**
- **Order Status Tracking**
- **Admin Order Management**
- **Responsive Web Design**

## API Endpoints

- `POST /api/register` - User registration
- `POST /api/login` - User login
- `POST /api/logout` - User logout
- `GET /api/menu` - Get menu items
- `POST /api/order` - Place order
- `GET /api/orders` - Get user orders
- `GET /api/admin/orders` - Get all orders (admin)
- `PUT /api/order/{id}/status` - Update order status

## Troubleshooting

### Common Issues

1. **Database Connection Error**:
   - Verify MySQL is running
   - Check database credentials
   - Ensure database exists

2. **Port Already in Use**:
   - Change Tomcat port in server.xml
   - Or stop other services using port 8080

3. **ClassNotFoundException**:
   - Ensure all dependencies are in classpath
   - Run `mvn clean install` to refresh dependencies

### Logs

Check Tomcat logs in `%CATALINA_HOME%\logs\` for detailed error information.

## Development

### Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/restaurant/
│   │       ├── dao/          # Data Access Objects
│   │       ├── model/        # Entity classes
│   │       ├── servlet/      # Web servlets
│   │       ├── util/         # Utility classes
│   │       └── filter/       # Servlet filters
│   └── webapp/
│       ├── css/             # Stylesheets
│       ├── js/              # JavaScript files
│       ├── pages/           # JSP pages
│       └── WEB-INF/         # Web configuration
└── test/                    # Test files
```

### Adding New Features

1. Create model classes in `com.restaurant.model`
2. Create DAO classes in `com.restaurant.dao`
3. Create servlet classes in `com.restaurant.servlet`
4. Update frontend JavaScript in `webapp/js/app.js`
5. Add CSS styles in `webapp/css/style.css`

## Support

For issues or questions, check the application logs and ensure all prerequisites are met.
