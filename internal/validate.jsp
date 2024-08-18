<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
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
<head><style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style></head>
<body>

<%
try{
int flag=0;
String uid=request.getParameter("uname");
String uname=request.getParameter("pwd");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from citizen where name='"+uid+"' and password='"+uname+"'";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
    flag=1;
}
if(flag==1){
session.setAttribute("names",uid);
    response.sendRedirect("cast.jsp");
}
else{
    response.sendRedirect("login.jsp?msg='invalid Credentials!'");
}
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

</body>
</html>
