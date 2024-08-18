<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h2>Sign Up</h2>
    <form action="SignupServlet" method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="text" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Sign Up">
    </form>
    <br>
    <a href="index.jsp">Back to Login</a>
</body>
</html>
