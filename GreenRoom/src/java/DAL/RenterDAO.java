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
import Models.Renter;
/**
 *
 * @author ADMIN
 */
public class RenterDAO extends MyDAO {
    //Table - Renter

    /*
    1.renterID - int
    2.userID - int
    3.roomID - int
    4.renterStatus - boolean
    5.renterHaveRoom - boolean
    6.CGRScore - int
    7.balance - double
    
     */
    //List Renter Data
    public List<Renter> getRenterList(int id) {
        List<Renter> list = new ArrayList<>();
        String sql = "SELECT * FROM Renter\n"
                + "    WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Renter renter = new Renter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBoolean(4), rs.getBoolean(5), rs.getInt(6), rs.getDouble(7));
                list.add(renter);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
     public List<Renter> getOwnerRenterList() {
        List<Renter> list = new ArrayList<>();
        String sql = "SELECT * FROM Renter";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Renter renter = new Renter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBoolean(4), rs.getBoolean(5), rs.getInt(6), rs.getDouble(7));
                list.add(renter);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
    //Get Renter Update status
    public boolean updateRenter(int userID, int roomID, boolean newRenterStatus, boolean newRenterHaveRoom) {
        String sql = "UPDATE [renter] SET roomID = ?, renterStatus = ?, renterHaveRoom = ? WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            if (roomID == 0) {
                ps.setObject(1, null);
            } else {
                ps.setInt(1, roomID);
            }
            ps.setBoolean(2, newRenterStatus);
            ps.setBoolean(3, newRenterHaveRoom);
            ps.setInt(4, userID);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Neu co row tra ve, return true

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        RenterDAO dao = new RenterDAO();
        dao.updateRenter(1, 1, true, true);
        List<Renter> list = dao.getRenterList(1);
        for (Renter renter : list) {
            System.out.println("userID:" + renter.getUserID());
            System.out.println("ACC:" + renter.isRenterStatus());
        }
    }
}