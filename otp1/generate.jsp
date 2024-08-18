<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate OTP</title>
</head>
<body>

    <h1>Check Balance</h1>
    <p id="otpDisplay">Enter OTP:<%=session.getAttribute("otp")%></p>
    <form action="check2.jsp" method="post">
        <input type="text" id="otpInput" name="userotp">
        <input type="button" value="Generate OTP" onClick="window.location.href='./o.jsp'" class="myButton"> <br><br>
        <input type="text" name="account_id" placeholder="Account Id" required> <br>
        <input type="text" name="pin" placeholder="Enter 4-digit pin" required> <br><br>
        <input type="submit" value="Submit OTP" class="myButton">
    </form>
</body>
</html>
