/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

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
    3.roomNumber - String
    4.roomItemID - int
    5.roomSize - String
    6.roomImg - String
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
    public List<Room> getRoom() {
        List<Room> list = new ArrayList<>();
        String statement = "select * from [Room]";
        try {
            ps = con.prepareStatement(statement);
            rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public int findRoomIDByRoomNumber(String roomNumber) {
    int roomID = -1; // Default value if the room is not found
    String statement = "SELECT roomID FROM [Room] WHERE roomNumber = ?";
    try {
        ps = con.prepareStatement(statement);
        ps.setString(1, roomNumber);
        rs = ps.executeQuery();

        if (rs.next()) {
            roomID = rs.getInt(1);
        }
    } catch (SQLException e) {
        System.out.println("Fail: " + e.getMessage());
    }

    return roomID;
}
    
    public List<Room> getRoomDetailsForRoomID(int targetRoomID) {
        List<Room> list = new ArrayList<>();
        String sql = "	 SELECT Room.roomID, Room.roomFloor, Room.roomNumber, Room.roomItemID, Room.roomSize, Room.roomImg,\n"
                + "                 RoomItem.itemID, RoomItem.singleBed, RoomItem.bunk, RoomItem.chair, RoomItem.ceilingFans, RoomItem.airConditional\n"
                + "                 FROM Room\n"
                + "                 INNER JOIN [Room_Item] RoomItem ON Room.roomItemID = RoomItem.itemID\n"
                + "                 WHERE Room.roomID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, targetRoomID); // Set the parameter value
            rs = ps.executeQuery();
            while (rs.next()) {
                RoomItem item = new RoomItem(
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getBoolean(11),
                        rs.getBoolean(12));
                Room room = new Room(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6), item);
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        RoomDAO dao = new RoomDAO();
//        List<Room> list = dao.getRoom();
//        System.out.println("Room data");
//        for (Room room : list) {
//            System.out.println("RoomID: " + room.getRoomID());
//            System.out.println("RoomFloor: " + room.getRoomFloor());
//            System.out.println("RoomNumber: " + room.getRoomNumber());
//            System.out.println("RoomItemID: " + room.getRoomItemID());
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

         int roomID = dao.findRoomIDByRoomNumber("101");
         System.out.println(roomID);
    }
}
