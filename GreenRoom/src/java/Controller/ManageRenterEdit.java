/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.RenterDAO;
import DAL.*;
import Models.*;
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
            User ed = dao.getRenterForEdit(id);
            List<Room> room = dao1.getAvailableRoom();
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
        RoomDAO dao1 = new RoomDAO();
        request.setCharacterEncoding("UTF-8");
        try {
            id = Integer.parseInt(id_raw);
            boolean renterStatus = Boolean.parseBoolean(request.getParameter("renterStatus"));
            boolean renterHaveRoom = true;
            boolean haveRoom = renterStatus ? renterHaveRoom : !renterHaveRoom;
            String roomNumber = request.getParameter("roomNumber");
            int number = Integer.parseInt(roomNumber);
            int roomID;
            if (haveRoom) {
                roomID = dao1.findRoomIDByRoomNumber(number);
            } else {
                roomID = 0;
            }
            //After click update
            boolean success = dao.updateRenter(id, roomID, renterStatus, haveRoom);
            String updateMessage = "updateMessage";
            if (success) {
                // Update successful
                request.setAttribute(updateMessage, "Update Successful");
                response.sendRedirect(request.getContextPath() + "/renterdetail?id=" + id_raw);

            } else {
                // Update failed
                request.setAttribute(updateMessage, "Failed");
                response.sendRedirect(request.getContextPath() + "/adrenteredit?id=" + id_raw);

            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/adrenteredit?id=" + id_raw);
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
