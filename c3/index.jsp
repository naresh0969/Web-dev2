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
.branchinputs{
    display: inline;
}
div{
    margin-left: 30%;
}
</style></head><body>
    <center>
    <form action="index.jsp">
    <select name="branch" id="dropdownbox">
        <option value="-">--enter branch--</option>
        <option value="cse">cse</option>
        <option value="ece">ece</option>
        <option value="eee">eee</option>
    </select>
      <input type="submit" value="show details">
    </div>
        </center>
        <br><br><br><br>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Name</th>
<th>select</th>
</tr>
<%
String branch = request.getParameter("branch");
String[] selectList=request.getParameterValues("selected");
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
if(branch!=null){
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from faculty_details where branch='"+branch+"' ";
if(selectList !=null){
for(String id:selectList){
String sql2 =" update faculty_details set check_status='1' where id="+id;
int n =statement.executeUpdate(sql2);
}
}
resultSet = statement.executeQuery(sql);
int id;
while(resultSet.next()){
id=Integer.parseInt(resultSet.getString("id"));
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name")%></td>
<td align=center><input type=checkbox class="myCheckBox" name="selected" value="<%=id%>" onchange="f1()"></td>

</tr><%
}
%>
</table>
</form>
<br><br><br>
<center>
<form action="show_faculty.jsp"><input type="submit" value="selected faculty"></form>
</center>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
}
%>