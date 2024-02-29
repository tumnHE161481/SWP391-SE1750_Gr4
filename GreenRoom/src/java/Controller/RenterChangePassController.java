package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DAL.AccountDAO;
import Models.*;

import jakarta.servlet.annotation.WebServlet;


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
        String u = request.getParameter("user");
        String op = request.getParameter("opass"); // old
        String p = request.getParameter("pass"); // new

        AccountDAO dao = new AccountDAO(); // Instantiate AccountDAO
        // Check old password
        Account a = dao.check(u, op);
        if (a == null) {
            // Old password is incorrect
            String ms = "Old password is incorrect!";
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("Renter/RenterPassChange.jsp").forward(request, response); // Forward to the change password page
        } else {
            // Update password
            boolean updated = dao.updateUserPassword(u, p); // Assuming updateUserPassword method returns boolean

            if (updated) {
                // Password updated successfully
                Account ac = new Account(a.getUserID(), u, p, a.getUserRole());
                request.getSession().setAttribute("account", ac); // Set updated account to session
                response.sendRedirect("Renter/RenterHome.jsp"); // Redirect to the Renter Home page
            } else {
                // Failed to update password
                String ms = "Failed to update password. Please try again.";
                request.setAttribute("ms", ms);
                request.getRequestDispatcher("Renter/RenterPassChange.jsp").forward(request, response); // Forward to the change password page
            }
        }
    }
}
