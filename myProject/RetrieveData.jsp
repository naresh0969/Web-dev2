<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String pwd = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "MyProject";
String userid = "root";
String password = "PHW#84#jeor";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
int flag=0;
<!-- %>
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
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Name</th>

</tr>
<% -->
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where id="+user_id+" and name='"+pwd+"'";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
    flag=1;

    
<!-- %>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>


</tr>
<% -->
}
if(flag){
    response.sendRedirect("");
}
else{
    response.sendRedirect("login.jsp?msg='invalid'");
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
<!-- </table> 

</body>
</html> -->











