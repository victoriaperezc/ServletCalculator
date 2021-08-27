<html>
<title>Calculator</title>
    <link href="styles.css" rel="stylesheet">
<body>

<h1 align="left">Calculadora de expresiones</h1>
<style>

    td {
        line-height: 2;
    }
</style>
<table>
    <tr>
        <td width="500" >
            <form method="POST" action="ExpressionServlet">
                <h2>Ingrese la expresion:</h2>
                Por ejemplo (-7*8+9-(9/4.5))^2,	<br>
                Donde + es suma, - es resta, <br>
                * es multiplicacion, / es division, ^ es exponenciacion,<br>
		tambien puedes utilizar parentesis para agrupar operaciones.<br>
                <br>
                <input type="text" name="expression">

                <input type="SUBMIT">
            </form>
            <%  String expression;
                if (request.getParameter("expression") != null) {
                    expression = request.getParameter("expression");
                } else { expression = ""; }
            %>
            Tu entrada: <br>
            <%= expression %>
            <br>
            <%  String answer;
                if (request.getAttribute("answer") != null) {
                    answer = (String) request.getAttribute("answer");
                } else { answer = ""; }
            %>
            Resultado: <br>
            <%= answer %>
            <br>
        </td>

        <td width="700" >
            <form method="POST" action="StatisticsServlet">
                <h2>Ingrese una solicitud para obtener estadisticas:</h2>
                Son posibles las siguientes opciones: <br>
                COUNT(%date%) por ejemplo COUNT (16-02-2021) - numero de calculos por fecha	<br>
                OPERATION(%operation%) por ejemplo OPERAtION (+) - numero de calculos con operación  	<br>
                ONDATE(% date%) por ejemplo ONDATE (16-02-2021) - lista de calculos para una fecha 	<br>
                ONOPERATION(%operation%) por ejemplo ONOPERATION (*) - lista de calculo con operacion	<br>
                POPULAR() por ejemplo POPULAR () - numero mas utilizado 	<br>
                <br>
                <input type="text" name="statisticsReq">
                <input type="SUBMIT">
            </form>
            <%  String statisticsReq;
                if (request.getParameter("statisticsReq") != null) {
                    statisticsReq = request.getParameter("statisticsReq");
                } else { statisticsReq = ""; }
            %>
            Tu entrada: <br>
            <%= statisticsReq %>
            <br>
            <%  String statistics;
                if (request.getAttribute("statistics") != null) {
                    statistics = (String) request.getAttribute("statistics");
                } else { statistics = ""; }
            %>
            Resultado: <br>
            <%= statistics %>
            <br>
        </td>
    </tr>
</table>

</body>
</html>
