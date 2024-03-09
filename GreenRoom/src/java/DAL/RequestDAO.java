/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class RequestDAO extends MyDAO {

    /*
    Table Request
    requestID - int
    renterID - int
    title - String 
    description - String
    creAt - String
    resStatus - String
    reply - String
     */
    public boolean doRequestByID(int renterID, int requestType, String title, String description, String creatAt, String resStatus) {
        String sql = "INSERT INTO [GreenRoom].[dbo].[request] ([renterID], [requestType], [title], [description], [createAt], [resStatus], [reply]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, renterID);
            ps.setInt(2, requestType);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, creatAt);
            ps.setString(6, resStatus);
            ps.setString(7, "");
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Request inserted successfully.");
                return true;
            } else {
                System.out.println("Failed to insert request.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
            return false;
        }

    }

    public List<Request> getRequestByRenterID(int id) {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT [requestID]\n"
                + "      ,[renterID]\n"
                + "      ,[requestType]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[createAt]\n"
                + "      ,[resStatus]\n"
                + "      ,[reply]\n"
                + "  FROM [GreenRoom].[dbo].[request]\n"
                + "  WHERE renterID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request request = new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                list.add(request);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return list;
    }
    
    public static void main(String[] args) {
        RequestDAO dao = new RequestDAO();
        List<Request> list = dao.getRequestByRenterID(1);
        for (Request request : list) {
            System.out.println("title: "+request.getTitle());
        }
    }

}
