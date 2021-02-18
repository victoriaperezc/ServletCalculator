package com.home.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "StatisticsServlet", value = "/StatisticsServlet")
public class StatisticsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>StatisticsServlet is working</h3>");
        String statisticReq = request.getParameter("statisticReq");
        out.println("<h3>Your input  </h3>" + statisticReq );

    }
}
