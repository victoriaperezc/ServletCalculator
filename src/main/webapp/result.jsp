<html>
<title>Calculator</title>
    <link href="styles.css" rel="stylesheet">
<body>

<h1 align="left">Expression Calculator</h1>
<style>

    td {
        line-height: 2;
    }
</style>
<table>
    <tr>
        <td width="500" >
            <form method="POST" action="ExpressionServlet">
                <h2>Enter expression:</h2>
                For example (-7*8+9-(9/4.5))^2,	<br>
                where + is addition, - is subtraction , <br>
                * is multiplication, / is division, ^ is exponentiation,	<br>
                you can also use parentheses to group operations	<br>
                <br>
                <input type="text" name="expression">

                <input type="SUBMIT">
            </form>
            <%  String expression;
                if (request.getParameter("expression") != null) {
                    expression = request.getParameter("expression");
                } else { expression = ""; }
            %>
            Your input: <br>
            <%= expression %>
            <br>
            <%  String answer;
                if (request.getAttribute("answer") != null) {
                    answer = (String) request.getAttribute("answer");
                } else { answer = ""; }
            %>
            Result: <br>
            <%= answer %>
            <br>
        </td>

        <td width="700" >
            <form method="POST" action="StatisticsServlet">
                <h2>Enter a request to get statistics:</h2>
                The following options are possible: <br>
                COUNT(%date%) for example COUNT(16-02-2021) - number of calculations per date	<br>
                OPERATION(%operation%) for example OPERATION(+)- number of calculations with operation  	<br>
                ONDATE(% date%) for example ONDATE(16-02-2021) - list of calculations for a date 	<br>
                ONOPERATION(%operation%) for example ONOPERATION(*) - calculation list with operation	<br>
                POPULAR() for example POPULAR() - most used number	<br>
                <br>
                <input type="text" name="statisticsReq">

                <input type="SUBMIT">
            </form>
            <%  String statisticsReq;
                if (request.getParameter("statisticsReq") != null) {
                    statisticsReq = request.getParameter("statisticsReq");
                } else { statisticsReq = ""; }
            %>
            Your input: <br>
            <%= statisticsReq %>
            <br>
            <%  String statistics;
                if (request.getAttribute("statistics") != null) {
                    statistics = (String) request.getAttribute("statistics");
                } else { statistics = ""; }
            %>
            Result: <br>
            <%= statistics %>
            <br>
        </td>
    </tr>
</table>

</body>
</html>
