/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Bill;
import Models.Renter;
import Models.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.User;
import java.sql.Timestamp;
import java.sql.Types;
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

    public List<Bill> getAllBillsByUserID(int userID) {
        List<Bill> billList = new ArrayList<>();
        String sql = "SELECT b.* FROM bill b "
                + "INNER JOIN renter r ON b.roomID = r.roomID "
                + "INNER JOIN account a ON r.userID = a.userID "
                + "WHERE a.userID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getInt("billID"));
                bill.setRoomID(rs.getInt("roomID"));
                bill.setService(rs.getDouble("service"));
                bill.setElectric(rs.getDouble("electric"));
                bill.setWater(rs.getDouble("water"));
                bill.setRoomFee(rs.getDouble("roomFee"));
                bill.setOther(rs.getDouble("other"));
                bill.setPenMoney(rs.getDouble("penMoney"));
                bill.setCreateAt(rs.getTimestamp("createAt"));
                bill.setDeadline(rs.getTimestamp("deadline"));
                bill.setPayAt(rs.getTimestamp("payAt"));
                billList.add(bill);
            }
        } catch (SQLException e) {
            System.out.println("Failed to retrieve bills: " + e.getMessage());
        }
        return billList;
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

    public boolean updateUser(int id, String gender, String address, String phone, String birth, String name) {
        try {
            PreparedStatement ps;
            String sql = "UPDATE INTO [dbo].[user]\n"
                    + "           ([userID]\n"
                    + "           ,[userName]\n"
                    + "           ,[userGender]\n"
                    + "           ,[userBirth]\n"
                    + "           ,[userAddress]\n"
                    + "           ,[userPhone])\n"
                    + "		   VALUES (?,?,?,?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, gender);
            ps.setString(4, birth);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User getUserByID(int userID) {
        String sql = "SELECT * FROM [dbo].[user] WHERE userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("userGender"),
                        rs.getString("userBirth"),
                        rs.getString("userAddress"),
                        rs.getString("userPhone"),
                        rs.getString("userAvatar")
                );
                // Add any additional attributes you need from the ResultSet
                return user;
            } else {
                // Handle case where user is not found
                return null;
            }
        } catch (SQLException e) {
            // Handle SQLException
            Logger.getLogger(RenterDAO.class.getName()).log(Level.SEVERE, "Failed to get user by mail and password", e);
            return null;
        }
    }

    public void updateUser(User u) {
        String sql = "UPDATE [dbo].[user]\n"
                + "SET [userName] = ?,\n"
                + "    [userGender] = ?,\n"
                + "    [userBirth] = ?,\n"
                + "    [userAddress] = ?,\n"
                + "    [userPhone] = ?,\n"
                + "    [userAvatar] = ?\n"
                + "WHERE [userID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            st.setString(2, u.getUserGender());
            st.setString(3, u.getUserBirth());
            st.setString(4, u.getUserAddress());
            st.setString(5, u.getUserPhone());
            st.setString(6, u.getUserAvatar());
            st.setInt(7, u.getUserID()); // Assuming userID is an int

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
    }

    public List<Bill> getBillsByRenterID(int renterID) {
        List<Bill> billList = new ArrayList<>();
        String sql = "SELECT * FROM bill WHERE renterID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, renterID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getInt("billID"));
                bill.setRoomID(rs.getInt("roomID"));
                bill.setService(rs.getDouble("service"));
                bill.setElectric(rs.getDouble("electric"));
                bill.setWater(rs.getDouble("water"));
                bill.setRoomFee(rs.getDouble("roomFee"));
                bill.setOther(rs.getDouble("other"));
                bill.setPenMoney(rs.getDouble("penMoney"));
                bill.setCreateAt(rs.getTimestamp("createAt"));
                bill.setDeadline(rs.getTimestamp("deadline"));
                bill.setPayAt(rs.getTimestamp("payAt"));
                billList.add(bill);
            }
        } catch (SQLException e) {
            System.out.println("Failed to retrieve bills: " + e.getMessage());
        }
        return billList;
    }

    public boolean updateBill(Bill bill) {
        String sql = "UPDATE bill SET service = ?, electric = ?, water = ?, roomFee = ?, other = ?, penMoney = ?, createAt = ?, deadline = ?, payAt = ? WHERE billID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, bill.getService());
            ps.setDouble(2, bill.getElectric());
            ps.setDouble(3, bill.getWater());
            ps.setDouble(4, bill.getRoomFee());
            ps.setDouble(5, bill.getOther());
            ps.setDouble(6, bill.getPenMoney());
            ps.setTimestamp(7, new Timestamp(bill.getCreateAt().getTime()));
            ps.setTimestamp(8, new Timestamp(bill.getDeadline().getTime()));
            if (bill.getPayAt() != null) {
                ps.setTimestamp(9, new Timestamp(bill.getPayAt().getTime()));
            } else {
                ps.setNull(9, Types.TIMESTAMP);
            }
            ps.setInt(10, bill.getBillID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Failed to update bill: " + e.getMessage());
            return false;
        }
    }

    public Bill getBillByID(int billID) {
        Bill bill = null;
        String sql = "SELECT * FROM bill WHERE billID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, billID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bill = new Bill();
                bill.setBillID(rs.getInt("billID"));
                bill.setRoomID(rs.getInt("roomID"));
                bill.setService(rs.getDouble("service"));
                bill.setElectric(rs.getDouble("electric"));
                bill.setWater(rs.getDouble("water"));
                bill.setRoomFee(rs.getDouble("roomFee"));
                bill.setOther(rs.getDouble("other"));
                bill.setPenMoney(rs.getDouble("penMoney"));
                bill.setCreateAt(rs.getTimestamp("createAt"));
                bill.setDeadline(rs.getTimestamp("deadline"));
                bill.setPayAt(rs.getTimestamp("payAt"));
            }
        } catch (SQLException e) {
            System.out.println("Failed to retrieve bill: " + e.getMessage());
        }
        return bill;
    }

}
