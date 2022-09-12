package com.codegym.c5_caculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Instant;
import java.util.Date;

@WebServlet(name = "CaculatorServlet", urlPatterns = "/caculator")
public class CaculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/caculator.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float num1 = Float.parseFloat(req.getParameter("first_operand"));
        float num2 = Float.parseFloat(req.getParameter("second_operand"));
        float result = 0;
        String operator = req.getParameter("operator");
        switch (operator) {
            case "+":
                result = num1+num2;
                break;
            case "-":
                result = num1-num2;
                break;
            case "*":
                result = num1*num2;
                break;
            case "/":
                if(num2!=0){
                    result = num1/num2;
                }
                break;
        }
        req.setAttribute("first_operand", num1);
        req.setAttribute("second_operand", num2);
        req.setAttribute("operator", operator);
        req.setAttribute("result", result);

        Date date = new Date();
        System.out.println(date);

        req.setAttribute("date", date);
        //resp.sendRedirect("/");

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
