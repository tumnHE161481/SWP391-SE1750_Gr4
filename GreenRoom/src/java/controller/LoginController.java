/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

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
            AccountDAO aDBContext = new AccountDAO();
            Account account = aDBContext.LoginAccount(email, password);
            if (account == null) {
                request.setAttribute("message", "Login failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            else {
                request.getSession().setAttribute("user", account);
                request.setAttribute("message", "Login successfully");
                request.getRequestDispatcher("login.jsp").forward(request, response);

//                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
//            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch ( ServletException | IOException e ) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, e);
        }
    }


}
