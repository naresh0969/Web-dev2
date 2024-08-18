<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("username"));
String user_name=request.getParameter("password");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myProject", "naresh", "naresh0969");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(username,password)values("+user_id+",'"+user_name+"')");
        out.println("<center><b>Data is successfully inserted!</center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>