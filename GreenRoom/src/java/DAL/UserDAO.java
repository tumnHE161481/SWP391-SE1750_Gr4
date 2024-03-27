/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
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

    //Table - user
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
    public List<UserTu> getUserList() {
        List<UserTu> list = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserTu user = new UserTu(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    //List Renter information detail
    public UserTu getRenterDetail(int id) {
        String sql = "SELECT DISTINCT "
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, \n"
                + "    r.renterID, r.roomID, r.renterStatus, r.renterHaveRoom, r.CGRScore, r.balance, "
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
                int CGRScore = rs.getInt(12);
                double balance = rs.getDouble(13);
                String userMail = rs.getString(14);
                String userPassword = rs.getString(15);
                int roomFloor = rs.getInt(16);
                int roomNumber = rs.getInt(17);
                Account account = new Account(userId, userMail, userPassword, 1);
                Renter renter = new Renter(renterID, userId, roomID, renterStatus, renterHaveRoom, CGRScore, balance);
                RoomTu room = new RoomTu(roomID, roomFloor, roomNumber, roomNumber, "");
                UserTu user = new UserTu(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, renter, room);
                return user;
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return null;
    }

    //List Security information detail
    public UserTu getSecurityDetail(int id) {
        String sql = "SELECT DISTINCT "
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, \n"
                + "    se.seID, se.sShift, se.seStatus,"
                + "    a.userMail, a.userPassword"
                + " FROM"
                + "    [user] u \n"
                + " JOIN "
                + "    [security] se ON u.userID = se.userID"
                + " JOIN"
                + "    account a ON u.userID = a.userID"
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
                int seID = rs.getInt(8);
                boolean sShift = rs.getBoolean(9);
                boolean seStatus = rs.getBoolean(10);
                String userMail = rs.getString(11);
                String userPassword = rs.getString(12);
                Account account = new Account(userId, userMail, userPassword, 2);
                Security security = new Security(seID, userId, sShift, seStatus);
                UserTu user = new UserTu(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, security);
                return user;
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return null;
    }

    //Get Renter information detail
    public UserTu getRenterForEdit(int id) {
        String sql = "SELECT DISTINCT "
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, \n"
                + "    r.renterID, r.roomID, r.renterStatus, r.renterHaveRoom, r.CGRScore, r.balance,"
                + "    a.userMail, a.userPassword,"
                + "    rm.roomFloor, rm.roomNumber"
                + " FROM"
                + "    [user] u \n"
                + " JOIN "
                + "    renter r ON u.userID = r.userID"
                + " JOIN"
                + "    account a ON u.userID = a.userID"
                + " LEFT JOIN"
                + "    room rm ON r.roomID = rm.roomID"
                + " WHERE"
                + "    u.userID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
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
                int CGRScore = rs.getInt(12);
                double balance = rs.getDouble(13);
                String userMail = rs.getString(14);
                String userPassword = rs.getString(15);
                int roomFloor = rs.getInt(16);
                int roomNumber = rs.getInt(17);
                Account account = new Account(userId, userMail, userPassword, 1);
                Renter renter = new Renter(renterID, userId, roomID, renterStatus, renterHaveRoom, CGRScore, balance);
                RoomTu room = new RoomTu(roomID, roomFloor, roomNumber, roomNumber, "");
                UserTu user = new UserTu(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, renter, room);
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());

        }
        return null;
    }

    public List<UserTu> manageAccount() {
        List<UserTu> list = new ArrayList<>();
        String sql = "SELECT a.userID,\n"
                + "       a.userMail,\n"
                + "       a.userPassword,\n"
                + "       a.userRole,\n"
                + "       u.userName,\n"
                + "       u.userGender,\n"
                + "       u.userBirth,\n"
                + "       u.userAddress,\n"
                + "       u.userPhone,\n"
                + "       u.userAvatar\n"
                + "FROM Account a\n"
                + "INNER JOIN [User] u ON a.userID = u.userID\n"
                + "WHERE  a.userRole != 0 AND a.userRole != 3 AND a.userRole != 4;";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                UserTu user = new UserTu(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), account);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return list;
    }

    public List<UserTu> manageNewAccount() {
        List<UserTu> list = new ArrayList<>();
        String sql = "SELECT a.userID,\n"
                + "       a.userMail,\n"
                + "       a.userPassword,\n"
                + "       a.userRole,\n"
                + "       u.userName,\n"
                + "       u.userGender,\n"
                + "       u.userBirth,\n"
                + "       u.userAddress,\n"
                + "       u.userPhone,\n"
                + "       u.userAvatar\n"
                + "FROM Account a\n"
                + "INNER JOIN [User] u ON a.userID = u.userID\n"
                + "WHERE  a.userRole = 0;";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                UserTu user = new UserTu(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), account);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return list;
    }

    public List<UserTu> getOwner() {
        List<UserTu> list = new ArrayList<>();
        String sql = "  SELECT [User].userID, [User].userName, [User].userGender, [User].userBirth, [User].userAddress, [User].userPhone, [User].userAvatar\n"
                + "     FROM [User]\n"
                + "     INNER JOIN Account ON [User].userID = Account.userID\n"
                + "     WHERE Account.userRole = 3";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserTu user = new UserTu(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    //Count number search results
    public int countSearchResult(String txtSearch) {
        String sql = "SELECT COUNT(*) AS resultCount\n"
                + "FROM [User] u \n"
                + "JOIN Account a ON u.userID = a.userID \n"
                + "WHERE a.userRole != 3 AND a.userRole != 4 \n"
                + "AND (u.userName LIKE ? OR a.userMail LIKE ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return 0;
    }

    //List search results
    public List<UserTu> searchResult(String txtSearch) {
        List<UserTu> list = new ArrayList<>();
        String sql = "SELECT u.userID, u.userAvatar, u.userName, a.userMail, a.userRole \n"
                + "FROM [user] u\n"
                + " JOIN account a ON u.userID = a.userID\n"
                + "WHERE a.userRole != 3 AND a.userRole != 4 \n"
                + "AND (u.userName LIKE ? OR a.userMail LIKE ?)\n"
                + "ORDER BY u.userID";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(4), "", rs.getInt(5));
                UserTu user = new UserTu(rs.getInt(1), rs.getString(3), rs.getString(2), account);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        } finally {
            // Handle closing resources
        }
        return list;
    }

    //Count number search results
    public int countSearchResult2(String txtSearch) {
        String sql = "SELECT COUNT(*) AS resultCount\n"
                + "FROM [User] u \n"
                + "JOIN Account a ON u.userID = a.userID \n"
                + "WHERE a.userRole = 0\n"
                + "AND (u.userName LIKE ? OR a.userMail LIKE ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return 0;
    }

    //List search results
    public List<UserTu> searchResult2(String txtSearch) {
        List<UserTu> list = new ArrayList<>();
        String sql = "SELECT u.userID, u.userAvatar, u.userName, a.userMail, a.userRole \n"
                + "FROM [user] u\n"
                + " JOIN account a ON u.userID = a.userID\n"
                + "WHERE a.userRole = 0\n"
                + "AND (u.userName LIKE ? OR a.userMail LIKE ?)\n"
                + "ORDER BY u.userID";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(4), "", rs.getInt(5));
                UserTu user = new UserTu(rs.getInt(1), rs.getString(3), rs.getString(2), account);
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        } finally {
            // Handle closing resources
        }
        return list;
    }

    public List<UserTu> getUserByRoomID(int id) {
        List<UserTu> list = new ArrayList<>();
        String sql = "SELECT u.*\n"
                + "FROM [user] u\n"
                + "JOIN renter r ON u.userID = r.userID\n"
                + "WHERE r.roomID = ?;";

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
                UserTu user = new UserTu(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar);
                list.add(user);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return list;
    }

    public UserTu getNewAccDetail(int id) {
        String sql = "SELECT \n"
                + "    u.userID, \n"
                + "    u.userName, \n"
                + "    u.userGender, \n"
                + "    u.userBirth, \n"
                + "    u.userAddress, \n"
                + "    u.userPhone, \n"
                + "    u.userAvatar,\n"
                + "    a.userMail,\n"
                + "    a.userPassword\n"
                + "FROM [user] u\n"
                + "INNER JOIN [account] a ON u.userID = a.userID\n"
                + "WHERE a.userRole = 0 AND a.userID = ?;";

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
                String userMail = rs.getString(8);
                String userPassword = rs.getString(9);
                Account account = new Account(userId, userMail, userPassword, 0);
                UserTu user = new UserTu(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account);
                return user;
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return null;
    }

      public List<UserTu> getRenterDetailByAccountAndPassword(String account_input, String password_input) {
        List<UserTu> list = new ArrayList<>();
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
                int roomNumber = rs.getInt(17);

                Account account = new Account(userID, userMail, userPassword, 1);
                Renter renter = new Renter(renterID, userID, roomID, renterStatus, renterHaveRoom, CGRScore, balance);
                RoomTu room = new RoomTu(roomID, roomFloor, roomNumber, roomID, "", roomNumber);
                UserTu user = new UserTu(userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, renter, room);
                list.add(user);
            }

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }
}
