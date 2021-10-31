package by.itacademy.javaenterprise.kotkovski.dao.impl;

import by.itacademy.javaenterprise.kotkovski.dao.CustomerDAO;
import by.itacademy.javaenterprise.kotkovski.dao.config.ConnectionManager;
import by.itacademy.javaenterprise.kotkovski.dao.config.MyDataSource;
import by.itacademy.javaenterprise.kotkovski.entity.Customer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAOImpl implements CustomerDAO {

    private final static Logger logger = LoggerFactory.getLogger(ConnectionManager.class);

    @Override
    public Customer getCustomerById(int id) {

        String sql = "select id, first_name, last_name, tel_number from Customer where id = ?";

        try (Connection connection = MyDataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            Customer customer = new Customer();
            while (rs.next()) {
                customer.setId(rs.getInt("id"));
                customer.setFirstName(rs.getString("first_name"));
                customer.setLastName(rs.getString("last_name"));
                customer.setTelNumber(rs.getString("tel_number"));
            }
            return customer;
        } catch (SQLException e) {
            logger.error("Failed, customer with such id doesn't exist {}", id, e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public Customer addNewCustomer(String firstName, String lastName, String telNumber) {

        String sql = "insert into Customer(first_name, last_name, tel_number)" +
                "values(?, ?, ?)";

        try (Connection connection = MyDataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, telNumber);
            preparedStatement.executeUpdate();

            Customer customer = new Customer();
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setTelNumber(telNumber);

            return customer;
        } catch (SQLException e) {
            logger.error("Failed to add a new customer", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public int deleteCustomerByTelNumber(String telNumber) {

        String sql = "delete from Customer where tel_number = ?";

        try (Connection connection = MyDataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, telNumber);
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error("Failed, customer with such id doesn't exist {}", telNumber, e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Customer> findCustomerByFirstName(String firstName) {

        String sql = "select id, first_name, last_name, tel_number from Customer" +
                " where first_name = ?";

        try (Connection connection = MyDataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, firstName);
            ResultSet rs = preparedStatement.executeQuery();

            Customer customer = new Customer();
            List<Customer> customerList = new ArrayList<>();
            while (rs.next()) {
                customer.setId(rs.getInt("id"));
                customer.setFirstName(rs.getString("first_name"));
                customer.setLastName(rs.getString("last_name"));
                customer.setTelNumber(rs.getString("tel_number"));
                customerList.add(customer);
            }
            return customerList;
        } catch (SQLException e) {
            logger.error("Failed, customer with such first name doesn't exist {}", firstName, e);
            throw new RuntimeException(e);
        }
    }
}
