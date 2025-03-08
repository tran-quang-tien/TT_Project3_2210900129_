package Vattu;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VattuAddServlet")
public class addvattu extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private connectsql vattuDAO;

    public addvattu() {
        super();
        vattuDAO = new connectsql();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addVattu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenDo = request.getParameter("TT_Ten_Do");
        String phanLoai = request.getParameter("TT_Phan_Loai");
        int gia = Integer.parseInt(request.getParameter("TT_Gia"));
        int soLuong = Integer.parseInt(request.getParameter("TT_SoLuong"));

        
        Vattumodel vattu = new Vattumodel(tenDo, phanLoai, gia, soLuong);

        try {
       
            vattuDAO.addVattu(vattu);

           
            System.out.println("Vật tư đã được thêm thành công!");

           
            response.sendRedirect("VattuServlet");
        } catch (Exception e) {
           
            System.out.println("Lỗi khi thêm vật tư: " + e.getMessage());
            e.printStackTrace();

       
            request.setAttribute("errorMessage", "Không thể thêm vật tư vào cơ sở dữ liệu. Vui lòng thử lại.");
            request.getRequestDispatcher("addVattu.jsp").forward(request, response);
        }
    }
}
