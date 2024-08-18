
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%
        String[] otps = {"1234", "1324", "2341", "3214", "3421", "4132", "2413", "4321", "2134", "3124"};
        int n = new Random().nextInt(10);
        String otp = otps[n];
        session.setAttribute("otp", otp);
        response.sendRedirect("./generate.jsp");
%>

