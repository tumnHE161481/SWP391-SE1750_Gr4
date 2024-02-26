/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class SecurityDAO extends MyDAO {
    //Table - security
    /*
    1.seID - int
    2.userID - int
    3.sShift - boolean
    4.seStatus -  boolean
    5.roomSize - String
    6.roomImg - String
     */
    public boolean updateSecurity(int userID, boolean newSeStatus) {
        String sql = "UPDATE [security] SET seStatus = ? WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, newSeStatus);
            ps.setInt(2, userID);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Neu co row tra ve, return true

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        SecurityDAO dao = new SecurityDAO();
        dao.updateSecurity(17, true);


    }
}
