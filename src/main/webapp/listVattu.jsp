<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Vattu.Vattumodel" %>
<html>
<head>
    <title>Danh Sách Vật Tư</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            padding: 20px 0;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        a:hover {
            color: #45a049;
        }
        
        .actions {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <h1>Danh Sách Vật Tư</h1>
    <a href="VattuAddServlet">Thêm Vật Tư</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Phân Loại</th>
            <th>Giá</th>
            <th>Số Lượng</th>
            <th>Hành Động</th>
        </tr>
        <% 
            List<Vattumodel> vattus = (List<Vattumodel>) request.getAttribute("vattus");
            if (vattus != null && !vattus.isEmpty()) {
                for (Vattumodel vattu : vattus) {
        %>
        <tr>
            <td><%= vattu.getId() %></td>
            <td><%= vattu.getTenDo() %></td>
            <td><%= vattu.getPhanLoai() %></td>
            <td><%= vattu.getGia() %></td>
            <td><%= vattu.getSoLuong() %></td>
            <td class="actions">
                <a href="VattuEditServlet?id=<%= vattu.getId() %>">Chỉnh Sửa</a>
                <a href="VattuDeleteServlet?id=<%= vattu.getId() %>" onclick="return confirm('Bạn có chắc chắn muốn xóa vật tư này không?');">Xóa</a>
            </td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr><td colspan="6">Không có vật tư nào trong cơ sở dữ liệu!</td></tr>
        <% 
            }
        %>
    </table>
</body>
</html>
