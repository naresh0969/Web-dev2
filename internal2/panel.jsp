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

    </style>
</head>
<body>

    
          <% 
          try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            int flag = 0;
          %>
          <form action="showData.jsp">

            <div class="input">
              <select name="chose" id="chose">
                <option value="cse">CSE</option>
                <option value="ECE">ECE</option>
              </select>

              <button type="submit">Get Data</button>
            </div>
        
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
              </tr>
            <%
            String data[] = request.getParameterValues("faculty");
            
            
            for(int i=0;i<data.length;i++)
            {
              int id = Integer.parseInt(data[i]);
              
               String sql = "select * from faculty where fid = '"+id+"'";
               resultSet= statement.executeQuery(sql);
               while(resultSet.next()){
                flag = 1;
                %>
                
               <tr>
                <td><%=resultSet.getInt("fid")%></td>
                <td><%=resultSet.getString("fname")%></td>
                <td><%=resultSet.getString("branch")%></td>
               </tr>
               <%}
              } 
              %>
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
        <a href="./showData.jsp">Back</a>
      </section>
    </div>
</body>

<script>

</script>
</html>