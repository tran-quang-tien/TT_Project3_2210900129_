<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <style>
        /* CSS cho Header */
        header {
            width: 100%;
            position: fixed;
            top: 0;
            right: 0;
            padding: 10px;
            background-color: #333;
            color: white;
            text-align: right;
        }
        
        header a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }

        header a:hover {
            color: #f1c40f;
        }

        .content {
            padding-top: 60px;
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
   
    <header>
        <%
     
    
            if (session == null || session.getAttribute("username") == null) {
        %>
            <a href="login.jsp">Đăng nhập</a> |
        <%
            } else {
        %>
            <p>Chào, <%= session.getAttribute("username") %>!</p>
            <a href="logout">Đăng xuất</a>
        <%
            }
        %>
    </header>


    <div class="content">
        <h1>Chào mừng đến với Cửa hàng của chúng tôi!</h1>
        <p>Đây là nơi bạn có thể tìm thấy các sản phẩm tuyệt vời. Vui lòng đăng nhập để tiếp tục mua sắm.</p>
    </div>
</body>
</html>
