package com.example.customers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Customers", urlPatterns = "/customers")
public class Customers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ListCustomers> customers = new ArrayList<>();
        customers.add(new ListCustomers("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg?fit=512%2C20000&quality=95&ssl=1"));
        customers.add(new ListCustomers("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg?fit=512%2C20000&quality=95&ssl=1"));
        customers.add(new ListCustomers("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg?fit=512%2C20000&quality=95&ssl=1"));
        customers.add(new ListCustomers("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg?fit=512%2C20000&quality=95&ssl=1"));
        customers.add(new ListCustomers("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg?fit=512%2C20000&quality=95&ssl=1"));

        req.setAttribute("customers", customers);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/showCustomer.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
