package com.example.productdiscount;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.WriteAbortedException;

@WebServlet(name = "DiscountCalculator", urlPatterns = "/discount")
public class DiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("product");
        float price = Float.parseFloat(req.getParameter("price"));
        float discount = Float.parseFloat(req.getParameter("discount"));
        float discountAmount = (float) (price * discount * 0.01);
        float discountPrice = price - discountAmount;

        PrintWriter out = resp.getWriter();

        req.setAttribute("product", title);
        req.setAttribute("price", price);
        req.setAttribute("discount", discount);
        req.setAttribute("discountAmount", discountAmount);
        req.setAttribute("discountPrice", discountPrice);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
