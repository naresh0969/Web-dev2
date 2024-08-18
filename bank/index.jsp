<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><style>

.myButton{
font-size:32px;
}
</style></head>
<body>
<br><br><br><br><br><br><br><br>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "banking_system";
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
String name="";
String balance="";
String id="";
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from accounts";
resultSet = statement.executeQuery(sql);
%>

<table border="1" cellspacing="0">
    <tr align="center">
        <td><b>Account No.</b></td>
        <td><b>Name </b></td>
        <td><b>Balance</b></td>
    </tr>

<%
while(resultSet.next()){
name=resultSet.getString("account_holder_name");
id=resultSet.getString("account_id");
balance=resultSet.getString("account_balance");


%>
    <tr>
        <td ><input type=text class="myTextBox" name=mfrom id=mfrom value="<%=id%>" readonly></td>
        <td><input type=text class="myTextBox" name=mto id=mto value="<%=name%>" readonly></td>
        <td><input type=text class="myTextBox" name=subj id=subj value="<%=balance%>" readonly></td>
    </tr>
    <br>
</table>
<%


}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>


    <br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="addAmount.jsp">Deposit</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="payAmount.jsp">Withdraw</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 


</body></html>

