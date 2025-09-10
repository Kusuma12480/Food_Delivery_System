import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestDbConnection {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String username = "root";
        String password = "";
        
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Test connection
            System.out.println("Testing database connection...");
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("✅ Database connection successful!");
            
            // Test query
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) as count FROM users");
            
            if (resultSet.next()) {
                int userCount = resultSet.getInt("count");
                System.out.println("✅ Found " + userCount + " users in database");
                
                if (userCount > 0) {
                    // Test specific user
                    ResultSet userResult = statement.executeQuery("SELECT * FROM users WHERE email = 'admin@restaurant.com'");
                    if (userResult.next()) {
                        System.out.println("✅ Admin user found: " + userResult.getString("name"));
                    } else {
                        System.out.println("❌ Admin user not found");
                    }
                }
            }
            
            connection.close();
            System.out.println("✅ Database test completed successfully!");
            
        } catch (Exception e) {
            System.out.println("❌ Database connection failed:");
            e.printStackTrace();
        }
    }
}
