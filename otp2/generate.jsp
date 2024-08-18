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

    <h1>Generate OTP</h1>
    <p id="otpDisplay">Enter OTP:<%=session.getAttribute("otp")%></p>
    <form action="validateOtp.jsp" method="post">
        <input type="text" id="otpInput" name="userotp">
        <input type="button" value="Generate OTP" onClick="window.location.href='./o.jsp'" class="myButton">
        <input type="submit" value="Submit OTP" class="myButton">
        <a href=""></a>
        <img src="" alt="">
    </form>
</body>
</html>
