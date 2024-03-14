package Controller;

import DAL.RenterDAO;
import Models.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="BillListController", urlPatterns={"/bill-list"})
public class BillListController extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        // read user form session
        Account account = (Account) request.getSession().getAttribute("user");
        
        // load list bill by user id
        request.setAttribute("listBill", new RenterDAO().getAllBillsByUserID(account.getUserID()));
        request.getRequestDispatcher("Renter/BillList.jsp").forward(request, response);
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
        
    }

}
