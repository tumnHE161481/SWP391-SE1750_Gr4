/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.*;
import Models.Room;
import Models.RoomTu;
import Models.UsagePrice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddRoomFee", urlPatterns = {"/addroomfee"})
public class AddRoomFee extends HttpServlet {

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
            out.println("<title>Servlet AddRoomFee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRoomFee at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(id_raw);
        HttpSession session = request.getSession();
        session.setAttribute("roomID", id);
        RoomDAO dao = new RoomDAO();
        RoomTu room = dao.getRoomDetail(id);
        request.setAttribute("room", room);
        BillDAO dao1 = new BillDAO();
        UsagePrice price = dao1.getEWPrice();
        double eprice = price.getEprice();
        double wprice = price.getWprice();
        request.setAttribute("eprice", eprice);
        request.setAttribute("wprice", wprice);
        request.getRequestDispatcher("/Owner/addroomfee.jsp").forward(request, response);
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
        String service = request.getParameter("service");
        double serviceM = Double.parseDouble(service);
        HttpSession session = request.getSession();
        String roomID = session.getAttribute("roomID").toString();
        int id = Integer.parseInt(roomID);
        RoomDAO dao1 = new RoomDAO();
        RoomTu room = dao1.getRoomDetail(id);
        double roomfee = 0;
        switch (room.getRoomSize()) {
            case 1:
                roomfee = 2500000;
                break;
            case 2:
                roomfee = 3000000;
                break;
            case 3:
                roomfee = 3500000;
                break;
            default:
                break;
        }
        BillDAO dao = new BillDAO();
        UsagePrice price = dao.getEWPrice();
        double eprice = price.getEprice();
        double wprice = price.getWprice();
        String water = request.getParameter("water");
        String electric = request.getParameter("electric");
        double elnum = Double.parseDouble(electric);
        double wnum = Double.parseDouble(water);
        double etotal = eprice * elnum;
        double wtotal = wprice * wnum;
        String other = request.getParameter("other");
        double otherM = Double.parseDouble(other);
        String pen = request.getParameter("penMoney");
        double penmoney = Double.parseDouble(pen);
        Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createAt = formatter.format(currentDate);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.MONTH, 1); // Adding 1 month to the current date

        String deadline = formatter.format(calendar.getTime());
        request.setCharacterEncoding("UTF-8");
        try {
            boolean success = dao.addFeeById(id, serviceM, etotal, wtotal, roomfee, otherM, penmoney, createAt, deadline, null);
            String updateMessage = "updateMessage";
            if (success) {
                request.setAttribute(updateMessage, "Add Successful");
                response.sendRedirect(request.getContextPath() + "/roomfee?id=" + roomID);
                session.removeAttribute("roomID");
            } else {
                request.setAttribute(updateMessage, "Failed");
                response.sendRedirect(request.getContextPath() + "/addroomfee?id="+ roomID);

            }
        } catch (IOException ex) {
            response.sendRedirect(request.getContextPath() + "/addroomfee?id="+ roomID);

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
