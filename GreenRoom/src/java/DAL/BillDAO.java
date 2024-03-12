/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author ASUS
 */
public class BillDAO extends MyDAO {

    public List<Bill> getBillByRoomID(int id) {
        List<Bill> list = new ArrayList<>();
        String sql
                = "SELECT \n"
                + "    [billID],\n"
                + "    [roomID],\n"
                + "    [service],\n"
                + "    [electric],\n"
                + "    [water],\n"
                + "    [roomFee],\n"
                + "    [other],\n"
                + "    [penMoney],\n"
                + "    [createAt],\n"
                + "    [deadline],\n"
                + "    [payAt],\n"
                + "    ([service] + [electric] + [water] + [roomFee] + [other] + [penMoney]) AS total\n"
                + "FROM \n"
                + "    [GreenRoom].[dbo].[bill]\n"
                + "WHERE [roomID] = ?\n"
                + "ORDER BY \n"
                + "    [createAt] DESC;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill= new Bill(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4),
                        rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8),
                        rs.getDouble(12), rs.getString(9), rs.getString(10), rs.getString(11));
                list.add(bill);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return list;
    }
    
    public Bill getBillBybillID(int id) {
        String sql
                = "SELECT \n"
                + "    [billID],\n"
                + "    [roomID],\n"
                + "    [service],\n"
                + "    [electric],\n"
                + "    [water],\n"
                + "    [roomFee],\n"
                + "    [other],\n"
                + "    [penMoney],\n"
                + "    [createAt],\n"
                + "    [deadline],\n"
                + "    [payAt],\n"
                + "    ([service] + [electric] + [water] + [roomFee] + [other] + [penMoney]) AS total\n"
                + "FROM \n"
                + "    [GreenRoom].[dbo].[bill]\n"
                + "WHERE [billID] = ?\n"
                + "ORDER BY \n"
                + "    [createAt] DESC;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill= new Bill(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4),
                        rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8),
                        rs.getDouble(12), rs.getString(9), rs.getString(10), rs.getString(11));
                return bill;
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());
        
        }
        return null;
    }
    public static void main(String[] args) {
        BillDAO dao = new BillDAO();
        Bill bill = new Bill();
        System.out.println("pen:"+bill.getPenMoney());
    }
}
