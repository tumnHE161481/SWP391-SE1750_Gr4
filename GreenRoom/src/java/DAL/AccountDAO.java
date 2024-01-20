/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Account;

/**
 *
 * @author ASUS
 */
public class AccountDAO extends MyDAO {

    //Table - Account
    /*
    1.userID - int
    2.userMail - String
    3.userPassword - String
    4.userRole - int
     */

    //List Account by userId
    public Account getUserByUserId(int id) {
        Account account = new Account();
        String statement = "select * from [Account]";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                account.setUserID(rs.getInt(1));
                account.setUserMail(rs.getString(2));
                account.setUserPassword(rs.getString(3));
                account.setUserRole(rs.getInt(4));
            }
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return account;
    }

    //List Account by userRole (Renter)
    public List<Account> getAccoutByRenter(int id) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE userRole = 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
    
   //List Account by userRole (Security)
    public List<Account> getAccoutBySecurity(int id) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE userRole = 2";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
}
