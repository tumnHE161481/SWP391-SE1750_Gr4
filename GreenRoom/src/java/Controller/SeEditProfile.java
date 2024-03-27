/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Models.Account;
import Models.SeUserProfile;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class SeEditProfile extends HttpServlet {

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
            out.println("<title>Servlet SeEditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SeEditProfile at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        // get user

        DAO dao = new DAO();
        SeUserProfile se = dao.getProfileById(String.valueOf(acc.getUserID()));
        User user = new User();
        String back = request.getParameter("back");
        user.setUserID(se.getUserID());
        user.setUserName(se.getUserName());
        user.setUserAddress(se.getUserAddress());
        user.setUserAvatar(se.getUserAvatar());
        user.setUserBirth(se.getUserBirth());
        user.setUserGender(se.getUserGender());
        user.setUserPhone(se.getUserPhone());
        acc.setUser(user);
        request.setAttribute("back", back);
        request.setAttribute("account", acc);
        request.getRequestDispatcher("JSP/SeEditProfile.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");

        String back = request.getParameter("back");
        String userName = request.getParameter("name");
        String userGender = request.getParameter("gender");
        String userBirth = request.getParameter("birth");
        String userAddress = request.getParameter("address");
        String userPhone = request.getParameter("phone");
       
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");

        // Get the file part from the request
        Part filePart = request.getPart("img");

        // check img file
        if (filePart.getSize() > 0 && !isImageFile(filePart)) {
            request.setAttribute("error", "Please input file image");
            request.getRequestDispatcher(
                    "/view/pages/mentee/mentee_profile.jsp"
            ).forward(request, response);
            return;
        }
// Get the filename
        String fileName = getSubmittedFileName(filePart);
        String filePath = null;

        if (fileName.length() > 0) {
            String uploadDirPath = getServletContext().getRealPath("") + File.separator + "img";
            File uploadDir = new File(uploadDirPath);

            if (!uploadDir.exists()) {
                if (!uploadDir.mkdirs()) {
                    throw new IOException("Failed to create directory: " + uploadDir.getAbsolutePath());
                }
            }

            // Construct the file path relative to the web application's directory
            filePath = "./img/" + fileName;

            try ( InputStream input = filePart.getInputStream();  OutputStream output = new FileOutputStream(uploadDirPath + File.separator + fileName)) {
                int read;
                byte[] buffer = new byte[1024];
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                }
            } catch (IOException e) {
                e.printStackTrace(); // Handle the exception properly, log it, or rethrow it
            }
        }

        filePath = filePath.replace("\\\\", "\\");
        System.out.println("file path: " + filePath);
        int sid = a.getUserID();

        DAO dao = new DAO();
        if (dao.updateProfile(userName, userGender, userBirth, userAddress, userPhone, filePath, a.getUserID())) {
            System.out.println("update thanh cong");
        } else {
            System.out.println("update fail");
        }
        response.sendRedirect("seprofile");
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        String[] elements = header.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }

    private boolean isImageFile(Part part) {
        String contentType = part.getContentType();
        return contentType != null && contentType.startsWith("image");
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
