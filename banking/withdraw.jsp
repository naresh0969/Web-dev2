<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <!-- Import SQL classes -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Money</title>
<script language="javascript">
function generateOTP() {
    var otps = ["1234", "1324", "2341", "3214", "3421", "4132", "2413", "4321", "2134", "3124"];
    var n = Math.floor(Math.random() * otps.length);
    alert("Your OTP is " + otps[n]);
}
</script>
</head>
<body>
<h1 align="center">Withdraw Money</h1>
<form action="withdraw.jsp" method="post" align="center">
    <table border="1" align="center">
        <tr>
            <td>Account ID:</td>
            <td><input type="number" name="account_id" required /></td>
        </tr>
        <tr>
            <td>Amount:</td>
            <td><input type="number" name="amount" required /></td>
        </tr>
        <tr>
            <td>Enter OTP:</td>
            <td><input type="text" name="otp" required /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="Generate OTP" onClick="generateOTP()" class="myButton" />
                <input type="submit" value="Withdraw" />
            </td>
        </tr>
    </table>
</form>
<%
    if (request.getMethod().equals("POST")) {
        String enteredOtp = request.getParameter("otp");
        // Validate OTP (For demo, any OTP is accepted; replace this with actual validation logic)
        if (enteredOtp != null && !enteredOtp.isEmpty()) {
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "Nile@0011");
                PreparedStatement pstmt = conn.prepareStatement("SELECT balance FROM accounts WHERE account_id = ?");
                pstmt.setInt(1, Integer.parseInt(request.getParameter("account_id")));
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    double balance = rs.getDouble("balance");
                    double amount = Double.parseDouble(request.getParameter("amount"));
                    if (balance >= amount) {
                        pstmt = conn.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE account_id = ?");
                        pstmt.setDouble(1, amount);
                        pstmt.setInt(2, Integer.parseInt(request.getParameter("account_id")));
                        pstmt.executeUpdate();
                        pstmt = conn.prepareStatement("INSERT INTO transactions (account_id, transaction_type, amount, transaction_date) VALUES (?, ?, ?, NOW())");
                        pstmt.setInt(1, Integer.parseInt(request.getParameter("account_id")));
                        pstmt.setString(2, "Withdrawal");
                        pstmt.setDouble(3, amount);
                        pstmt.executeUpdate();
                        %>
                        <div align="center">
                            Withdrawal successful!
                        </div>
                        <%
                    } else {
                        %>
                        <div align="center">
                            Insufficient funds!
                        </div>
                        <%
                    }
                } else {
                    %>
                    <div align="center">
                        Invalid account ID!
                    </div>
                    <%
                }
                conn.close();
            } catch (Exception e) {
                %>
                <div align="center">
                    Error: <%= e.getMessage() %>
                </div>
                <%
            }
        } else {
            %>
            <div align="center">
                Invalid OTP!
            </div>
            <%
        }
    }
%>
<a href="index.jsp"><p align="center">Back to Main Page</p></a>
</body>
</html>
