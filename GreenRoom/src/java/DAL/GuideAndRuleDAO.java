package DAL;

import Models.Guideline;
import Models.Rule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GuideAndRuleDAO extends DBContext {

    public List<Guideline> getGuide() {
        List<Guideline> list = new ArrayList<>();
        String sql = "SELECT * FROM guideline";
        // Declaring variables for connection, statement, and result set
        try ( Connection conn = connection;  PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {

            // Iterate through the result set and populate the list
            while (rs.next()) {
                // Create a new Guideline object and add it to the list
                Guideline guideline = new Guideline(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                list.add(guideline);
            }
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(GuideAndRuleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Return the list of guidelines
        return list;
    }

    public List<Rule> getRule() {
        List<Rule> list = new ArrayList<>();
        String sql = "SELECT * FROM [rule]";
        // Declaring variables for connection, statement, and result set
        try ( Connection conn = connection;  PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {

            // Iterate through the result set and populate the list
            while (rs.next()) {
                // Create a new Guideline object and add it to the list
                Rule rule = new Rule(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5)
                );
                list.add(rule);
            }
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(GuideAndRuleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Return the list of guidelines
        return list;
    }

    public boolean addRule(String name, String img, int score, int money) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [dbo].[rule]\n"
                    + "           ([ruleName]\n"
                    + "           ,[img]\n"
                    + "           ,[scoreChange]\n"
                    + "           ,[penMoney])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setInt(3, score);
            ps.setInt(4, money);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean editRule(int id,String name, String img, int score, int money) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "UPDATE [dbo].[rule]\n"
                    + "   SET [ruleName] = ?\n"
                    + "      ,[img] = ?\n"
                    + "      ,[scoreChange] = ?\n"
                    + "      ,[penMoney] = ?\n"
                    + " WHERE [ruleID] = ?";

            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setInt(3, score);
            ps.setInt(4, money);
            ps.setInt(5, id);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void DeleteRule(int id) {
        String sql = "delete from [GreenRoom].[dbo].[rule] where ruleID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        GuideAndRuleDAO dao = new GuideAndRuleDAO();

        // Uncomment the appropriate method call based on your needs
        // List<User> list = dao.getUserList();
//        List<Rule> list = dao.getRule();
//        for (Rule rule : list) {
//            System.out.print("rule ID: " + rule.getRuleID());
//            System.out.print(" ");
//            System.out.print("name: " + rule.getRuleName());
//            System.out.print(" ");
//            System.out.print("img: " + rule.getImg());
//            System.out.print(" ");
//            System.out.print("score: " + rule.getScoreChange());
//            System.out.print(" ");
//            System.out.println("penmoney: " + rule.getPenMoney());
//        }
//        boolean d = dao.addRule("test", "./Image/rule/rule6.jpg", 10, 100);
//        System.err.println(d);
        boolean b = dao.editRule(2, "Quiet Hour", "./Image/rule/rule2.jpg", -5, 50);
        System.err.println(b);

    }

}
