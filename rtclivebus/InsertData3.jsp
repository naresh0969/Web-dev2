<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String user_name=request.getParameter("uname");
String user_password=request.getParameter("password");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rtclivebus", "naresh", "naresh0969");
           PreparedStatement pst = conn.prepareStatement("insert into users(username, password) values (?, ?)");
            pst.setString(1, user_name);
            pst.setString(2, user_password);
            int i = pst.executeUpdate();
            
            out.println("<center><b>Record inserted successfully!</b></center>");
            out.println("<center><button  style=\"background-color: #4CAF50; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;\" onclick=\"window.location.href='index.html'\">Log in</button></center>");


        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>