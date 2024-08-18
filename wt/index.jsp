<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course</title>
</head>
<body>

    <form action="index.jsp" method="post">
        <table align="center">
            <tr>
                <td>
                    <select name="course" id="course" onchange="this.form.submit()">
                        <option value="select" selected disabled>Select Course</option>
                        <option value="cse">CSE</option>
                        <option value="ece">ECE</option>
                    </select>
                </td>
            </tr>
        </table>
    </form>

    <form action="saveSelection.jsp" method="post">
    <%
    try {
        String value = request.getParameter("course");
        if (value != null && !value.equals("select")) {
            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            String sql = "SELECT * FROM faculty WHERE branch = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, value);
            resultSet = preparedStatement.executeQuery();
    %>
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
    <%
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
    </form>
</body>
</html>
