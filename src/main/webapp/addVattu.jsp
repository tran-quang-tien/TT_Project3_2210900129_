<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Thêm Vật Tư</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            padding: 20px;
        }

        form {
            width: 50%;
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

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
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
    <h1>Thêm Vật Tư</h1>
    <form action="VattuAddServlet" method="POST">
        <label for="TT_Ten_Do">Tên Đồ:</label>
        <input type="text" id="TT_Ten_Do" name="TT_Ten_Do" required><br>

        <label for="TT_Phan_Loai">Phân Loại:</label>
        <input type="text" id="TT_Phan_Loai" name="TT_Phan_Loai" required><br>

        <label for="TT_Gia">Giá:</label>
        <input type="number" id="TT_Gia" name="TT_Gia" required><br>

        <label for="TT_SoLuong">Số Lượng:</label>
        <input type="number" id="TT_SoLuong" name="TT_SoLuong" required><br>

        <input type="submit" value="Thêm Vật Tư">
    </form>
    <a href="VattuServlet">Quay lại danh sách</a>
</body>
</html>
