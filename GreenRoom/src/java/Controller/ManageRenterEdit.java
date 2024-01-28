/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.RenterDAO;
import DAL.RoomDAO;
import DAL.UserDAO;
import Models.Renter;
import Models.Room;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ManageRenterEdit", urlPatterns = {"/adrenteredit"})
public class ManageRenterEdit extends HttpServlet {

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
            out.println("<title>Servlet ManageRenterEdit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageRenterEdit at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        int id;
        UserDAO dao = new UserDAO();
        RoomDAO dao1 = new RoomDAO();
        try {
            id = Integer.parseInt(id_raw);
            List<User> ed = dao.getRenterDetail(id);
            List<Room> room = dao1.getRoom();
            request.setAttribute("detail", ed);
            request.setAttribute("roomNumberList", room);
            request.getRequestDispatcher("/Admin/editrenter.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Fail:" + e);
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
        String id_raw = request.getParameter("id");
        int id;
        RenterDAO dao = new RenterDAO();

        try {
            id = Integer.parseInt(id_raw);

            // Get the new renter status and renter have room values from the form
            boolean newRenterStatus = Boolean.parseBoolean(request.getParameter("renterStatus"));
            boolean newRenterHaveRoom = Boolean.parseBoolean(request.getParameter("renterHaveRoom"));

            // Assuming you have a DAO method like updateRenter in your UserDAO
            boolean success = dao.updateRenter(id, 1, newRenterStatus, newRenterHaveRoom);

            if (success) {
                // Update successful
                request.setAttribute("updateMessage", "Renter details updated successfully");
            } else {
                // Update failed
                request.setAttribute("updateMessage", "Failed to update renter details");
            }

            request.getRequestDispatcher("your-jsp-page.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle the case where id is not a valid integer
            request.setAttribute("updateMessage", "Invalid ID");
            request.getRequestDispatcher("your-jsp-page.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
