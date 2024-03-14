/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Account;
import Models.Security;
import Models.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yetvv.piacom
 */
public class AccountDAO extends MyDAO {

    public Account LoginAccount(String email, String password) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [GreenRoom].[dbo].[account] where userMail = ? and userPassword = ?";
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
            String sql = "SELECT * FROM [GreenRoom].[dbo].[account] WHERE userMail = ?";
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

    public List<User> getSecurity() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [GreenRoom].[dbo].[account] a join [dbo].[user] u ON a.userID = u.userID where userRole = 2";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt("userID"), rs.getString("userName"), rs.getString("userGender"), rs.getString("userBirth"), rs.getString("userAddress"), rs.getString("userPhone"), rs.getString("userAvatar"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateUserPassword(String email, String password) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "update [account] set userPassword = ? where userMail = ?";
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

    // dang ky account
    public boolean registerAccount(String email, String password, int role) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [GreenRoom].[dbo].[account] ( [userMail] ,[userPassword] ,[userRole] ) VALUES (?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setInt(3, role);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // dang ky user
    public boolean registerUser(int id, String gender, String address, String phone, String birth, String name) {
        try {
            PreparedStatement ps;
            String sql = "INSERT INTO [GreenRoom].[dbo].[user] ( [userID],[userName],[userGender],[userBirth],[userAddress],[userPhone] ) VALUES (?,?,?,?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, gender);
            ps.setString(4, birth);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteAccount(int id) {
        try {
            PreparedStatement ps;
            String sql = "DELETE FROM [dbo].[account]\n"
                    + "      WHERE account.userID = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int getUserId(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT [userID] FROM [GreenRoom].[dbo].[account] where account.userMail = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                // If there's a result, create an Account object and set its properties
                Account a = new Account();
                a.setUserID(rs.getInt(1));
                // Assuming that userMail, password, and role are retrieved from the database
                a.setUserMail(email); // Assuming email is passed as a parameter
                // Assuming password and role are retrieved from the database
                a.setUserPassword("password"); // Assuming the column name for password
                a.setUserRole(1); // Assuming the column name for role
                // Return the user ID from the retrieved result
                return a.getUserID();
            } else {
                // If there's no result, return 0 or handle appropriately
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // In case of an exception or no result, return 0 or handle appropriately
        return 0;
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
}
