


<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h2>Login</h2>
    <form action="loginHandler.jsp" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login"><br><br><br>
        <a href = "loginstatus.jsp" target = "blank">start voting</a>
        <br>
        <a href = "stop.jsp" target = "blank">stop voting</a>

    </form>
</body>
</html>