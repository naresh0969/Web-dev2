

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>


<%
 

    try {
    
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elections_db", "root", "PHW#84#jeor");

        
        Statement stmt = conn.createStatement();
        int rs = stmt.executeUpdate("update election_status set status = 0");
        %>
        <h1>stoped successfully</h1>
        <%


        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>