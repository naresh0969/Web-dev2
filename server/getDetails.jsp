<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    String str=request.getParameter("uname");
    %>
    <center><font size=30 color=red>you entered username: <br><%=str%></font></center>
</body>
</html>