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

    public List<Guideline> getAllGuideline() {
        List<Guideline> list = new ArrayList<>();
        String sql = "SELECT * FROM guideline";
        // Declaring variables for connection, statement, and result set
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

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
    public List<Rule> getAllRule() {
        List<Guideline> list = new ArrayList<>();
        String sql = "SELECT * FROM rule";
        // Declaring variables for connection, statement, and result set
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

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
    
}
