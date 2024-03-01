/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Security;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yetvv.piacom
 */
public class SecurityDAO extends DBContext {

    public List<Security> GetAllSecurity() {
        List<Security> list = new ArrayList<>();
        String sql = "select * from Security";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Security s = new Security(rs.getInt("seID"), rs.getInt("userID"), rs.getInt("sShift"), rs.getInt("seStatus"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void DeleteSecurity(int id) {
        String sql = "delete from Security where userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void DeleteUserSecurity(int id) {
        String sql = "delete from [GreenRoom].[dbo].[user] where userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void DeleteAccountSecurity(int id) {
        String sql = "delete from [GreenRoom].[dbo].[account] where userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void EditShift(int id, int shift) {
        String sql = "UPDATE [dbo].[security] SET [sShift] = ? WHERE userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, shift);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Security GetSecurityById(int id) {
        String sql = "select * from [GreenRoom].[dbo].[security] where userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Security s = new Security(rs.getInt("seID"), rs.getInt("userID"), rs.getInt("sShift"), rs.getInt("seStatus"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int CountShift(int shift) {
        String sql = "SELECT COUNT(sShift) FROM [dbo].[security] WHERE sShift = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, shift);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // Sử dụng chỉ số cột thứ nhất
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        SecurityDAO s = new SecurityDAO();
        List<Security> list = s.GetAllSecurity();
        for (int i = 0; i < list.size(); i++) {
            System.out.print(list.get(i).getSeID());
            System.out.print(" ");
            System.out.print(list.get(i).getUserID());
            System.out.print(" ");
            System.out.print(list.get(i).getsShift());
            System.out.print(" ");
            System.out.println(list.get(i).getSeStatus());
        }

    }

}
