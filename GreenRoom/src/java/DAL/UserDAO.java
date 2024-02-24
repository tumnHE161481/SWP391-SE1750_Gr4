/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Renter;
import Models.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.User;

/**
 *
 * @author ASUS
 */
public class UserDAO extends MyDAO {

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
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    //list Renter information detail
    public List<User> getRenterDetail(int id) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT DISTINCT "
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, \n"
                + "    r.renterID, r.roomID, r.renterStatus, r.renterHaveRoom,"
                + "    a.userMail, a.userPassword,"
                + "    rm.roomFloor, rm.roomNumber"
                + " FROM"
                + "    [User] u \n"
                + " JOIN "
                + "    Renter r ON u.userID = r.userID"
                + " JOIN"
                + "    Account a ON u.userID = a.userID"
                + " LEFT JOIN"
                + "    Room rm ON r.roomID = rm.roomID"
                + " WHERE"
                + "    u.userID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt(1);
                String userName = rs.getString(2);
                String userGender = rs.getString(3);
                String userBirth = rs.getString(4);
                String userAddress = rs.getString(5);
                String userPhone = rs.getString(6);
                String userAvatar = rs.getString(7);
                int renterID = rs.getInt(8);
                int roomID = rs.getInt(9);
                boolean renterStatus = rs.getBoolean(10);
                boolean renterHaveRoom = rs.getBoolean(11);
                String userMail = rs.getString(12);
                String userPassword = rs.getString(13);
                int roomFloor = rs.getInt(14);
                String roomNumber = rs.getString(15);
                Account account = new Account(userId, userMail, userPassword, 1);
                Renter renter = new Renter(renterID, userId, roomID, renterStatus, renterHaveRoom);
                Room room = new Room(roomID, roomFloor, roomNumber, roomID, roomNumber, roomNumber);
                User user = new User(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, renter, room);
                list.add(user);
            }
        } catch (SQLException e) {

            // Handle exception as needed
        }
        return list;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();

        // Uncomment the appropriate method call based on your needs
        // List<User> list = dao.getUserList();
        List<User> list = dao.getRenterDetail(5);
        for (User user : list) {
            System.out.println("User ID: " + user.getUserID());
            System.out.println("User Name: " + user.getUserName());
            System.out.println("User Gender: " + user.getUserGender());
            System.out.println("User Birth: " + user.getUserBirth());
            System.out.println("User Address: " + user.getUserAddress());
            System.out.println("User Phone: " + user.getUserPhone());
            System.out.println("User Avatar: " + user.getUserAvatar());

            // Print information from Account
            System.out.println("User Mail: " + user.getAccount().getUserMail());
            System.out.println("User Password: " + user.getAccount().getUserPassword());

            // Print information from Renter
            System.out.println("Renter ID: " + user.getRenter().getRenterID());
            System.out.println("Room ID: " + user.getRenter().getRoomID());
            System.out.println("Renter Status: " + user.getRenter().isRenterStatus());
            System.out.println("Renter Have Room: " + user.getRenter().isRenterHaveRoom());

            // Print information from Room
            System.out.println("Room Floor: " + user.getRoom().getRoomFloor());
            System.out.println("Room Number: " + user.getRoom().getRoomNumber());

            System.out.println("--------");
        }
    }

    public List<User> getOwner() {
        List<User> list = new ArrayList<>();
        String sql = "  SELECT [User].userID, [User].userName, [User].userGender, [User].userBirth, [User].userAddress, [User].userPhone, [User].userAvatar\n"
                + "     FROM [User]\n"
                + "     INNER JOIN Account ON [User].userID = Account.userID\n"
                + "     WHERE Account.userRole = 3";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

}
