<html>
<head><style>
.myTextbox{
    font-size: 32px;
    size: 30px;
}
</style></head>
<body>
<%
String str=request.getParameter("msg");
if(str!=null)
    out.println("<p><font size=32 color=red>"+str+"</font></p>");
%>
<br><br><br><br><br><br><br><br>
<form name="f1" action="election.jsp">
<table align="center" width="50%">

<tr>
    <td><input type="submit" value="Start Election">
        <input type="submit" value="Stop Election"></td>
</tr>
</table>
</form>
</body>
</html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
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
ResultSet resultSet = null;



try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="UPDATE election SET status = 1 WHERE point = 1 ";


connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
