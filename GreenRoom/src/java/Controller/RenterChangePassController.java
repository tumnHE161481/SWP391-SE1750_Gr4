package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DAL.AccountDAO;
import Models.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

public class RenterChangePassController extends HttpServlet {

    public boolean checkPassword(String pass) {
        if (pass.length() < 8) {
            return false;
        }

        boolean containsLetterAndNumber = pass.matches(".*[a-zA-Z].*") && pass.matches(".*\\d.*");

        return containsLetterAndNumber;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userMail = request.getParameter("userMail");
        request.setAttribute("userMail", userMail);
        request.getRequestDispatcher("Renter/RenterPassChange.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String u = request.getParameter("userMail");
        String op = request.getParameter("opass"); // old
        String p = request.getParameter("pass"); // new
        String rp = request.getParameter("rp"); // confirmation password

        // Check if new password matches confirmation password
        if (!p.equals(rp)) {
            String ms = "New password and confirmation password do not match!";
            request.setAttribute("userMail", u);
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("Renter/RenterPassChange.jsp").forward(request, response);
            return; // Exit the method if passwords do not match
        }

        AccountDAO dao = new AccountDAO(); // Instantiate AccountDAO
        // Check old password
        Account a = dao.check(u, op);

        if (a == null) {
            // Old password is incorrect
            String ms = "Old password is incorrect! " + u + ", " + op;
            request.setAttribute("userMail", u);
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("Renter/RenterPassChange.jsp").forward(request, response);
        } else {
            Account ac = new Account(a.getUserID(), u, p, a.getUserRole());
            dao.changep(ac);
            HttpSession session = request.getSession();
            session.setAttribute("userMail", ac);
            String ms = "Update password successful!";
            request.setAttribute("ms", ms);
            request.setAttribute("userMail", u);
            request.getRequestDispatcher("Renter/RenterPassChange.jsp").forward(request, response);
        }
    }
}
