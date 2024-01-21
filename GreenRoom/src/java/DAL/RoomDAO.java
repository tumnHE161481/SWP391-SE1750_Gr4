/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Room;

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

    public static void main(String[] args) {
        RoomDAO dao = new RoomDAO();
        List<Room> list = dao.getRoom();
        System.out.println("Room data");
        for (Room room : list) {
            System.out.println("RoomID: " + room.getRoomID());
            System.out.println("RoomFloor: " + room.getRoomFloor());
            System.out.println("RoomNumber: " + room.getRoomNumber());
            System.out.println("RoomItemID: " + room.getRoomItemID());
            System.out.println("RoomSize: " + room.getRoomSize());
            System.out.println("RoomImg: " + room.getRoomImg());
        }
    }
}
