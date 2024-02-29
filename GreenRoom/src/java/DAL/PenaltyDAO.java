/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Penalty;
import Models.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class PenaltyDAO extends MyDAO{
     public List<Penalty> historyPenalty() {
        List<Penalty> list = new ArrayList<>();
        String sql = "SELECT \n" +
"      [reportID]\n" +
"      ,[accuseID]\n" +
"      ,[roomID]\n" +
"      ,[description]\n" +
"      ,[penDate]\n" +
"      ,[ruleID]\n" +
"      ,[penStatus]\n" +
"  FROM [GreenRoom].[dbo].[penalty]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                User user = new User(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), account);
               
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
}
