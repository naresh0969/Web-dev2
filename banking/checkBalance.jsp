<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Balance</title>
</head>
<body>
<h1 align="center">Check Balance</h1>
<form action="checkBalance.jsp" method="post" align="center">
    <table border="1" align="center">
        <tr>
            <td>Account ID:</td>
            <td><input type="number" name="account_id" /></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Check Balance" /></td>
        </tr>
    </table>
</form>
<% 
    if (request.getMethod().equals("POST")) {
        int accountId = Integer.parseInt(request.getParameter("account_id"));
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "naresh", "naresh0969");
        PreparedStatement pstmt = conn.prepareStatement("SELECT balance FROM accounts WHERE account_id = ?");
        pstmt.setInt(1, accountId);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            double balance = rs.getDouble("balance");
%>
            <div align="center">
                Balance: $<%= balance %>
            </div>
<%
        } else {
%>
            <div align="center">
                Account not found.
            </div>
<%
        }
        conn.close();
    }
%>
<a href="index.jsp"><p align="center">Back to Main Page</p></a>
</body>
</html>
