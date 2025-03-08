package Taikhoan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class dangnhap extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

      
        if ("admin".equals(username) && "123".equals(password)) {
          
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", "admin"); 
            response.sendRedirect("listVattu.jsp"); 
        } else if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
         
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("trangchu.jsp"); 
        } else {
    
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
 }


