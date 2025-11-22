<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<html>
<body>
<h2>Books List</h2>
<%
    try (Connection conn = DBConnection.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM books");

        while(rs.next()) {
            out.println("ID: " + rs.getInt("id") + ", Name: " + rs.getString("title") + ", Author: " + rs.getString("author") + "<br>");
        }
    } catch(SQLException e) {
        out.println("Database error: " + e.getMessage());
    }
%>
</body>
</html>
