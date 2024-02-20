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
import Models.User;
import utils.EmailUtils;

/**
 *
 * @author yetvv.piacom
 */
public class AccountDAO extends DBContext {

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
                a.setUserId(rs.getInt(1));
                a.setEmail(rs.getString(2));
                a.setPassword(rs.getString(4));
                a.setRole(rs.getInt(4));
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
                a.setUserId(rs.getInt(1));
                a.setEmail(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setRole(rs.getInt(4));
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

    // dang ky account
    public boolean registerAccount(String email, String password, int role) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [dbo].[Account] ([userMail] ,[userPassword] ,[userRole]) VALUES (?,?,?)";

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
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([userID]\n"
                    + "           ,[userName]\n"
                    + "           ,[userGender]\n"
                    + "           ,[userBirth]\n"
                    + "           ,[userAddress]\n"
                    + "           ,[userPhone])\n"
                    + "		   VALUES (?,?,?,?,?,?)";

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
            String sql = "DELETE FROM [dbo].[Account]\n"
                    + "      WHERE Account.userID = ?";

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
            String sql = "SELECT [userID] FROM [GreenRoom].[dbo].[Account] where Account.userMail = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                // If there's a result, create an Account object and set its properties
                Account a = new Account();
                a.setUserId(rs.getInt(1));
                // Assuming that userMail, password, and role are retrieved from the database
                a.setEmail(email); // Assuming email is passed as a parameter
                // Assuming password and role are retrieved from the database
                a.setPassword("password"); // Assuming the column name for password
                a.setRole(1); // Assuming the column name for role
                // Return the user ID from the retrieved result
                return a.getUserId();
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

}
