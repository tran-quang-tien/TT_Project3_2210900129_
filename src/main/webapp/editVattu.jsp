<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="Vattu.Vattumodel" %>
<html>
<head>
    <title>Sửa Vật Tư</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9f7ef;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            padding: 20px;
        }

        form {
            width: 60%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 14px;
            margin: 8px 0;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Sửa Vật Tư</h1>
    <form action="VattuEditServlet" method="post">
        <input type="hidden" name="TT_id_do_Chinh" value="<%= request.getAttribute("vattu") != null ? ((Vattumodel) request.getAttribute("vattu")).getId() : "" %>">
        
        <label for="TT_Ten_Do">Tên Vật Tư:</label><br>
        <input type="text" id="TT_Ten_Do" name="TT_Ten_Do" value="<%= request.getAttribute("vattu") != null ? ((Vattumodel) request.getAttribute("vattu")).getTenDo() : "" %>" required><br>
        
        <label for="TT_Phan_Loai">Phân Loại:</label><br>
        <input type="text" id="TT_Phan_Loai" name="TT_Phan_Loai" value="<%= request.getAttribute("vattu") != null ? ((Vattumodel) request.getAttribute("vattu")).getPhanLoai() : "" %>" required><br>
        
        <label for="TT_Gia">Giá:</label><br>
        <input type="number" id="TT_Gia" name="TT_Gia" value="<%= request.getAttribute("vattu") != null ? ((Vattumodel) request.getAttribute("vattu")).getGia() : "" %>" required><br>
        
        <label for="TT_SoLuong">Số Lượng:</label><br>
        <input type="number" id="TT_SoLuong" name="TT_SoLuong" value="<%= request.getAttribute("vattu") != null ? ((Vattumodel) request.getAttribute("vattu")).getSoLuong() : "" %>" required><br>
        
        <button type="submit">Cập Nhật Vật Tư</button>
    </form>
    <a href="VattuServlet">Quay lại danh sách</a>
</body>
</html>
