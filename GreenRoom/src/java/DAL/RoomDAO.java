/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Item;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Room;
import Models.RoomItem;

/**
 *
 * @author ASUS
 */
public class RoomDAO extends MyDAO {
//Table - Room

    /*
    1.roomID - int
    2.roomFloor - int
    3.roomNumber - int
    4.roomSize - int
    5.roomImg - String
     */
    //Table - Room Item
    /*
    1.itemID - int
    2.singleBed - int
    3.bunk - int
    4.chair - int
    5.ceilingFans - boolean
    6.airConditional - boolean
     */
    public List<Room> getAvailableRoom() {
        List<Room> list = new ArrayList<>();
        String statement = "SELECT r.roomID,r.roomFloor, r.roomNumber, r.roomSize,r.roomImg\n"
                + "FROM Room r\n"
                + "LEFT JOIN (\n"
                + "    SELECT roomID, COUNT(*) AS totalRenters\n"
                + "    FROM Renter\n"
                + "    WHERE renterStatus = 1\n"
                + "    GROUP BY roomID\n"
                + ") renter_counts ON r.roomID = renter_counts.roomID\n"
                + "WHERE r.roomSize = 1 AND ISNULL(renter_counts.totalRenters, 0) = 0\n"
                + "   OR (r.roomSize = 2 AND ISNULL(renter_counts.totalRenters, 0) < 2)\n"
                + "   OR (r.roomSize = 3 AND ISNULL(renter_counts.totalRenters, 0) < 4);";

        //ISNULL same toan tu 3 ngôi (VD: status ? true : false <=> ISNULL(count, 0) if null total = 0, else total = count)
        try {
            ps = con.prepareStatement(statement);
            rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public int findRoomIDByRoomNumber(int roomNumber) {
        int roomID = -1; // Default value if the room is not found
        String statement = "SELECT roomID FROM [room] WHERE roomNumber = ?";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, roomNumber);
            rs = ps.executeQuery();

            if (rs.next()) {
                roomID = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }

        return roomID;
    }

    public List<Room> getRoom() {
        List<Room> list = new ArrayList<>();
        String statement = "SELECT r.*, COUNT(re.renterID) AS total\n"
                + "FROM Room r\n"
                + "LEFT JOIN Renter re ON r.roomID = re.roomID\n"
                + "GROUP BY r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomImg;";
        try {
            ps = con.prepareStatement(statement);
            rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6));
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public List<Room> getRoomItems(int id) {
        List<Room> list = new ArrayList<>();
        String statement = "SELECT i.itemImg, i.itemName, ri.quantity\n"
                + "FROM room r\n"
                + "INNER JOIN roomitem ri ON r.roomID = ri.roomID\n"
                + "INNER JOIN item i ON ri.itemID = i.itemID\n"
                + "WHERE r.roomID = ?\n"
                + "ORDER BY i.itemName;";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Item item = new Item(rs.getString(2), rs.getString(1));
                RoomItem roomitem= new RoomItem(rs.getInt(3));
                Room room = new Room(item, roomitem);
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public Room getRoomDetail(int id) {
        String sql = "SELECT \n"
                + "    r.*,\n"
                + "    COUNT(re.renterID) AS total\n"
                + "FROM \n"
                + "    Room r\n"
                + "LEFT JOIN \n"
                + "    Renter re ON r.roomID = re.roomID\n"
                + "WHERE \n"
                + "    r.roomID = ?\n"
                + "GROUP BY \n"
                + "    r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomImg";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int roomID = rs.getInt(1);
                int roomFloor = rs.getInt(2);
                int roomNumber = rs.getInt(3);
                int roomSize = rs.getInt(4);
                String roomImg = rs.getString(5);
                int total = rs.getInt(6);
                Room room = new Room(roomID, roomFloor, roomNumber, roomSize, roomImg, total);
                return room;
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());

        }
        return null;
    }

    public static void main(String[] args) {
        RoomDAO dao = new RoomDAO();
        List<Room> list = dao.getRoomItems(1);
        for (Room room : list) {
            System.out.println("itemName: "+ room.getItem().getItemName());
        }
//        List<Room> list = dao.getAvailableRoom();
//        System.out.println("Room data");
//        for (Room room : list) {
//            System.out.println("RoomID: " + room.getRoomID());
//            System.out.println("RoomFloor: " + room.getRoomFloor());
//            System.out.println("RoomNumber: " + room.getRoomNumber());
//            System.out.println("RoomSize: " + room.getRoomSize());
//            System.out.println("RoomImg: " + room.getRoomImg());
//        }
//        List<Room> list = dao.getRoomDetailsForRoomID(1);
//        for (Room room : list) {
//            System.out.println("Room ID: " + room.getRoomID());
//            System.out.println("Floor: " + room.getRoomFloor());
//            System.out.println("Room Number: " + room.getRoomNumber());
//            System.out.println("Room Size: " + room.getRoomSize());
//            System.out.println("Room Img: " + room.getRoomImg());
//
//            RoomItem roomItem = room.getItem();
//            System.out.println("Item ID: " + roomItem.getItemID());
//            System.out.println("Single Bed: " + roomItem.getSingleBed());
//            System.out.println("Bunk: " + roomItem.getBunk());
//            System.out.println("Chair: " + roomItem.getChair());
//            System.out.println("Ceiling Fans: " + roomItem.isCeilingFans());
//            System.out.println("Air Conditional: " + roomItem.isAirConditional());
//
//            System.out.println("-------------");
//        }

//        int roomID = dao.findRoomIDByRoomNumber(202);
//        System.out.println("roomID = " + roomID);
        Room room = dao.getRoomDetail(1);
        System.out.println("roomID: " + room.getRoomID());
        System.out.println("roomImg: " + room.getRoomImg());
    }
}
