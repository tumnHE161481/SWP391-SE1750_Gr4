/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.RequestDAO;
import Models.Request;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "FilterRequestController", urlPatterns = {"/filterrequest"})
public class FilterRequestController extends HttpServlet {

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
            out.println("<title>Servlet FilterRequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterRequestController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer renterID = (Integer) session.getAttribute("renterID");
        if (renterID == null) {
            // Nếu không có renterID trong session, chuyển hướng về trang đăng nhập hoặc xử lý lỗi
            response.sendRedirect("login.jsp");
            return;
        }
        String statusFilter = ""; // Mặc định không filter theo status nào

        // Lấy giá trị của status filter từ request
        String status = request.getParameter("status");
        if (status != null && !status.isEmpty()) {
            statusFilter = status;
        }
        RequestDAO dao = new RequestDAO();
        if (status == null || status.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/requesthistory");
        } else {
            List<Request> list1 = dao.getRequestByRenterIDAndStatus(renterID, status);
            int page, numberpage = 5;
            int size = list1.size();
            int num = (size % 5 == 0 ? (size / 5) : (size / 5) + 1); //number page
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Request> list = dao.getListByPage(list1, start, end);
            request.setAttribute("requestList", list);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("status", statusFilter); // Truyền giá trị status filter để hiển thị lại trạng thái đã chọn
            List<Request> allStatus = dao.getAllResponseStatus();
            request.setAttribute("allStatus", allStatus); // Truyền danh sách tất cả các trạng thái để hiển thị lựa chọn filter
        }
        request.getRequestDispatcher("/Renter/filterrequest.jsp").forward(request, response);
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
        processRequest(request, response);
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
