<html>
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

                <left>
                    <input type="SUBMIT">
                </left>
            </form>

            Your input:
            <br>
            Result:
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
                <input type="text" name="statisticReq">

                <left>
                    <input type="SUBMIT">
                </left>
            </form>

            Your input:
            <br>
            Result:
            <br>
        </td>
    </tr>
</table>

</body>
</html>
