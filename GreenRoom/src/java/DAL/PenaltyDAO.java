/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Penalty;
import Models.Renter;
import Models.Room;
import Models.Rule;
import Models.User;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class PenaltyDAO extends MyDAO {

    public List<Penalty> historyPenalty(int reportID) {
        List<Penalty> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    r.ruleID,\n"
                + "    r.ruleName,\n"
                + "    r.img,\n"
                + "    r.scoreChange,\n"
                + "    r.penMoney,\n"
                + "    p.penID,\n"
                + "    p.reportID,\n"
                + "    p.accuseID,\n"
                + "    p.roomID,\n"
                + "    p.description,\n"
                + "    p.penDate,\n"
                + "    p.penStatus,\n"
                + "    rt.renterID,\n"
                + "    rt.userID,\n"
                + "    rt.roomID,\n"
                + "    rt.renterStatus,\n"
                + "    rt.renterHaveRoom,\n"
                + "    rt.CGRScore,\n"
                + "    rt.balance,\n"
                + "    u.userID,\n"
                + "    u.userName,\n"
                + "    u.userGender,\n"
                + "    u.userBirth,\n"
                + "    u.userAddress,\n"
                + "    u.userPhone,\n"
                + "    u.userAvatar\n"
                + "FROM [GreenRoom].[dbo].[rule] AS r\n"
                + "JOIN [GreenRoom].[dbo].[penalty] AS p ON r.ruleID = p.ruleID\n"
                + "JOIN [GreenRoom].[dbo].[renter] AS rt ON p.accuseID = rt.renterID\n"
                + "JOIN [GreenRoom].[dbo].[user] AS u ON rt.userID = u.userID\n"
                + "WHERE p.reportID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, reportID);
            rs = ps.executeQuery();
            while (rs.next()) {

                Rule rule = new Rule(
                        rs.getInt("ruleID"),
                        rs.getString("ruleName"),
                        rs.getString("img"),
                        rs.getString("scoreChange"),
                        rs.getDouble("penMoney")
                );
                Renter renter = new Renter(
                        rs.getInt("renterID"),
                        rs.getInt("userID"),
                        rs.getInt("roomID"),
                        rs.getBoolean("renterStatus"),
                        rs.getBoolean("renterHaveRoom"),
                        rs.getInt("CGRScore"),
                        rs.getDouble("balance")
                );

                User user = new User(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("userGender"),
                        rs.getString("userBirth"),
                        rs.getString("userAddress"),
                        rs.getString("userPhone"),
                        rs.getString("userAvatar")
                );
                Penalty penalty = new Penalty(
                        rs.getInt("penID"),
                        rs.getInt("reportID"),
                        rs.getInt("accuseID"),
                        rs.getInt("roomID"),
                        rs.getString("description"),
                        rs.getString("penDate"),
                        rs.getInt("ruleID"),
                        rs.getInt("penStatus"),
                        rule,
                        user,
                        renter
                );

                // Add Penalty object to the list
                list.add(penalty);
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

    public void addNewPenalty(int reportID, int accuseID, int roomID, String description, String penDate, int ruleID,
            boolean penStatus) {
        String sql = "INSERT INTO [GreenRoom].[dbo].[penalty]\n"
                + "( [reportID],[accuseID],[roomID],[description],[penDate],[ruleID],[penStatus])\n"
                + "VALUES(?,?,?, ?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, reportID);
            ps.setInt(2, accuseID);
            ps.setInt(3, roomID);
            ps.setString(4, description);
            ps.setString(5, penDate);
            ps.setInt(6, ruleID);
            ps.setBoolean(7, penStatus);
            rs = ps.executeQuery();
            ps.executeUpdate();
            System.out.println("add sucessfull");

        } catch (SQLException e) {
            System.err.println("fail");
        }
    }

    public List<Rule> listRule() {
        List<Rule> list = new ArrayList<>();
        String sql = "SELECT  [ruleID]\n"
                + "      ,[ruleName]\n"
                + "      ,[img]\n"
                + "      ,[scoreChange]\n"
                + "      ,[penMoney]\n"
                + "  FROM [GreenRoom].[dbo].[rule]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Rule rule = new Rule(
                        rs.getInt("ruleID"),
                        rs.getString("ruleName"),
                        rs.getString("img"),
                        rs.getString("scoreChange"),
                        rs.getDouble("penMoney")
                );
                // Add Penalty object to the list
                list.add(rule);
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

    public static void main(String[] args) {
        PenaltyDAO dao = new PenaltyDAO();
//        dao.addNewPenalty(1, 2, 1, "TestLan1", "2022-01-15 10:30:00.000", 1, false);
        List<Penalty> list = dao.historyPenalty(1);
        for (Penalty pen : list) {
            System.out.println("AccName:" + pen.getUser().getUserName());
            System.out.println("Des" + pen.getDescription());
        }
    }
}
