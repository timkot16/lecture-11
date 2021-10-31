package by.itacademy.javaenterprise.kotkovski;

import by.itacademy.javaenterprise.kotkovski.dao.CustomerDAO;
import by.itacademy.javaenterprise.kotkovski.dao.impl.CustomerDAOImpl;

public class Main {
    public static void main(String[] args) {

        CustomerDAO customerDAO = new CustomerDAOImpl();

        System.out.println(customerDAO.findCustomerByFirstName("Timur"));
    }
}
