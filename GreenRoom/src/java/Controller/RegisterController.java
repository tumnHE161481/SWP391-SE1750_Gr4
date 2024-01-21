/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AccountDAO;
import Models.Account;
import jakarta.servlet.AsyncContext;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.User;

/**
 *
 * @author admin
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            AccountDAO a = new AccountDAO();
            String username = request.getParameter("username");
            String email = request.getParameter("usermail");
            String phone = request.getParameter("userphone");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            int role = 1;
            
            
            
            if (a.findByEmail(email) != null) {
                request.setAttribute("message", "Email is existed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                out.print("success");
                Random rand = new Random();
                int otpvalue = rand.nextInt(1255650);
                Account ac = new Account(email, password, role);
                a.findByEmail(email).getEmail();
            }

        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
