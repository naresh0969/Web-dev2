<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="./insert.jsp" method="post">
        <table align="center">
            <tr>
                <td>Name :</td>
                <td><input type="text" name="uname" placeholder="enter your name" required></td>
            </tr>
            <tr>
                <td>Email :</td>
                <td><input type="email" name="umail" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="upwd" placeholder="give a password" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>