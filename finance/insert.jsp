<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("uname");
String mail=request.getParameter("umail");
String password=request.getParameter("upwd");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finance", "naresh", "naresh0969");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(email,password,name)values('"+mail+"','"+password+"','"+name+"')");
        response.sendRedirect("index.jsp?pass= Registered Successfully");
        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>
