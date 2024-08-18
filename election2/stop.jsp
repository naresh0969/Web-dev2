<%
    int caste = Integer.parseInt(request.getParameter("start"));

    if(caste == 1)
    {
        session.setAttribute("go","1");
        session.setAttribute("message","Election Started!");
        response.sendRedirect("electionStatus.jsp");
        return;
    }
    else{
        session.setAttribute("go","0");
        %>
            <p>Elections not Yet Started</p>
            
            <%@ page language="java" contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8"%>
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.servlet.*" %>
            <%@ page import="javax.servlet.http.*" %>
            <%
                String dbUrl = "jdbc:mysql://localhost:3306/election";
                String dbUser = "naresh";
                String dbPassword = "naresh0969";
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    String updateQuery = "UPDATE users SET voted = 0 WHERE voted = 1";
                    PreparedStatement ps = conn.prepareStatement(updateQuery);
                    int rowsUpdated = ps.executeUpdate();
                    ps.close();
                    conn.close();
                    session.setAttribute("message","Election not Yet Started!");
                    response.sendRedirect("electionStatus.jsp");

                    
                } catch (SQLException | ClassNotFoundException e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
                
            %>

        <%}

%>