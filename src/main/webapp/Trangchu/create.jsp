<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
</head>
<body>
    <h2>Đăng ký tài khoản mới</h2>

    <%
        String error = request.getParameter("error");
        if (error != null) {
            switch (error) {
                case "1":
                    out.println("<p style='color:red;'>Tài khoản đã tồn tại!</p>");
                    break;
                case "2":
                    out.println("<p style='color:red;'>Lỗi khi lưu dữ liệu vào cơ sở dữ liệu!</p>");
                    break;
                case "3":
                    out.println("<p style='color:red;'>Lỗi kết nối cơ sở dữ liệu!</p>");
                    break;
                case "4":
                    out.println("<p style='color:red;'>Mật khẩu không khớp!</p>");
                    break;
            }
        }
    %>

    <form action="dangki" method="POST"> <!-- Ensure this matches your servlet mapping -->
        <label for="username">Tài khoản:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required><br><br>

        <label for="confirmPassword">Xác nhận mật khẩu:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>

        <input type="submit" value="Đăng ký">
    </form>
</body>
</html>
