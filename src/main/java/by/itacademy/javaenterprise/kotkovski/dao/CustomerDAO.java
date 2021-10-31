package by.itacademy.javaenterprise.kotkovski.dao;

import by.itacademy.javaenterprise.kotkovski.entity.Customer;

import java.util.List;

public interface CustomerDAO {

    Customer getCustomerById(int id);
    Customer addNewCustomer(String firstName, String lastName, String telNumber);
    int deleteCustomerByTelNumber(String telNumber);
    List<Customer> findCustomerByFirstName(String firstName);
}
