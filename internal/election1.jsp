<!DOCTYPE html>
<html>
<head>
    <style>
        .myTextbox {
            font-size: 32px;
            size: 30px;
        }
    </style>
</head>
<body>
<%
    String str = request.getParameter("msg");
    if (str != null) {
        out.println("<p><font size='32' color='red'>" + str + "</font></p>");
    }
%>
<br><br><br><br><br><br><br><br>
<form name="f1" method="post" action="election.jsp">
    <table align="center" width="50%">
        <tr>
            <td>
                <input type="submit" name="action" value="Start Election">
                <input type="submit" name="action" value="Stop Election">
            </td>
        </tr>
    </table>
</form>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>

<%
    String action = request.getParameter("action");
    if (action != null) {
        String driver = "com.mysql.cj.jdbc.Driver"; // Updated driver class name for MySQL Connector/J 8
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "internal";
        String userid = "naresh";
        String password = "naresh0969";
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        Connection connection = null;
        Statement statement = null;
        
        try {
            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            statement = connection.createStatement();
            String sql = "";
            String message = "";
            
            if ("Start Election".equals(action)) {
                sql = "UPDATE election SET status = 1 WHERE point = 1";
                message = "Election Started";
            } else if ("Stop Election".equals(action)) {
                sql = "UPDATE election SET status = 0 WHERE point = 1";
                message = "Election Stopped";
            }
            
            int rowsAffected = statement.executeUpdate(sql);
            if (rowsAffected > 0) {
                response.sendRedirect("election.jsp?msg=" + message);
            } else {
                out.println("Error: No rows affected.");
            }
            
            connection.close();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
%>
</body>
</html>
