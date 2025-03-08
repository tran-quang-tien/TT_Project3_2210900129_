
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
</head>
<body>
    <h2>Đăng nhập</h2>

    <%
    
        String error = request.getParameter("error");
        if (error != null && error.equals("Invalid credentials")) {
            out.println("<p style='color:red;'>Tài khoản hoặc mật khẩu không đúng!</p>");
        }
    %>

    <form action="login" method="POST">
        <label for="username">Tài khoản:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Đăng nhập"><p>Chưa có tài khoản? <a href="create.jsp">Đăng ký ngay</a></p>
    </form>
</body>
</html>
