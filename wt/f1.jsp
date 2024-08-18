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
    String sql = "SELECT * FROM faculty WHERE branch ='" + value + "'";
    resultSet = statement.executeQuery(sql);
%>
<form action="f1.jsp" method="post" name="form1">
    <table>
        <tr>
            <td>
                <select name="course" id="course" onchange="course()">
                    <option value="select course" selected disabled>Select Course</option>
                    <option value="cse">CSE</option>
                    <option value="ece">ECE</option>
                </select>
            </td>
        </tr>
    </table>
</form>
<form action="selected.jsp" method="post">
<table border="1" align="center">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>branch</th>
        <th>select</th>
    </tr>
    <%
    while (resultSet.next()) {
        String uid = resultSet.getString("id");
        String uname = resultSet.getString("name");
        String ubranch = resultSet.getString("branch");
    %>
    <tr>
        <td><%= uid %></td>
        <td><%= uname %></td>
        <td><%= ubranch %></td>
        <td><input type="checkbox" name="selectedFaculty" value="<%= uid %>"></td>
    </tr>
    <%
    }
%>
    <tr>
        <td colspan="4" align="center">
            <input type="submit" value="Submit">
        </td>
    </tr>
</table>
</form>
<form action="show.jsp" method="post">
    <input type="submit" value="show">
</form>
<%
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
