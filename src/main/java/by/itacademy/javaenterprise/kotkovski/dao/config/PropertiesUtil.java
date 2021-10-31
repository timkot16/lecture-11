package by.itacademy.javaenterprise.kotkovski.dao.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public final class PropertiesUtil {

    private final static Logger logger = LoggerFactory.getLogger(ConnectionManager.class);

    private static final Properties PROPERTIES = new Properties();

    static {
        loadProperties();
    }

    private PropertiesUtil() {
    }

    public static String get(String key) {
        return PROPERTIES.getProperty(key);
    }

    private static void loadProperties() {
        try (InputStream inputStream = PropertiesUtil.class.getClassLoader().getResourceAsStream("application.properties")) {
            PROPERTIES.load(inputStream);
        } catch (IOException e) {
            logger.error("Failed to load PROPERTIES file {}", PROPERTIES, e);
            throw new RuntimeException(e);
        }
    }



}
