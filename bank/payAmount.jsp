<!DOCTYPE html>
<html>
<head>
    <title>Pay Amount</title>
</head>
<body>
    <h2>Withdraw Amount</h2>
    <form method="post" action="verifyOtpAndPay.jsp">
        Account ID: <input type="text" name="sender_account_id" required><br>
        Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="amount" required><br>
        <input type="submit" value="Withdraw">
    </form>
    <br>
    <a href="index.jsp">Home</a>
</body>
</html>
