package Vattu;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VattuDeleteServlet")
public class deletevattu extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private connectsql vattuDAO;

    public deletevattu() {
        super();
        vattuDAO = new connectsql();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        vattuDAO.deleteVattu(id);
        response.sendRedirect("VattuServlet");
    }
}
