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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class PenaltyDAO extends MyDAO {

    public List<Penalty> historyPenalty(int reportID) {
        List<Penalty> list = new ArrayList<>();
        String sql = "SELECT \n"
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
                + "    p.penStatus\n"
                + "FROM \n"
                + "    [GreenRoom].[dbo].[rule] r\n"
                + "JOIN \n"
                + "    [GreenRoom].[dbo].[penalty] p ON r.ruleID = p.ruleID\n"
                + "where reportID = ?";

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

                Penalty penalty = new Penalty(
                        rs.getInt("penID"),
                        rs.getInt("reportID"),
                        rs.getInt("accuseID"),
                        rs.getInt("roomID"),
                        rs.getString("description"),
                        rs.getString("penDate"),
                        rs.getInt("ruleID"),
                        rs.getInt("penStatus"),
                        rule
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
    public static void main(String[] args) {
       PenaltyDAO dao = new PenaltyDAO();
       List<Penalty> penalty = dao.historyPenalty(1);
        for (Penalty penalty1 : penalty) {
            System.out.println("Pen" + penalty1.getRuleID());
        }
    }
}
