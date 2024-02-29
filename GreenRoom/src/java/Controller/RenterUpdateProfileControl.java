/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.RenterDAO;
import DAL.UserDAO;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Creep
 */
public class RenterUpdateProfileControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RenterHomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RenterHomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("userName");
        String gender = request.getParameter("userGender"); // Corrected parameter name
        String address = request.getParameter("userAddress"); // Corrected parameter name
        String phone_raw = request.getParameter("userPhone"); // Corrected parameter name
        int phone;
        RenterDAO dao = new RenterDAO();
        try {
            phone = Integer.parseInt(phone_raw);
            // Retrieve the actual user ID from the session or request parameters
            int userId = 1; // Get the user ID from session or request parameters
            User u = dao.getUserByID(userId); // Retrieve the user from the database using the obtained ID
            request.setAttribute("user", u); // Set the user attribute to be passed to the JSP page
            request.getRequestDispatcher("RenterUpdateProfile.jsp").forward(request, response); // Forward the request to the JSP page
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Handle the exception properly
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the form submission
        String name = request.getParameter("userName");
        String gender = request.getParameter("userGender");
        String address = request.getParameter("userAddress");
        String phone_raw = request.getParameter("userPhone");
        int phone;
        try {
            phone = Integer.parseInt(phone_raw);
            // Assuming you have a method in your DAO to update user information
            RenterDAO dao = new RenterDAO();
            int userId = 1; // Get the user ID from session or request parameters
            dao.updateUserInfo(userId, name, gender, address, phone); // Update user information
            // Redirect back to the profile page or any other appropriate page
            response.sendRedirect("Profile.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Handle the exception properly
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
