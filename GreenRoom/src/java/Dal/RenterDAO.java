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
import Model.Renter;

/**
 *
 * @author ASUS
 */
public class RenterDAO extends MyDAO{
     //Table - Renter
    /*
    1.renterID - int
    2.userID - int
    3.roomID - int
    4.renterStatus - boolean
    5.renterHaveRoom - boolean
     */
    
    //List Renter Data
    public List<Renter> getRenterList(int id) {
        List<Renter> list = new ArrayList<>();
        String sql = "SELECT * FROM [Renter]";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Renter renter = new Renter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBoolean(4), rs.getBoolean(5));
                list.add(renter);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
    
    //Get Renter Detail
}
