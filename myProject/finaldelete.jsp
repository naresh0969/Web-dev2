
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

int mid;

String deleteList[]=request.getParameterValues("deleteList");
try
{int i=0;
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject", "root", "PHW#84#vijay");
           Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
           Statement st=conn.createStatement();
           for(int n=0;n<deleteList.length;n++){
            mid=Integer.parseInt(deleteList[n]);
             String sql="delete from users where id="+mid;
             i=st.executeUpdate(sql);
           }
          
        if(i>0)
           response.sendRedirect("RetrieveData.jsp");
           else
        out.println("<center><b>Error deleting User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>