<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
String emailid = request.getParameter("uname");  // Changed from 'id' to 'emailid' for consistency
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "finance";
String userid = "naresh";
String password = "naresh0969";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}

Connection connection = null;
PreparedStatement preparedStatement = null;

%>
<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            text-align: center;
        }
        th, td {
            font-size: 32px;
        }
    </style>
</head>
<body>

<%
try {
    int flag = 0;
    String user = (String) session.getAttribute("status");
    float amount = Float.parseFloat(request.getParameter("amt"));  // Correct conversion
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);

    String sql = "UPDATE users SET balance = ? WHERE email = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setFloat(1, amount);  // Setting the amount parameter
    preparedStatement.setString(2, emailid);  // Setting the emailid parameter

    int rowsUpdated = preparedStatement.executeUpdate();  // Execute update

    if (rowsUpdated > 0) {
        response.sendRedirect("profile.jsp?pass=Success,");
    } else {
        response.sendRedirect("profile.jsp?pass=Retry!");
    }
} catch (SQLException e) {
    out.println("SQL Exception: " + e.getMessage());
} catch (Exception e) {
    out.println("Exception: " + e.getMessage());
} finally {
    try {
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
