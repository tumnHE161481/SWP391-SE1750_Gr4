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
public class AccountDAO extends DBContext{
    
    
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
    
    public boolean registerUSer(Account a, boolean isSendLink) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [dbo].[Account] ([userMail] ,[userPassword] ,[userRole]) VALUES (?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setString(1, a.getEmail());
            ps.setString(2, a.getPassword());
            ps.setInt(3, a.getRole());
            ps.execute();
          
            
            
            
            String subject = "Please verify your account to Online Learning System ❤";
            String verificationLink = "http://localhost:9999/MANH-MEO/verify?email=" + a.getEmail();
            String body = "Click this link to verify your account: " + verificationLink + "";
            if (!isSendLink) {
                subject = "";
                body = "Your password in Online Learning System is: " + a.getPassword();
            }
            EmailUtils.sendVerifyEmail(a.getEmail(), subject, body);

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
    
    
}
