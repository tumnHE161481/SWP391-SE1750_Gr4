/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.User;

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
            String sql = "SELECT * FROM [GreenRoom].[dbo].[Account] WHERE email = ?";
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
    
    
    
    
    
    
}
