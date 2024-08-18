<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html><head><style>
th,td{
font-size:32px;
width:32px;
}
.myCheckBox{font-size:32px;
width:48px;
}
.myButton{font-size:32px;

}
</style></head><body>
    <form action="index.jsp">
<center><h1>selected faculty</h1></center><br>
<table border="1" align="center" width="60%">
<tr>
<th>Id</th>
<th>Name</th>
<th>branch</th>
</tr>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "faculty";
String userid = "root";
String password = "root";
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
String sql ="select * from faculty_details where check_status='1'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name")%></a></td>
<td><%=resultSet.getString("branch")%></td>

</tr><%
}
%>
</table>
</form>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>