<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        table{
            position: relative;
            top: 300px;
        }
        .status{
            position: relative;
            top: 200px;
            left: 200px;
            color: green;
            font-size: 25px;
        }
        .status2{
            position: relative;
            top: 200px;
            left: 200px;
            color: red;
            font-size: 25px;
        }
    </style>
</head>
<body>

    <%
        String message1=request.getParameter("pass");
        String message2=request.getParameter("fail");
        if(message1 != null){
        %>
        <p class="status"><%=message1%></p>
        <%
        }
        else if(message2 != null){
        %>

            <p class="status2"><%=message2%></p>
        <%
        }

    %>

    <div class="container">
        <form action="validate.jsp" method="post">
            <table align="center">
                <tr>
                    <td>Email :</td>
                    <td><input type="email" name="email" placeholder="enter your email"></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input type="password" name="password" placeholder="enter password"></td>
                </tr>
                <tr>

                </tr>
                <tr align="center">
                    <td colspan="2" ><input type="submit" value="Login"></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr >
                    <td colspan="2" align="center"><a href="./register.jsp">Don't have account?</a></td>
                </tr>
            </table>
            

        </form>
        
    </div>

</body>
</html>