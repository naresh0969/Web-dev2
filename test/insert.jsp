<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String uid=request.getParameter("uid");
String uname=request.getParameter("uname");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/naresh", "naresh", "naresh0969");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into students(id,name)values('"+uid+"','"+uname+"')");
        response.sendRedirect("login.jsp?mes=data inserted Successfully");
        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>
