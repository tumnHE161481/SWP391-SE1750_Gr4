/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.GuideAndRuleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig()
/**
 *
 * @author yetvv.piacom
 */
@WebServlet(name="AddRule", urlPatterns={"/addrule"})
public class AddRule extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddRule</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRule at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
            String ruleName = request.getParameter("name");
            ruleName = ruleName.trim().replaceAll("\\s{2,}", " ");
            if (isNumeric(ruleName)) {
                request.setAttribute("message", "name are not allowed to contain only number - invalid");
                request.getRequestDispatcher("olr").forward(request, response);
            }
            int score = Integer.parseInt(request.getParameter("score"));
            int penmoney = Integer.parseInt(request.getParameter("money"));
            String photo = request.getParameter("photo");
            photo = photo.trim().replaceAll("\\s{2,}", " ");
            
            GuideAndRuleDAO dao = new GuideAndRuleDAO();
            dao.addRule(ruleName, photo, score, penmoney);
            
            request.getRequestDispatcher("/olr").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private boolean isNumeric(String str) {
        // Sử dụng regular expression để kiểm tra xem chuỗi có chứa chỉ số không
        return str != null && str.matches("\\d+");
    }
}
