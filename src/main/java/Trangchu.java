

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/trangchu")
public class Trangchu extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        HttpSession session = request.getSession(false);

       
        if (session == null || session.getAttribute("username") == null) {
         
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
         
            response.sendRedirect("welcome.jsp");
        }
    }
}
