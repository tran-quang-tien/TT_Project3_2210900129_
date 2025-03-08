package Vattu;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VattuEditServlet")
public class editvattu extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private connectsql vattuDAO;

    public editvattu() {
        super();
        vattuDAO = new connectsql();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Vattumodel vattu = vattuDAO.getVattuById(id);
        request.setAttribute("vattu", vattu);
        request.getRequestDispatcher("editVattu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("TT_id_do_Chinh"));
        String tenDo = request.getParameter("TT_Ten_Do");
        String phanLoai = request.getParameter("TT_Phan_Loai");
        int gia = Integer.parseInt(request.getParameter("TT_Gia"));
        int soLuong = Integer.parseInt(request.getParameter("TT_SoLuong"));

        Vattumodel vattu = new Vattumodel(id, tenDo, phanLoai, gia, soLuong);
        vattuDAO.updateVattu(vattu);
        response.sendRedirect("VattuServlet");
    }
}
