<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
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
        *{
        text-align:center;
        }
        th,td{
        font-size:32px;
        }
        

        </style>
    </head>
<body>

<%
try{
    int flag=0;
    String uid=request.getParameter("id");
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from students";
    resultSet = statement.executeQuery(sql);

    %>
    <table border="1" align="center">
        <tr>
            <td>Id</td>
            <td>Name</td>
        </tr>
    <%
    while(resultSet.next()){
    String userId = resultSet.getString("id");
    String userName= resultSet.getString("name");
    %>
    <tr>
        <td><%=userId%></td>
        <td><%=userName%></td>
    </tr>
    <%

    }
    %>
    </table>

<%    
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

</body>
</html>
