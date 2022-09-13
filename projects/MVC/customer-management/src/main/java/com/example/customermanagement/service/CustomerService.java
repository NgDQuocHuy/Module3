package com.example.customermanagement.service;

import com.example.customermanagement.model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    List<Customer> findAll() throws SQLException;

    void save(Customer customer) throws SQLException;

    Customer findById(int id) throws SQLException;

    void update(int id, Customer customer) throws SQLException;

    void remove(int id) throws SQLException;
}
