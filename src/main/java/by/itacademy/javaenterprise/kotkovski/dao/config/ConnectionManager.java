package by.itacademy.javaenterprise.kotkovski.dao.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class ConnectionManager {

    private final static Logger logger = LoggerFactory.getLogger(ConnectionManager.class);

    private static final String DRIVER_KEY = "db.driver";
    private static final String URL_KEY = "db.url";
    private static final String USER_KEY = "db.username";
    private static final String PASSWORD_KEY = "dp.password";

    static {
        loadDriver();
    }

    public ConnectionManager() {
    }

    private static void loadDriver() {
        try {
            Class.forName(PropertiesUtil.get(DRIVER_KEY));
        } catch (ClassNotFoundException e) {
            logger.error("Failed to connect with driver {}", PropertiesUtil.get(DRIVER_KEY), e);
            throw new RuntimeException(e);
        }
    }

    public static Connection open() {
        try {
            return DriverManager.getConnection(
                    PropertiesUtil.get(URL_KEY),
                    PropertiesUtil.get(USER_KEY),
                    PropertiesUtil.get(PASSWORD_KEY));
        } catch (SQLException e) {
            logger.error("Failed to connect with database {}", PropertiesUtil.get(URL_KEY), e);
            throw new RuntimeException(e);
        }
    }

}
