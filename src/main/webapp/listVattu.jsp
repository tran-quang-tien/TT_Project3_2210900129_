<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Vattu.Vattumodel" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Vật tư</title>
</head>
<body>
    <%
        // Kiểm tra xem người dùng có phải là admin không
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("admin")) {
            // Nếu không phải admin, chuyển về trang chủ
            response.sendRedirect("trangchu.jsp");
        }
    %>

    <h1>Danh Sách Vật Tư</h1>
    <a href="addvattu">Thêm Vật Tư</a>
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
                <a href="editvattu?id=<%= vattu.getId() %>">Chỉnh Sửa</a>
                <a href="deletevattu?id=<%= vattu.getId() %>" onclick="return confirm('Bạn có chắc chắn muốn xóa vật tư này không?');">Xóa</a>
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
