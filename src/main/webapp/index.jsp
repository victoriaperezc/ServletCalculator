<html>
<head>
<meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
    <title>Calculator</title>
    <link href="styles.css" rel="stylesheet">
</head>
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
                <h2>Ingrese la expresión:</h2>
                Por ejemplo (-7*8+9-(9/4.5))^2,	<br>
                Donde + es suma, - es resta, <br>
                * es multiplicación, / es división, ^ es exponenciación,<br>
		también puedes utilizar parentesis para agrupar operaciones.<br>
                <br>
                <input type="text" name="expression">

                <input type="SUBMIT">
            </form>

            Your input:
            <br>
            <br>
            Result:
            <br>
            <br>
        </td>

        <td width="700" >
            <form method="POST" action="StatisticsServlet">
                <h2>Ingrese una solicitud para obtener estadísticas:</h2>
                Son posibles las siguientes opciones: <br>
                COUNT(%date%) por ejemplo COUNT (16-02-2021) - número de cálculos por fecha	<br>
                OPERATION(%operation%) por ejemplo OPERACIÓN (+) - número de cálculos con operación  	<br>
                ONDATE(% date%) por ejemplo ONDATE (16-02-2021) - lista de cálculos para una fecha 	<br>
                ONOPERATION(%operation%) por ejemplo ONOPERATION (*) - lista de cálculo con operación	<br>
                POPULAR() por ejemplo POPULAR () - número más utilizado 	<br>
                <br>
                <input type="text" name="statisticsReq">

                <input type="SUBMIT">
            </form>

            Your input:
            <br>
            <br>
            Result:
            <br>
            <br>
        </td>
    </tr>
</table>

</body>
</html>
