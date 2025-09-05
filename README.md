# Restaurant Ordering System

A web-based restaurant food ordering system built with Java Servlets/JSP, MySQL, and modern frontend technologies.

## Features

### User Module
- User registration and login
- Session management
- Profile management

### Menu Module
- View restaurant menu items
- Add new menu items (admin)
- Real-time menu updates

### Order Module
- Place orders with multiple items
- Track order status
- View order history
- Order status updates (PENDING, CONFIRMED, DELIVERED)

### Admin Module
- View all orders
- Update order status
- Manage menu items

## Technology Stack

- **Backend**: Java Servlets, JSP
- **Database**: MySQL
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Build Tool**: Maven
- **Server**: Apache Tomcat
- **JSON Processing**: Gson

## Prerequisites

- Java 8 or higher
- Apache Tomcat 9.0 or higher
- MySQL 8.0 or higher
- Maven 3.6 or higher

## Setup Instructions

### 1. Database Setup

1. Install MySQL and start the service
2. Create a database user (optional, can use root)
3. Run the SQL script to create the database and tables:

```bash
mysql -u root -p < database_schema.sql
```

Or manually execute the SQL commands in `database_schema.sql`

### 2. Database Configuration

Update the database connection settings in `src/main/java/com/restaurant/util/DatabaseConnection.java`:

```java
private static final String DB_URL = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&serverTimezone=UTC";
private static final String DB_USERNAME = "root";
private static final String DB_PASSWORD = "your_mysql_password";
```

### 3. Build the Project

```bash
mvn clean compile
```

### 4. Deploy to Tomcat

1. Build the WAR file:
```bash
mvn clean package
```

2. Copy the generated WAR file from `target/restaurant-ordering-system.war` to your Tomcat `webapps` directory

3. Start Tomcat server

### 5. Access the Application

Open your browser and navigate to:
```
http://localhost:8080/restaurant-ordering-system/
```

## API Endpoints

### User Module
- `POST /api/register` - User registration
- `POST /api/login` - User login
- `POST /api/logout` - User logout

### Menu Module
- `GET /api/menu` - Get all menu items
- `POST /api/menu/add` - Add new menu item

### Order Module
- `POST /api/order` - Place new order
- `GET /api/orders` - Get user's orders
- `PUT /api/order/{id}/status` - Update order status

### Admin Module
- `GET /api/admin/orders` - Get all orders (admin view)

## Sample Data

The database schema includes sample data:
- 2 sample users (john@example.com, alice@example.com)
- 6 menu items (Pizza, Burger, Pasta, Coffee, Salad, Sandwich)
- 1 sample order

## Default Login Credentials

- **Customer**: john@example.com / 1234
- **Customer**: alice@example.com / 5678
- **Admin**: admin@restaurant.com / admin123

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/restaurant/
│   │       ├── model/          # Data models
│   │       ├── dao/            # Data Access Objects
│   │       ├── servlet/        # Servlet controllers
│   │       └── util/           # Utility classes
│   └── webapp/
│       ├── WEB-INF/
│       │   └── web.xml         # Web configuration
│       ├── css/                # Stylesheets
│       ├── js/                 # JavaScript files
│       ├── pages/              # JSP pages
│       └── index.html          # Main page
├── database_schema.sql         # Database setup script
└── pom.xml                     # Maven configuration
```

## Features in Detail

### User Authentication
- Secure session management
- Input validation
- Error handling

### Menu Management
- Dynamic menu loading
- Real-time updates
- Responsive design

### Order Processing
- Multi-item orders
- Quantity selection
- Total calculation
- Order tracking

### Admin Panel
- Order management
- Status updates
- Customer information

## Browser Compatibility

- Chrome 70+
- Firefox 65+
- Safari 12+
- Edge 79+

## Development

### Adding New Features

1. Create model classes in `src/main/java/com/restaurant/model/`
2. Create DAO classes in `src/main/java/com/restaurant/dao/`
3. Create servlet controllers in `src/main/java/com/restaurant/servlet/`
4. Update frontend JavaScript in `src/main/webapp/js/app.js`
5. Add CSS styles in `src/main/webapp/css/style.css`

### Database Schema Updates

1. Update `database_schema.sql`
2. Modify model classes if needed
3. Update DAO classes for new fields
4. Test with sample data

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Check MySQL service is running
   - Verify database credentials
   - Ensure database exists

2. **Tomcat Deployment Issues**
   - Check Tomcat logs
   - Verify WAR file is in webapps directory
   - Ensure all dependencies are included

3. **Frontend Not Loading**
   - Check browser console for errors
   - Verify CSS/JS files are accessible
   - Check network tab for failed requests

### Logs

- Tomcat logs: `$TOMCAT_HOME/logs/`
- Application logs: Check console output
- Database logs: MySQL error log

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please create an issue in the repository.
