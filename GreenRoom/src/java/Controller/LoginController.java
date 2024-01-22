/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Account;

/**
 *
 * @author yetvv.piacom
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            AccountDAO a = new AccountDAO();
            Account account = a.LoginAccount(email, password);
            if (account == null) {
                request.setAttribute("message", "Login failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            else {
                HttpSession session = request.getSession();
                session.setAttribute("user", account);
                request.setAttribute("message", "Login successfully");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch ( ServletException | IOException e ) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, e);
        }
    }


}
