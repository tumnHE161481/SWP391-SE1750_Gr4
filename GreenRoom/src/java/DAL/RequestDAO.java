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
                + "     ,[renterID]\n"
                + "     ,[requestType]\n"
                + "     ,[title]\n"
                + "     ,[description]\n"
                + "     ,[createAt]\n"
                + "     ,[resStatus]\n"
                + "     ,[reply]\n"
                + "FROM [GreenRoom].[dbo].[request]\n"
                + "WHERE renterID = ?\n"
                + "ORDER BY [createAt] DESC";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request request = new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), formatDate(rs.getString(6)), rs.getString(7), rs.getString(8));
                list.add(request);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return list;
    }

    public static String formatDate(String inputDate) {
        DateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S", Locale.ENGLISH);
        DateFormat outputDateFormat = new SimpleDateFormat("MMMM dd, yyyy - 'at' hh:mm a", Locale.ENGLISH);
        try {
            Date date = inputDateFormat.parse(inputDate);
            return outputDateFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Request> getListByPage(List<Request> list, int start, int end) {
        List<Request> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Request> getAllResponseStatus() {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT DISTINCT [resStatus]\n"
                + "FROM [GreenRoom].[dbo].[request];";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request request = new Request();
                request.setResStatus(rs.getString("resStatus"));
                list.add(request);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return list;
    }

    public List<Request> getRequestByRenterIDAndStatus(int id, String status) {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT [requestID]\n"
                + "     ,[renterID]\n"
                + "     ,[requestType]\n"
                + "     ,[title]\n"
                + "     ,[description]\n"
                + "     ,[createAt]\n"
                + "     ,[resStatus]\n"
                + "     ,[reply]\n"
                + "FROM [GreenRoom].[dbo].[request]\n"
                + "WHERE renterID = ? AND resStatus = ?\n"
                + "ORDER BY [createAt] DESC";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request request = new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), formatDate(rs.getString(6)), rs.getString(7), rs.getString(8));
                list.add(request);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return list;
    }

    public Request getRequestByRequestID(int id) {
        String sql = "SELECT [requestID]\n"
                + "     ,[renterID]\n"
                + "     ,[requestType]\n"
                + "     ,[title]\n"
                + "     ,[description]\n"
                + "     ,[createAt]\n"
                + "     ,[resStatus]\n"
                + "     ,[reply]\n"
                + "FROM [GreenRoom].[dbo].[request]\n"
                + "WHERE requestID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request request = new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), formatDate(rs.getString(6)), rs.getString(7), rs.getString(8));
                return request;
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());

        }
        return null;
    }

    public boolean updateRequestByID(int requestID, int requestType, String title, String description, String creatAt, String resStatus) {
        String sql = "UPDATE [GreenRoom].[dbo].[request]\n"
                + "SET [requestType] = ?, [title] = ?, [description] = ?, [createAt] = ?, [resStatus] = ?, [reply] = ?\n"
                + "WHERE [requestID] = ?;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestType);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setString(4, creatAt);
            ps.setString(5, resStatus);
            ps.setString(6, "");
            ps.setInt(7, requestID);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Request update successfully.");
                return true;
            } else {
                System.out.println("Failed to update request.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
            return false;
        }

    }

    public boolean deleteRequestByID(int requestID) {
        String sql = "DELETE FROM [GreenRoom].[dbo].[request] WHERE [requestID] = ?;";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestID);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Request deleted successfully.");
                return true;
            } else {
                System.out.println("Failed to delete request. RequestID may not exist.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Failed to delete request: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        RequestDAO dao = new RequestDAO();
//        List<Request> list = dao.getRequestByRenterID(1);
//        for (Request request : list) {
//            System.out.println("title: " + request.getTitle());
//        }
//        List<Request> list = dao.getRequestByRenterIDAndStatus(1, "Rejected");
//        for (Request request : list) {
//            System.out.println("title: " + request.getTitle());
//        }
        boolean success = dao.updateRequestByID(14, 1, "Change to ROOM 409", "OKE", "2024-03-07 01:30:20.000", "Pending");
        System.out.println("Success: " + success);
    }

}
