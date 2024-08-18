<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
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
String userName="";
String emailid=request.getParameter("email");
String pwd=request.getParameter("password");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where email='"+emailid+"' and password='"+pwd+"' ";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
    userName=resultSet.getString("name");
    flag=1;
}
if(flag==1){
    session.setAttribute("uname",userName);
    session.setAttribute("status",emailid);
    response.sendRedirect("profile.jsp?pass=Welcome,");
}
else{
    response.sendRedirect("index.jsp?fail=invalid Credentials!");
}
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

</body>
</html>
