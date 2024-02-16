package DAL;

import Models.Account;
import Models.Penalty;
import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PenaltyDAO extends MyDAO {
    public List<Penalty> getPenalty(String account_input, String password_input) {
        List<Penalty> list = new ArrayList<>();
        String sql = "SELECT DISTINCT\n"
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar,\n"
                + "    p.penID, p.title, p.description, p.penMoney, p.penStatus\n"
                + "FROM\n"
                + "    User u\n"
                + "JOIN\n"
                + "    Penalty p ON u.userID = p.userID\n"
                + "JOIN\n"
                + "    Account a ON u.userID = a.userID\n"
                + "WHERE\n"
                + "    a.userMail = ? AND a.userPassword = ?"; // Use placeholders
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, account_input);
            ps.setString(2, password_input);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int userId = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String userGender = rs.getString("userGender");
                    String userBirth = rs.getString("userBirth");
                    String userAddress = rs.getString("userAddress");
                    String userPhone = rs.getString("userPhone");
                    String userAvatar = rs.getString("userAvatar");
                    int penID = rs.getInt("penID");
                    String penaltyTitle = rs.getString("title");
                    String penaltyDescription = rs.getString("description");
                    int penMoney = rs.getInt("penMoney");
                    int penStatus = rs.getInt("penStatus");
                    Account account = new Account(userId, account_input, password_input, 1);
                    User user = new User(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar);
                    Penalty penalty = new Penalty(penID, penaltyTitle, penaltyDescription, penMoney, penStatus);
                    penalty.setAccount(account);
                    penalty.setUser(user);
                    list.add(penalty);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly (log or rethrow)
        }
        return list;
    }
}
