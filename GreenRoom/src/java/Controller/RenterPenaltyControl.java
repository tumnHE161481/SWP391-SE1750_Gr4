package Controller;

import DAL.PenaltyDAO;
import Models.Penalty;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class RenterPenaltyControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Retrieve email and password from session attributes
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        
        if (email != null && password != null) {
            PenaltyDAO dao = new PenaltyDAO();
            //List<Penalty> list = dao.getPenalty(email, password);
            List<Penalty> list = dao.getPenalty("hungdog@gmail.com", "12345678");
            request.setAttribute("ListP", list);
            request.getRequestDispatcher("Renter/RenterPenalty.jsp").forward(request, response);
        } else {
            // If email or password is null, redirect the user to the login page
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method might be used for handling form submissions in the future
        // For now, you can leave it empty
    }

}
