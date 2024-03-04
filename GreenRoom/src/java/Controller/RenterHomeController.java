/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAORenter;
import DAL.RenterDAO;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class RenterHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Retrieve the account object from the session
        Account account = (Account) session.getAttribute("user");

        // Check if the account object exists in the session
        if (account != null) {
            // Extract email and password from the account object
            String userMail = (String) session.getAttribute("email");
            String userPassword = (String) session.getAttribute("password");

            // Set email and password attributes in session
            // Now you can use the email and password to fetch data or perform any other actions
            // Example:
            DAORenter dao1 = new DAORenter();
            List<News> listN = dao1.getAllNews();
            request.setAttribute("ListN", listN);

            RenterDAO dao = new RenterDAO();
            List<User> list = dao.getRenterDetailByAccountAndPassword(userMail, userPassword);
            request.setAttribute("ListRP", list);
            request.getRequestDispatcher("Renter/RenterHome.jsp").forward(request, response);
        } else {
            // If account object is not found in the session, handle the situation accordingly
            // For example, redirect the user to the login page
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
