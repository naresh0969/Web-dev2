<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>OTP Verification</title>
</head>
<body>
<%
    String generatedOTP = request.getParameter("generatedOTP");
    String enteredOTP = request.getParameter("enteredOTP");

    if (generatedOTP != null && enteredOTP != null && generatedOTP.equals(enteredOTP)) {
        out.println("<h2>OTP Verified Successfully!</h2>");
    } else {
        out.println("<h2>OTP Verification Failed!</h2>");
    }
%>

<script>
    
</script>
</body>
</html>
