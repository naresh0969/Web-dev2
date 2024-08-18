<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction List</title>
</head>
<body>
    <h1 align="center">Transaction List</h1>
    <table border="1" align="center">
        <tr>
            <th>Transaction ID</th>
            <th>Account ID</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Transaction Date</th>
        </tr>
        <%
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "naresh", "naresh0969");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM transactions");
            while (rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                int accountId = rs.getInt("account_id");
                String transactionType = rs.getString("transaction_type");
                double amount = rs.getDouble("amount");
                Timestamp transactionDate = rs.getTimestamp("transaction_date");
        %>
        <tr>
            <td><%= transactionId %></td>
            <td><%= accountId %></td>
            <td><%= transactionType %></td>
            <td><%= amount %></td>
            <td><%= transactionDate %></td>
        </tr>
        <%
            }
            conn.close();
        %>
    </table>
    <a href="index.jsp"><p align="center">Back to Main Page</p></a>
</body>
</html>
