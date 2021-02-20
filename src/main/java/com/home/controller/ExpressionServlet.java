package com.home.controller;

import com.home.model.ExpressionCalculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ExpressionServlet", value = "/ExpressionServlet")
public class ExpressionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>ExpressionServlet is working</h3>");
        String expression = request.getParameter("expression");

        ExpressionCalculator calc = new ExpressionCalculator(expression);
        List<String> postfix = null;
        double result = 0;
        String error = null;
        try {
            postfix = calc.fromInfixToPostfix();
            result = calc.calculatePostfix();
        } catch (Exception e) {

        }

        out.println("<h3>Your input is </h3>" + expression );
        out.println("<h3>Your postfix is </h3>" + postfix );
        out.println("<h3>Your result is </h3>" + result);


    }
}
