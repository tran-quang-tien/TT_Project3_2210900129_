package Vattu;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VattuServlet")
public class vattu extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private connectsql vattuDAO;

    public vattu() {
        super();
        vattuDAO = new connectsql();  // Đảm bảo connectsql được khởi tạo đúng
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách vật tư từ DAO
        List<Vattumodel> vattus = vattuDAO.getAllVattu();

        // Kiểm tra xem dữ liệu có được trả về hay không
        if (vattus == null || vattus.isEmpty()) {
            System.out.println("Không có vật tư nào trong cơ sở dữ liệu!");
        } else {
            System.out.println("Số lượng vật tư: " + vattus.size());
        }

        // Đưa danh sách vật tư vào request để JSP sử dụng
        request.setAttribute("vattus", vattus);

        // Chuyển hướng đến JSP để hiển thị
        request.getRequestDispatcher("listVattu.jsp").forward(request, response);  // Đảm bảo đường dẫn đúng
    }
}
