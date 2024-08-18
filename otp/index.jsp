<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OTP Verification</title>
</head>
<body>

<% 
// Generate a random 4-digit OTP
int otp = (int)(Math.random() * 100) + 400;
// Store OTP in session
session.setAttribute("generatedOtp", otp);

// Display the OTP to the user (for demo purposes)
%>
<p>Your OTP is: <strong><%= otp %></strong></p>

<form action="verifyOtp.jsp" method="post">
    <table align="center">
        <tr>
            <td>Enter OTP :</td>
            <td><input type="text" name="otp" required></td>
        </tr>
        <tr>

        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="Verify OTP"></td>
        </tr>
    </table>
</form> 

<% 
// Display any messages from verification
String message = request.getParameter("msg");
if (message != null) {
%>
    <p style="color:red;"><%= message %></p>
<%
}
%>

</body>
</html>
