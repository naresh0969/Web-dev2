<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .message{
            color: red;
            font-size: 17px;
        }
    </style>
</head>
<body>
    <% String message= request.getParameter("msg");
    String pass=request.getParameter("mes");
        if(message != null){

    %>
        <p class="message"><%= message %></p>
        <p class="mes"></p>
    <%
    }
    
    %>
    <form action="./validate.jsp" method="post">
        <p>ID :</p>
        <input type="text" placeholder="enter your id no." name="id">
        <input type="submit" value="download">
    </form>
    <a href="./register.jsp">register</a>
</body>
</html>