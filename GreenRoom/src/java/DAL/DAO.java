/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DAO extends DBContext {

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
            conn = connection;
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

    public List<RenterListSE> searchCustomerByName(String txtSearch) {
        List<RenterListSE> list = new ArrayList<>();
        String query = "SELECT u.userID, u.userAvatar, u.userName, u.userGender, u.userPhone, rm.[roomNumber]\n"
                + "FROM [dbo].[User] AS u\n"
                + "JOIN [dbo].[Renter] AS r ON u.userID = r.userID\n"
                + "JOIN [dbo].[Room] AS rm ON r.roomID = rm.roomID\n"
                + "WHERE u.[userName] LIKE ?;";
        try {
            conn = connection;
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

    public List<RoomListSE> searchRoomByName(String txtSearch) {
        List<RoomListSE> list = new ArrayList<>();
        String query = "SELECT r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomImg\n"
                + "              FROM [dbo].[Room] AS r\n"
                + "WHERE r.[roomNumber] LIKE ?;";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RoomListSE(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RoomListSE> getAllRoom() {
        List<RoomListSE> list = new ArrayList<>();
        String query = "SELECT r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomImg\n"
                + "              FROM [dbo].[Room] AS r";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RoomListSE(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public RoomDetailSe getRoomById(String id) {

        String query = "SELECT r.[roomID], r.[roomNumber], r.[roomImg], r.[roomSize], r.[roomFloor], i.itemName, i.itemImg, ri.quantity\n"
                + "FROM [dbo].[Room] AS r\n"
                + "JOIN [dbo].[RoomItem] AS ri ON r.roomID = ri.roomID\n"
                + "JOIN [dbo].[item] AS i ON ri.itemID = i.itemID\n"
                + "where ri.roomID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new RoomDetailSe(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        RoomDetailSe a = dao.getRoomById("2");
        System.out.println(a);
    }       

    public List<SeNews> getAllNews() {
        List<SeNews> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM [dbo].[News]\n"
                + "ORDER BY creatAt DESC ";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SeNews(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public SeUserProfile getProfileById(String id) {

        String query = "select u.[userID],u.[userName],u.[userGender],u.[userBirth],u.[userAddress],u.[userPhone] ,u.[userAvatar], a.userMail\n"
                + "from [dbo].[user] as u\n"
                + "join dbo.account as a on a.userID = u.userID\n"
                + "where u.userID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new SeUserProfile(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateProfile(String userName, String userGender,
            String userBirth, String userAddress, String userPhone,
            String userAvatar, int pid) {
        String query = "update [dbo].[user]\n"
                + " set [userName] = ?,\n"
                + " [userGender] = ?,\n"
                + " [userBirth] = ?,\n"
                + " [userAddress] = ?,\n"
                + " [userPhone] = ?,\n"
                + " [userAvatar] = ?\n"
                + " where userID = ?";
        try ( Connection conn = connection;  PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, userName);
            ps.setString(2, userGender);
            ps.setString(3, userBirth);
            ps.setString(4, userAddress);
            ps.setString(5, userPhone);
            ps.setString(6, userAvatar);
            ps.setInt(7, pid);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addNews(String newTitle, String description, String img, LocalDateTime creatAt) {
        boolean status = false;
        String query = "INSERT [dbo].[news] ( [newTitle], [description], [img], [creatAt])\n"
                + "                VALUES (?,?,?,?)";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, newTitle);
            ps.setString(2, description);
            ps.setString(3, img);
            ps.setString(4, creatAt.toString());
            rs = ps.executeQuery();
//            ps.executeUpdate();

            int val = ps.executeUpdate();
            if (val > 0) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public SeNews getNewsById(String id) {

        String query = "select *\n"
                + "from dbo.news\n"
                + "where newID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new SeNews(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteNews(String nid) {
        String query = "delete from [dbo].[News]\n"
                + "where newID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, nid);

            ps.executeUpdate(); //khong tra ve bang result nen phai dung excute update
        } catch (Exception e) {
        }
    }

    public void updateNews(String newTitle, String description,
            String img, LocalDateTime creatAt, int sid) {
        String query = "update [dbo].[news]\n"
                + "set [newTitle] = ?,\n"
                + "[description] = ?,\n"
                + "[img] = ?,\n"
                + "[creatAt] = ?\n"
                + "where newID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, newTitle);
            ps.setString(2, description);
            ps.setString(3, img);
            ps.setString(4, creatAt.toString());
            ps.setInt(5, sid);

            ps.executeUpdate(); //khong tra ve bang result nen phai dung excute update
        } catch (Exception e) {
        }
    }
    
}
