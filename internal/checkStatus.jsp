<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "internal";
String userid = "naresh";
String password = "naresh0969";
boolean electionStarted = false;

try {
    Class.forName(driver);
    Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    Statement statement = connection.createStatement();
    String sql = "SELECT status FROM election WHERE point = 1";
    ResultSet resultSet = statement.executeQuery(sql);

    if (resultSet.next()) {
        electionStarted = resultSet.getInt("status") == 1;
    }

    connection.close();
} catch (Exception e) {
    out.println(e.getMessage());
}
request.setAttribute("electionStarted", electionStarted);
%>
