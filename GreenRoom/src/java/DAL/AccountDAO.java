/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Account;
import Models.User;

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
    public Account getAccount(int id) {
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

    public int getUserRole(String mail, String password) {
        String sql = "SELECT userRole FROM [Account] \n"
                + "WHERE userMail = ? AND userPassword = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, mail);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("userRole");
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return 0;
    }

    public List<Account> manageAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT a.userID,\n"
                + "       a.userMail,\n"
                + "       a.userPassword,\n"
                + "       a.userRole,\n"
                + "       u.userName,\n"
                + "       u.userGender,\n"
                + "       u.userBirth,\n"
                + "       u.userAddress,\n"
                + "       u.userPhone,\n"
                + "       u.userAvatar\n"
                + "FROM Account a\n"
                + "INNER JOIN [User] u ON a.userID = u.userID\n"
                + "WHERE a.userRole != 4;";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), user);
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return list;
    }
    
    
     public List<Account> getAllRole() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT DISTINCT userRole FROM Account;";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
     }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
//        int role = dao.getUserRole("maitu@gmail.com", "12345678");
//        System.out.println("Role: " + role);

        List<Account> list = dao.manageAccount();
        for (Account account : list) {
            System.out.println("ID: " + account.getUserID());
            System.out.println("Img: " + account.getUser().getUserAvatar());
            System.out.println("Name: " + account.getUser().getUserName());
            System.out.println("Mail: " + account.getUserMail());
            System.out.println("Role: " + account.getUserRole());
        }
    }

    /////////////////////Hung dog code
    public Account LoginAccount(String email, String password) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [GreenRoom].[dbo].[Account] where userMail = ? and userPassword = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUserID(rs.getInt(1));
                a.setUserMail(rs.getString(2));
                a.setUserPassword(rs.getString(4));
                a.setUserRole(rs.getInt(4));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account findByEmail(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [GreenRoom].[dbo].[Account] WHERE userMail = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUserID(rs.getInt(1));
                a.setUserMail(rs.getString(2));
                a.setUserPassword(rs.getString(3));
                a.setUserRole(rs.getInt(4));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateUserPassword(String email, String password) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "update [Account] set userPassword = ? where userMail = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(2, email);
            ps.setString(1, password);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Account getUserId(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT [userID] FROM [GreenRoom].[dbo].[Account] where Account.userMail = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUserID(rs.getInt(1));
                a.setUserMail(rs.getString(2));
                a.setUserPassword(rs.getString(4));
                a.setUserID(rs.getInt(4));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}