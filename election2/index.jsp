<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Election login</title>
    <style>
        table{
            position: relative;
            margin-top: 100px;
            
        }
        td{
            font-size: 20px;
            width: 100px;
            height: 50px;
        }
        input[type="text"],
        input[type="password"] {
            width: 200px;
            height: 30px;
        }
        .msg{
            margin-top: 100px;
            color: rgb(12, 12, 12);
            font-size: 20px;
        }   
        .valid{
            margin-top: 100px;
            color: red;
            font-size: 20px;

        }
    </style>
</head>
<%
String message=request.getParameter("msg");
String message2=session.getAttribute("message").toString();
if(message2!=null){
    %>
    <p class="msg" align="center"><%=message2%></p>
    <%
}
if(message!=null){
    %>
    <p class="valid" align="center"><%=message%></p>
    <%
}



%>
<body>
    <form action="validate.jsp" method="post">
        <table align="center">
            <tr>
                <td>Name :</td>
                <td><input type="text" name="voter"> </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Login" style="background-color:rgb(67, 192, 67)"></td>
            </tr>
        </table>
    </form>
</body>
</html>
