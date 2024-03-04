/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OwnerHistoryPenalty", urlPatterns = {"/OwnerHistoryPenalty"})
public class OwnerHistoryPenaltyController extends HttpServlet {

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
            out.println("<title>Servlet OwnerHistoryPenalty</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OwnerHistoryPenalty at " + request.getContextPath() + "</h1>");
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
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String id_raw = request.getParameter("id");
//        int id = Integer.parseInt(id_raw);
//        PenaltyDAO dao = new PenaltyDAO();
//        List<Penalty> list = dao.historyPenalty(id);
//        request.setAttribute("OwnerHistoryPenalty", list);
//        request.getRequestDispatcher("/Owner/OwnerHistoryPenalty.jsp").forward(request, response);
//
//        List<Rule> list1 = dao.listRule();
//        request.setAttribute("ruleName", list1);
//        request.getRequestDispatcher("/Owner/OwnerHistoryPenalty.jsp").forward(request, response);
//
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        PenaltyDAO dao = new PenaltyDAO();

        // Retrieve history penalties
        List<Penalty> list = dao.historyPenalty(id);
        request.setAttribute("OwnerHistoryPenalty", list);

        // Retrieve list of rules
        List<Rule> list1 = dao.listRule();
        request.setAttribute("ruleName", list1);

        // Forward the request and response to the JSP page
        request.getRequestDispatcher("/Owner/OwnerHistoryPenalty.jsp").forward(request, response);
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
        String accuse = request.getParameter("accuseID");
        String room = request.getParameter("roomID");
        String description = request.getParameter("description");
        String rule = request.getParameter("ruleID");
        String penStatus = request.getParameter("penStatus");
        String id_raw = request.getParameter("id");
        Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String penDate = formatter.format(currentDate);
        int id;
        UserDAO dao = new UserDAO();
        PenaltyDAO dao1 = new PenaltyDAO();
        try {
            id = Integer.parseInt(id_raw);
            User rd = dao.getOwRenterDetail(id);

            request.setAttribute("detail", rd);
            int accuseID = Integer.parseInt(accuse);
            int roomID = Integer.parseInt(room);
            int ruleID = Integer.parseInt(rule);
            boolean status = Boolean.parseBoolean(penStatus);
            dao1.addNewPenalty(id, accuseID, roomID, description, penDate, ruleID, status);
            request.getRequestDispatcher("/Owner/OwnerHistoryPenalty.jsp").forward(request, response);
        } catch (NumberFormatException e) {

        }
//        HttpSession session = request.getSession();
//        AddPenalty ap = (AddPenalty) session.getAttribute("user");
//        String id = ap.getRuleName();

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
