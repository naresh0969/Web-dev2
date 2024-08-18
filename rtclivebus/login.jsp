
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String entered_username = request.getParameter("username");
String entered_password = request.getParameter("password");
boolean userExists = false;

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rtclivebus", "naresh", "naresh0969");
    PreparedStatement pst = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
    pst.setString(1, entered_username);
    pst.setString(2, entered_password);
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
        // Username and password combination exists in the database
        userExists = true;
    }
    
    rs.close();
    pst.close();
    conn.close();
} catch(Exception e) {
    e.printStackTrace();
}

if (userExists) {
    // User exists in the database, redirect to a welcome page or perform any other action
    response.sendRedirect("welcome.jsp");
    //out.print("Welcome "+entered_username);
} else {
    // User does not exist in the database, redirect back to the login page with an error message
    //response.sendRedirect("login.jsp?error=invalid");
    out.print("<center>Account not found! <br> <button onclick=\"window.location.href='index.html'\">Go Back</button> </center>");

}
%>
