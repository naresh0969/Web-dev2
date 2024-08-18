<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 0;
            margin-top: 100px;
            font-size: 25px;
            color:#333333;
        }
        .container{
            margin: 10px;
            display: flex;
            align-items: center;
            justify-content:space-around;
            width: 300px;
            height: 300px;
            border: 2px solid black;
            border-radius: 4px;
            
        }
    </style>
</head>
<body>
    <%
    String wish=request.getParameter("pass");
    String name=(String)session.getAttribute("uname");

    String email=(String) session.getAttribute("status");
    out.println(wish);
    out.println(name);
    String message=request.getParameter("pass");
    %>
    <div class="container">
        <form action="pay.jsp">
            <input type="submit" name="" id="" value="Pay">
        </form>
        <form action="deposit.jsp">
            <input type="submit" name="" id="" value="Add+">
        </form>
        <form action="balance.jsp">
            <input type="submit" name="" id="" value="Check Balance">
        </form>
        <form action="history.jsp">
            <input type="submit" name="" id="" value="History">
        </form>

    </div>
</body>
</html>