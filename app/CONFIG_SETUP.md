# Configuration Setup

## Setting up application.properties

Before running the application, you need to create your own `application.properties` file:

1. Copy `application.properties.example` to `application.properties`
2. Update the following values with your actual configuration:

### Database Configuration
```properties
# Update with your MySQL database details
spring.datasource.url=jdbc:mysql://localhost:3306/your_database_name?usessl=false
spring.datasource.username=your_username
spring.datasource.password=your_password

# Update with your MongoDB details
spring.data.mongodb.uri=mongodb://localhost:27017/your_mongodb_database
```

### Security Configuration
```properties
# Generate a secure JWT secret key
jwt.secret=your_secure_jwt_secret_key_here
```

## Example Setup Commands

```bash
# Copy the example file
cp src/main/resources/application.properties.example src/main/resources/application.properties

# Edit the file with your actual values
# Use your favorite editor to update the configuration
```

**Note:** The `application.properties` file is in `.gitignore` to prevent sensitive data from being committed to version control.
