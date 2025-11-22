package servlet;


import dao.DBConnection;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String> users = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");

            while(rs.next()) {
                String user = "ID: " + rs.getInt("id") + ", Name: " + rs.getString("username") +
                        ", Password: " + rs.getString("password");
                users.add(user);
            }

        } catch(SQLException e) {
        //    e.printStackTrace();
        }

        request.setAttribute("usersList", users);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

