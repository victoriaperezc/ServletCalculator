package com.home.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ExpressionServlet", value = "/ExpressionServlet")
public class ExpressionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>ExpressionServlet is working</h3>");
        String expression = request.getParameter("expression");
        out.println("<h3>Your input  </h3>" + expression );

    }
}
