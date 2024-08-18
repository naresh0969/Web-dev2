<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "it";
String userid = "root";
String password = "*Ramu@2003#";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null; 

String dept = "";
if(request.getParameter("dept") != null)
{
  dept = request.getParameter("dept");
} 

String branch = "";
if(request.getParameter("branch") != null){
  branch = request.getParameter("branch");
};

try {
  Class.forName(driver);
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement = connection.createStatement();


  <!-- if(request.getParameterValues("SelectList") == null)
  {
    String sql = "update faculty set selected=0 where branch == '"+branch+"'";
    int rs = statement.executeUpdate(sql);
  } -->

  if(request.getParameterValues("SelectList") != null){

    String ids[] = request.getParameterValues("SelectList");
    for(int i = 0; i < ids.length ; i++)
    {
      int id = Integer.parseInt(ids[i]);
      out.println("id = " +id);
      String sql = "update faculty set selected=0 where branch != '"+branch+"'and id != '"+id+"' ";
      int rs = statement.executeUpdate(sql);
      sql = "update faculty set selected=1 where id='"+id+"'";
      rs = statement.executeUpdate(sql);
    }

  }
} 
catch (ClassNotFoundException e) {
  out.println(e.getMessage());
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>

  <style>
    body{
      width: 100vw;
      height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    input[type="checkbox"]{
      width: 20px;
      height: 20px;
    }

    *{
      overflow: hidden;
    }
    table{
      width: 100vw;
      border: 1px solid black;
    }
    tr,td,th{
      width: 100vw;
      border: 1px solid black;
    }

    .container1{
      flex: 0.2;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    .content{
      flex: 0.8;
    }
  </style>
</head>

<body>
  <div class="container1">
        <h2>Select Branch</h2>
    <form action="home.jsp" name="Branch">
       <select name="branch" id="branch" onchange="handleChange()">
        <option value="none">Select</option>
         <option value="cse" <% if (dept.equals("cse") || branch.equals("cse")) { out.print("selected"); } %>>CSE</option>
         <option value="ece" <% if (dept.equals("ece") || branch.equals("ece")) { out.print("selected"); } %>>ECE</option> 
      </select>


  </div>
  <div class="content">
    <table>
      <tr>
        <th>FID</th>
        <th>Fname</th>
        <th>Branch</th>
        <td>Select</td>
      </tr>

      <%
      if(branch != null){
        try{
          connection = DriverManager.getConnection(connectionUrl+database,userid,password);

          statement = connection.createStatement();
          String sql = "select * from faculty where branch='"+branch+"'";
          resultSet = statement.executeQuery(sql);

          while (resultSet.next())
          {
            int selected = resultSet.getInt("selected");
            int id = resultSet.getInt("id");
            %>
              <tr>
                <td><%=resultSet.getInt("id") %></td>
                <td><%=resultSet.getString("name") %></td>
                <td><%= resultSet.getString("branch") %></td>
                <td><input type="checkbox" name="SelectList" class="selectlist" id="SelectList" value="<%=id%>" <% if(selected == 1){out.println("checked");} %>></td>
              </tr>
            <%
          }
        }
        catch (Exception e)
        {
          out.println(e.getMessage());
        }
      }
      %>
    </form>
    </table>
    <a href="./showPanel.jsp?branch=<%=branch%>">Show Panel</a>
  </div>
</body>

<script>
  function handleChange()
  {
    print();
    document.Branch.submit();
  }

  function print(){
    var data = document.getElementsByClassName("classlist");
    for(var i=0; i<data.length; i++)
    {
      alert(data[i].value);
    }
  }

  function handleClick(){
    document.Branch.submit();
    window.location.href = "'";
  }
</script>
</html>