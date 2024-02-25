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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author creep
 */
public class RenterDAO extends MyDAO {

    //User detail by account and password
    public List<User> getRenterDetailByAccountAndPassword(String account_input, String password_input) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT DISTINCT "
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, \n"
                + "    r.renterID, r.roomID, r.renterStatus, r.renterHaveRoom, r.CGRScore, r.balance, \n" // Include CGRScore and balance
                + "    a.userMail, a.userPassword, \n"
                + "    rm.roomFloor, rm.roomNumber \n"
                + "FROM \n"
                + "    \"user\" u \n"
                + "JOIN \n"
                + "    renter r ON u.userID = r.userID \n"
                + "JOIN \n"
                + "    account a ON u.userID = a.userID \n"
                + "LEFT JOIN \n"
                + "    room rm ON r.roomID = rm.roomID \n"
                + "WHERE \n"
                + "    a.userMail = ? AND a.userPassword = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, account_input);
            ps.setString(2, password_input);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                int userID = rs.getInt(1);
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
                 int CGRScore = rs.getInt(12); // Fetch CGRScore
                double balance = rs.getDouble(13); // Fetch balance
                String userMail = rs.getString(14);
                String userPassword = rs.getString(15);
                int roomFloor = rs.getInt(16);
                String roomNumber = rs.getString(17);
               

                Account account = new Account(userID, userMail, userPassword, 1);
                Renter renter = new Renter(renterID, userID, roomID, renterStatus, renterHaveRoom, CGRScore, balance);
                Room room = new Room(roomID, roomFloor, roomNumber, roomID, roomNumber, roomNumber);
                User user = new User(userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, renter, room);
                list.add(user);
            }

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public boolean changePassword(String account_input, String oldPassword, String newPassword) {
        String sql = "UPDATE account SET userPassword = ? WHERE userMail = ? AND userPassword = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, account_input);
            ps.setString(3, oldPassword);

            int affectedRows = ps.executeUpdate();

            return affectedRows > 0; // If any row is updated, return true
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        RenterDAO dao = new RenterDAO();

        // Uncomment the appropriate method call based on your needs
        // List<User> list = dao.getUserList();
        List<User> list = dao.getRenterDetailByAccountAndPassword("tester", "1");
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

    public String getPasswordByAccount(String accountInput) {
        String password = null;
        String sql = "SELECT userPassword FROM Account WHERE userMail = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, accountInput);
            rs = ps.executeQuery();

            if (rs.next()) {
                password = rs.getString("userPassword");
            }
        } catch (SQLException e) {
            Logger.getLogger(RenterDAO.class.getName()).log(Level.SEVERE, "Failed to get password", e);
        }
        return password;
    }

    public boolean updatePassword(String accountInput, String newPassword) {
        String sql = "UPDATE Account SET userPassword = ? WHERE userMail = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, accountInput);

            int affectedRows = ps.executeUpdate();

            return affectedRows > 0; // If any row is updated, return true
        } catch (SQLException e) {
            Logger.getLogger(RenterDAO.class.getName()).log(Level.SEVERE, "Failed to update password", e);
            return false;
        }
    }
}
