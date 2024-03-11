/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.RequestDAO;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class EditRequestController extends HttpServlet {

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
        String id_raw = request.getParameter("id");
        String requestContent = request.getParameter("requestType");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditRequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>id: " + id_raw + "</h1>");
            out.println("<h1>requestcontent: " + requestContent + "</h1>");
            out.println("<h1>id " + id_raw + "</h1>");
            out.println("<h1>title " + title + "</h1>");
            out.println("<h1>des " + description + "</h1>");
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
        HttpSession session = request.getSession();
        session.setAttribute("requestID", id_raw);
        try {
            int id = Integer.parseInt(id_raw);
            RequestDAO dao = new RequestDAO();
            Request r = dao.getRequestByRequestID(id);
            request.setAttribute("oldData", r);
            request.getRequestDispatcher("/Renter/editrequest.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String requestID = session.getAttribute("requestID").toString();
        int id = Integer.parseInt(requestID);
        String requestContent = request.getParameter("requestType");
        int requestType = Integer.parseInt(requestContent);
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createAt = formatter.format(currentDate);
        RequestDAO dao = new RequestDAO();
        request.setCharacterEncoding("UTF-8");
        try {
            boolean success = dao.updateRequestByID(id, requestType, title, description, createAt, "Pending");
            String updateMessage = "updateMessage";
            if (success) {
                request.setAttribute(updateMessage, "Update Successful");
                response.sendRedirect(request.getContextPath() + "/requesthistory");

            } else {
                request.setAttribute(updateMessage, "Failed");
                response.sendRedirect(request.getContextPath() + "/editrequest");

            }
        } catch (IOException ex) {
            response.sendRedirect(request.getContextPath() + "/editrequest");

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
