<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "naresh";
String userid = "naresh";
String password = "naresh0969";
try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
    String value = request.getParameter("course");
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String sql = "SELECT * FROM faculty WHERE choose ='1' ";
    resultSet = statement.executeQuery(sql);
    %>
    <table border="1" align="center">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>branch</th>
        </tr>


    <%
    while(resultSet.next()){
    %>
        <tr>
            <td><%= resultSet.getString("id") %></td>
            <td><%= resultSet.getString("name") %></td>
            <td><%= resultSet.getString("branch") %></td>
        </tr>
    <%

    }

} catch (Exception e) {
    out.println(e.getMessage());
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
