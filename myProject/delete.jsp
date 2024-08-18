<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "myproject";
String userid = "root";
String password = "PHW#84#vijay";
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
<head><style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style></head>
<form action="finaldelete.jsp" method="post">
<body>

<h1>Select the data which you want delete</h1>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Name</th>
<th ><input type="submit" value="delete"></th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users";
resultSet = statement.executeQuery(sql);
int mid;
while(resultSet.next()){
    mid=Integer.parseInt(resultSet.getString("id"));
%>

<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td align=center><input type=checkbox class="myCheckBox"  name="deleteList" value="<%=mid%>"></td>

</tr>

<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
    

</body>
</form>
</html>