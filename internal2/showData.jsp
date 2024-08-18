<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hallticket";
String userid = "root";
String password = "*Ramu@2003#";
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
      table{
        width: 100vw;
        border: 1px solid black;
      }
      tr,td{
        border: 1px solid black;
      }

      .input{
        width: 100vw;
        display: flex;
        justify-content: center;
        gap: 20px;
        margin: 20px;
      }

      input[type="checkbox"]{
        width: 25px;
        height: 25px;
      }

      .btn{
        width: 100px;
        padding: 10px;
        border: 1px solid black;
      }

      a{
        text-decoration: none;
        color: black;
        width: 100px;
        padding: 10px;
        border: 1px solid black;
        border-radius: 2px;
        margin: 40px;
      }
    </style>
</head>
<body>

    
          <% 
          try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String b = request.getParameter("chose");
            String sql = "select * from faculty where branch='"+b+"'";
            resultSet= statement.executeQuery(sql);
            int flag = 0;
          %>

          <form action="showData.jsp">
            <div class="input">
              <select name="chose" id="chose" onchange="handleChange()">
                <option value="cse">CSE</option>
                <option value="ECE">ECE</option>
              </select>

              <button onclick="">Get Data</button>
            </div>
          </form>


          <form action="./panel.jsp">
            <table>
              <tr>
                <th>
                  Fid 
                </th>
                <th>
                  Fname
                </th>
                <th>
                  Branch
                </th>
                <th>
                    select
                </th>
              </tr>
            <%
            while(resultSet.next())
            {
              int id = resultSet.getInt("fid");
              flag = 1;
              %>

                <tr>
                  <td><%=resultSet.getInt("fid")%></td>
                  <td><%=resultSet.getString("fname")%></td>
                  <td><%=resultSet.getString("Branch")%></td>
                  <td><input type="checkbox" name="faculty" value='<%=id%>'></td>
                </tr>
              
            
            <%}%>
            <button type="submit">Show Panel</button>
              </form>
              
          </table>
          <%

            if(flag == 0)
            {
              out.println("Empty");
            }
            connection.close();
          }
          catch(Exception e){
              out.println(e.getMessage());
          }
          %>
        </div>
      </section>
    </div>
</body>


</html>