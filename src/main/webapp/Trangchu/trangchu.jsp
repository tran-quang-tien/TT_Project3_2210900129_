<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
</head>
<body>
    <h1>Chào mừng đến với trang chủ!</h1>
    <%
        String username = (String) session.getAttribute("username");
        if (username != null) {
            out.println("<p>Chào, " + username + "!</p>");
        } else {
            out.println("<p>Vui lòng đăng nhập để tiếp tục.</p>");
        }
    %>

    <a href="login.jsp">Đăng nhập</a>
</body>
</html>
