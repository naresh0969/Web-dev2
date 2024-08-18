<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="payD.jsp" method="post">
        <%
        String id=(String) session.getAttribute("status");
        String message=request.getParameter("fail");
            if(message != null){
            %>
            <p class="message"><%= message %></p>
            <%
            }
        %>
        
        <p>From :</p>
        <input type="text" value="<%= id %>" readonly>
        <p>Paying to :</p>
        <input type="text" placeholder="enter receiver id" name="receiver" required>
        <input type="number" placeholder="Amount" name="amount">
        <input type="submit" value="pay">
    </form>
</body>
</html>