/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.User;

/**
 *
 * @author ASUS
 */

public class UserDAO extends MyDAO{
    //Table - User
    /*
    1.userID - int
    2.userName - String
    3.userGender - String
    4.userBirth - String
    5.userAddress - String
    6.userPhone - String
    7.userAvatar
     */
    
    //List User Data
    public List<User> getUserList() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<User> list = dao.getUserList();
        for (User user : list) {
            System.out.println("Img : " + user.getUserAvatar());
        }
    }
}
