<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mail";
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
String mto = request.getParameter("mto");
String subject = "OTP Verification";
String msg = request.getParameter("otp").toString();
String mfrom = "OTP CENTER"; 

int flag = 0;

try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String sql ="insert into mails(mfrom,mto,subject,content,inbox,sentbox) values('"+mfrom+"','"+mto+"','"+subject+"','"+msg+"',1,1)";
  int insertedRows = statement.executeUpdate(sql);
  
  if(insertedRows >= 1)
  {
    flag = 1;
    response.sendRedirect("./home.html?msg='successfully sent'");
  }
  else{
    response.sendRedirect("./home.html?msg='failed to send'");
  }
  connection.close();
  }
  catch(Exception e){
      out.println(e.getMessage());
  }
  %>