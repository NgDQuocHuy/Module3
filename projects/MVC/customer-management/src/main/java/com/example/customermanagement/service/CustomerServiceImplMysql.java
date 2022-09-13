package com.example.customermanagement.service;

import com.example.customermanagement.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImplMysql implements CustomerService{

    private String jdbcURL = "jdbc:mysql://localhost:3306/c5_customers?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "241298";

    final static String SELECT_ALL_CUSTOMER = "SELECT * FROM customers";
    final static String INSERT_CUSTOMER = "INSERT INTO `customers` (`name`, `email`, `address`) VALUES (?, ?, ?)";
    final static String SELECT_BY_ID = "SELECT * FROM customers WHERE id = ?";
    final static String SP_UPDATE_CUSTOMER = "CALL c5_customers.sp_update_customer(?, ?, ?, ?, ?)";
    final static String DELETE_CUSTOMER = "DELETE FROM customers WHERE (`id` = ?)";
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }





    @Override
    public List<Customer> findAll() throws SQLException {

        List<Customer> customers = new ArrayList<>();

        Connection connection = getConnection();
        Statement statement = connection.createStatement();

        ResultSet rs = statement.executeQuery(SELECT_ALL_CUSTOMER);
        System.out.println(this.getClass() + " findAll() : " + statement);

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String address = rs.getString("address");

            Customer customer = new Customer(id, name, email, address);
            customers.add(customer);
        }

        return customers;
    }

    @Override
    public void save(Customer customer) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
        preparedStatement.setString(1, customer.getName());
        preparedStatement.setString(2, customer.getEmail());
        preparedStatement.setString(3, customer.getAddress());

        System.out.println(this.getClass() + " findAll() : " + preparedStatement);

        preparedStatement.execute();
    }

    @Override
    public Customer findById(int id) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
        preparedStatement.setInt(1, id);

        ResultSet rs = preparedStatement.executeQuery();
        System.out.println(this.getClass() + " findById() : " + preparedStatement);

        while (rs.next()) {
            int idCustomer = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String address = rs.getString("address");

            Customer customer = new Customer(idCustomer, name, email, address);

            return customer;
        }
        return null;
    }

    @Override
    public void update(int id, Customer customer) throws SQLException {
        Connection connection = getConnection();

        CallableStatement callableStatement = connection.prepareCall(SP_UPDATE_CUSTOMER);
        callableStatement.setInt(1, id);
        callableStatement.setString(2, customer.getName());
        callableStatement.setString(3, customer.getEmail());
        callableStatement.setString(4, customer.getAddress());

        callableStatement.registerOutParameter(5, Types.VARCHAR);

        System.out.println(this.getClass() + " update() : " + callableStatement);

        callableStatement.execute();

        String message = callableStatement.getString(5);
        System.out.println("update......: " + message);
    }

    @Override
    public void remove(int id) throws SQLException {
        Connection connection = getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
        preparedStatement.setInt(1, id);

        System.out.println(this.getClass() + " remove() : " + preparedStatement);
        preparedStatement.execute();

        String message = "successfully deleted";
        System.out.println("delete......: " + message);
    }
}
