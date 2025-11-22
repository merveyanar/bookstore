<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<html>
<body>
<h2>Users List</h2>
<%
    try (Connection conn = DBConnection.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users");

        while(rs.next()) {
            out.println("ID: " + rs.getInt("id") + ", Name: " + rs.getString("username") + ", Password: " + rs.getString("password") + "<br>");
        }
    } catch(SQLException e) {
        out.println("Database error: " + e.getMessage());
    }
%>
</body>
</html>
