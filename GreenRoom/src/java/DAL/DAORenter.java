/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.News;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DAORenter extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<News> getAllNews() {
        List<News> list = new ArrayList<>();
        String query = "select u.userName, n.newsTitle, n.newsDes\n"
                + "from  [dbo].[News] as n, [dbo].[User] as u\n"
                + "where n.ownerID = u.userID";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAORenter dao = new DAORenter();
        List<News> list = dao.getAllNews();
        for (News news : list) {
            System.out.println("id:" + news.getNewDes());
            System.out.println("Title:" + news.getNewsTitle());
            System.out.println("des:" + news.getUserName());
        }

    }
}
