<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int mid;
int i = 0;
String selectedList[] = request.getParameterValues("selectedFaculty");
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/naresh", "naresh", "naresh0969");
    Statement st = conn.createStatement();
    for (int n = 0; n < selectedList.length; n++) {
        mid = Integer.parseInt(selectedList[n]);
        i = st.executeUpdate("update faculty set choose='1' where id='" + mid + "'");
    }

    if (i > 0)
        response.sendRedirect("f1.jsp");
    else
        out.println("<center><b>Error updating User. Try Again!</b></center>");
} catch (Exception e) {
    System.out.print(e);
    e.printStackTrace();
}
%>
