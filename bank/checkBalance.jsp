<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Balance</title>
</head>
<body>
    <h2>Check Account Balance</h2>
    <form method="post">
        Account ID: <input type="text" name="account_id"><br>
        <input type="submit" value="Check Balance">
    </form>

    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String accountId = request.getParameter("account_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "naresh", "naresh0969");
            Statement stmt = con.createStatement();
            String query = "SELECT account_balance FROM accounts WHERE account_id = " + accountId;
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                double balance = rs.getDouble("account_balance");
                out.println("Account Balance: " + balance);
            } else {
                out.println("Account not found.");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
