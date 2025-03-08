package Taikhoan;

import java.io.IOException;
// Thêm các thư viện JDBC
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dangki")  // or @WebServlet("/Trangchu/dangki") depending on your URL structure
public class dangkitaikhoan extends HttpServlet {
    // Cấu hình thông tin kết nối cơ sở dữ liệu
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tt_project3_2210900129";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu
        if (password.equals(confirmPassword)) {
            try {
                // Kết nối đến cơ sở dữ liệu
                Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // Kiểm tra xem tài khoản đã tồn tại chưa
                String checkUserQuery = "SELECT * FROM taikhoan WHERE TT_TaiKhoan = ?";
                PreparedStatement checkStmt = con.prepareStatement(checkUserQuery);
                checkStmt.setString(1, username);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    // Tài khoản đã tồn tại
                    response.sendRedirect("create.jsp?error=1");
                } else {
                    // Thêm tài khoản mới vào cơ sở dữ liệu
                    String insertQuery = "INSERT INTO taikhoan (TT_TaiKhoan, TT_Mat_Khau) VALUES (?, ?)";
                    PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                    insertStmt.setString(1, username);
                    insertStmt.setString(2, password);

                    int result = insertStmt.executeUpdate();
                    if (result > 0) {
                        // Đăng ký thành công
                        response.sendRedirect("login.jsp?message=Registration successful");
                    } else {
                        // Lỗi khi lưu dữ liệu
                        response.sendRedirect("create.jsp?error=2");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("create.jsp?error=3");
            }
        } else {
            // Mật khẩu không khớp
            response.sendRedirect("create.jsp?error=4");
        }
    }
}

