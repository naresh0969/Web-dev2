<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String enteredOtp = request.getParameter("otp");
String generatedOtp = session.getAttribute("generatedOtp").toString();

if (enteredOtp.equals(generatedOtp)) {
    response.sendRedirect("index.jsp?msg=OTP verified successfully!");
} else {
    response.sendRedirect("index.jsp?msg=Invalid OTP. Please try again.");
}
%>
