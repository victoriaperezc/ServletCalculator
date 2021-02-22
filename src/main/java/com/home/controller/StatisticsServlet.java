package com.home.controller;

import com.home.model.StatisticsRequestChecker;
import com.home.model.dao.ResultsDao;
import com.home.model.db.SimpleJdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "StatisticsServlet", value = "/StatisticsServlet")
public class StatisticsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>StatisticsServlet is working</h3>");

        String statisticReq = request.getParameter("statisticReq");
        StatisticsRequestChecker checker = new StatisticsRequestChecker(statisticReq);
        String[] statOp = null;
        try {
            statOp = checker.check();
        } catch (Exception e) {
            out.println("<h3>Your input is wrong  </h3>" + statisticReq );
        }

        SimpleJdbcTemplate source = (SimpleJdbcTemplate) getServletContext().getAttribute("source");
        ResultsDao dao = new ResultsDao(source);
        String answer = null;

        try {
            answer = dao.getStatistics(statOp);
        } catch (SQLException throwables) {

        }

        out.println("<h3>Your input  </h3>" + statisticReq );
        out.println("<h3>Result  </h3>" + answer );

    }
}
