<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>your are entered into database</h1>
</body>
</html>
<%
    String name=(String) session.getAttribute("id");
    out.println("welcome "+name);
%>