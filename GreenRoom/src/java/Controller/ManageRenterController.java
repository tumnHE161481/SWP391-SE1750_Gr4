/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.RenterListDAO;
import Models.RenterList;
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
@WebServlet(name = "ManageRenterController", urlPatterns = {"/managerenter"})
public class ManageRenterController extends HttpServlet {

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
            out.println("<title>Servlet ManageRenterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageRenterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RenterListDAO dao = new RenterListDAO();
        // Check if the search results are already stored in the session
        List<RenterList> list = (List<RenterList>) request.getSession().getAttribute("manageRenter");
        // If not, fetch all records
        if (list == null) {
            list = dao.getManageRenterList();
        }
        request.setAttribute("manageRenter", list);
        request.getRequestDispatcher("/Admin/managerenter.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RenterListDAO dao = new RenterListDAO();

        String txtSearch = request.getParameter("txtSearch");
        request.setAttribute("txtSearch", txtSearch);

        if (txtSearch != null && !txtSearch.isEmpty()) {
            List<RenterList> searchResult = dao.searchResult(txtSearch);
            request.getSession().setAttribute("manageRenter", searchResult);
            int count = dao.countSearchResult(txtSearch);
           // Set attribute based on search count
            request.setAttribute("searchCount", count);
            request.setAttribute("manageRenter", searchResult);
        } else {
            // If no search text provided, show all records
            List<RenterList> list = dao.getManageRenterList();
            // Store all records in the session
            request.getSession().setAttribute("manageRenter", list);
            request.setAttribute("manageRenter", list);
            request.setAttribute("searchCount", "Use search to have results");
        }

        request.getRequestDispatcher("/Admin/managerenter.jsp").forward(request, response);
    }

}
