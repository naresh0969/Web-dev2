<%@ page import="java.sql.*" %>
<%@ page import="java.util.Optional" %>
<%
    String senderId = request.getParameter("sender_account_id");
    String amountStr = request.getParameter("amount");
    double amount = Double.parseDouble(amountStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "naresh", "naresh0969");
            con.setAutoCommit(false); // Start transaction

            Statement stmt = con.createStatement();

            // Check sender's balance
            String checkBalanceQuery = "SELECT account_balance FROM accounts WHERE account_id = " + senderId;
            ResultSet rsSender = stmt.executeQuery(checkBalanceQuery);
            if (rsSender.next()) {
                double senderBalance = rsSender.getDouble("account_balance");
                if (senderBalance >= amount) {
                    // Deduct amount from sender
                    String deductQuery = "UPDATE accounts SET account_balance = account_balance - " + amount + " WHERE account_id = " + senderId;
                    int rowsUpdated = stmt.executeUpdate(deductQuery);

                    if (rowsUpdated > 0) {
                        con.commit(); // Commit transaction
                        out.println("Withdraw successfully!");
                    } else {
                        con.rollback(); // Rollback transaction if receiver update fails
                        out.println("Error: Receiver account not found.");
                    }
                } else {
                    out.println("Insufficient balance in sender's account.");
                }
            } else {
                out.println("Sender account not found.");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred: " + e.getMessage());
        }
    

%>
<html>
    <head></head>
    <body>
        <br>
      <a href="index.jsp">Home</a>  
    </body>
</html>
