<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.io.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean electionsStarted = false;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
       
        Class.forName("com.mysql.jdbc.Driver");

        
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elections_db", "root", "PHW#84#jeor");

        // Check the election status
        stmt = conn.createStatement();
        String electionStatusQuery = "SELECT status FROM election_status WHERE id = 1";
        rs = stmt.executeQuery(electionStatusQuery);

        if (rs.next()) {
            electionsStarted = rs.getBoolean("status");
        }

        if (electionsStarted) {
          
            String loginQuery = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
            rs = stmt.executeQuery(loginQuery);

            if (rs.next()) {
               
                session.setAttribute("username", username);
                response.sendRedirect("voting.jsp?");
            } else {
              
                out.println("Login failed. Please check your credentials.");
            }
        } else {
          
            out.println("Elections have not started yet.");
        }

    } catch (ClassNotFoundException e) {
        out.println("Error: MySQL JDBC driver not found.");
    } catch (SQLException e) {
        out.println("Error in SQL: " + e.getMessage());
    } finally {
        
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>

