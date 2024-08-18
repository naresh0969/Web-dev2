   
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String dbUrl = "jdbc:mysql://localhost:3306/election";
    String dbUser = "naresh";
    String dbPassword = "naresh0969";
    
    try {
        String uid=session.getAttribute("vname").toString();
        String uname=session.getAttribute("vpwd").toString();
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        String updateQuery = "UPDATE users SET voted = 1 WHERE userid = ? and password = ?  and voted = 0";
        PreparedStatement ps = conn.prepareStatement(updateQuery);
        ps.setString(1, uid);
        ps.setString(2, uname);
        int rowsUpdated = ps.executeUpdate();
        ps.close();
        conn.close();
        out.println("Successfully vote registered!");
        %>
        <br>
        <a href="index.jsp">Home</a>
        <%

        
    } catch (SQLException | ClassNotFoundException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    
%>

<html>
    <head>
        <style>
            .message{
                font-size: 20px;
            }
        </style>
    </head>
    <% 
    String message=request.getParameter("msg");
    if(message!=null){
    %>
    <p class="message"><%=message%></p>
    <%
    }
    %>
</html>
