<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validate OTP</title>
</head>
<body>

    <%
        String otp = session.getAttribute("otp").toString();
        String userOtp = request.getParameter("userotp");
        int i=4;
        int valid=0;
        while(i!=0){
            

        }
       
        if (otp.equals(userOtp)) {
            session.invalidate();
            response.sendRedirect("./success.jsp");
            
        } else {
            out.println("invalid");
        }
    %>
</body>
</html>
