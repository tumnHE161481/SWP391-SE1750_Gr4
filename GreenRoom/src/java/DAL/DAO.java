/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<RenterListSE> getAllCustomer() {
        List<RenterListSE> list = new ArrayList<>();
        String query = "SELECT u.userID, u.userAvatar, u.userName, u.userGender, u.userPhone, rm.[roomNumber]\n"
                + "FROM [dbo].[User] AS u\n"
                + "JOIN [dbo].[Renter] AS r ON u.userID = r.userID\n"
                + "JOIN [dbo].[Room] AS rm ON r.roomID = rm.roomID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RenterListSE(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Task> getAllTask() {
        List<Task> list = new ArrayList<>();
        String query = "select * from dbo.Task";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Task(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RenterListSE> searchCustomerByName(String txtSearch) {
        List<RenterListSE> list = new ArrayList<>();
        String query = "SELECT u.userID, u.userAvatar, u.userName, u.userGender, u.userPhone, rm.[roomNumber]\n"
                + "FROM [dbo].[User] AS u\n"
                + "JOIN [dbo].[Renter] AS r ON u.userID = r.userID\n"
                + "JOIN [dbo].[Room] AS rm ON r.roomID = rm.roomID\n"
                + "WHERE rm.[roomNumber] LIKE ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RenterListSE(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RoomListSE> getAllRoom() {
        List<RoomListSE> list = new ArrayList<>();
        String query = "select r.roomID, r.[roomNumber], r.[roomImg],r.[roomSize], r.roomFloor, ri.singleBed\n"
                + "from [dbo].[Room] as r, [dbo].[Room_Item] as ri\n"
                + "where r.roomItemID = ri.itemID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RoomListSE(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

}