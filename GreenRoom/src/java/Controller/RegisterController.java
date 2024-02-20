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
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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

            AccountDAO a = new AccountDAO();
            PrintWriter out = response.getWriter();

            String username = request.getParameter("username");

            String email = request.getParameter("usermail");
            String phone = request.getParameter("userphone");

            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");

            String address = request.getParameter("address");
            
            
            
            String dobString = request.getParameter("dob");

            

            String gender = request.getParameter("gender");
            int role = 1;

            if (a.findByEmail(email) != null) {
                request.setAttribute("message", "Email is existed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (!repassword.endsWith(password)) {
                request.setAttribute("message", "Password not match");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {

                a.registerAccount(email, password, role);

                int userID = a.getUserId(email);

                boolean z = a.registerUser(userID, gender, address, phone, dobString, username);

                if (z == false) {
                    a.deleteAccount(userID);
                    request.setAttribute("message", "false");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }

                RequestDispatcher dispatcher = null;

                int otpvalueLength = 6;

                Random rand = new Random();

                String string = "0123456789";

                String randomOtp = "";

                HttpSession mySession = request.getSession();

                if (email != null || !email.equals("")) {
                    for (int i = 0; i < otpvalueLength; i++) {
                        char c = string.charAt(rand.nextInt(string.length()));
                        randomOtp = randomOtp + c;
                    }
                    Cookie cookie = new Cookie("otpR", randomOtp);

                    cookie.setMaxAge(5 * 60);

                    response.addCookie(cookie);

                    String to = email;

                    // Get the session object
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.port", "465");
                    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("bnvqm1721@gmail.com", "tgqwyawkaytmqvka");
                        }
                    });
                    try {
                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress(email));
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Request to confirm email");
                        message.setText("Hi, for security, please verify your account with the OPT below. "
                                + "Your OTP is ==========> " + randomOtp + ". " + " <========== Click the link to enter otp: " + "http://localhost:9999/greenroom/enterotpRegister.jsp");
                        Transport.send(message);
                        System.out.println("message sent successfully");
                    } catch (MessagingException e) {
                    }
                    //=======================================================

                    dispatcher = request.getRequestDispatcher("register.jsp");
                    request.setAttribute("message", "OTP is sent to your email id");
                    mySession.setAttribute("otp", randomOtp);
                    mySession.setAttribute("email", email);
                    dispatcher.forward(request, response);
                }
            }

        } catch (ServletException | IOException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
