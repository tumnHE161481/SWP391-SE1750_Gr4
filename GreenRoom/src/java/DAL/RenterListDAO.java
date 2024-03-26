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
import Models.RenterList;

/**
 *
 * @author ASUS
 */
public class RenterListDAO extends MyDAO {

    //List renter in Admin screen
    public List<RenterList> getManageRenterList() {
        List<RenterList> list = new ArrayList<>();
        String sql = "SELECT u.userID, u.userAvatar, u.userName, a.userMail, r.renterHaveRoom, r.renterStatus "
                + "FROM [User] u "
                + "JOIN Renter r ON u.userID = r.userID "
                + "JOIN Account a ON u.userID = a.userID "
                + "WHERE a.userRole = 1 "
                + "ORDER BY u.userID";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                RenterList renterList = new RenterList(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getBoolean(6));
                list.add(renterList);
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



    public static void main(String[] args) {
        RenterListDAO dao = new RenterListDAO();
//        List<RenterList> list = dao.getManageRenterList();
//
//        // Print table header
//        System.out.printf("%-10s%-20s%-30s%-30s%-15s%-15s\n", "UserID", "UserAvatar", "UserName", "UserMail", "RenterHaveRoom", "RenterStatus");
//
//        // Print data
//        for (RenterList r : list) {
//            System.out.printf("%-10s%-20s%-30s%-30s%-15s%-15s\n", r.getUserID(), r.getUserAvatar(), r.getUserName(), r.getUserMail(), r.isRenterHaveRoom(), r.isRenterStatus());
//        }
        // Print count search result
    }

}
