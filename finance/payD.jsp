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
float total;
float amount=Float.parseFloat(request.getParameter("amount"));
String receive=request.getParameter("receiver");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where email='"+receive+"' ";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
    flag=1;
    total=resultSet.getFloat("balance");
}
if(flag==1){
    if(total-amount >= 0){
        response.sendRedirect("payI.jsp?pass1=receive,pass2=amount");

    }
    else{
        response.sendRedirect("pay.jsp?fail=Insufficient Balance");

    }

}
else{
    response.sendRedirect("pay.jsp?fail=invalid id!");
}
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

</body>
</html>
