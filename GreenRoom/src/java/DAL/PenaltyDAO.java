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

    public List<Penalty> getPenalty(String email, String password) {
        List<Penalty> penalties = new ArrayList<>();
        String sql = "SELECT DISTINCT\n"
                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar,\n"
                + "    p.penID, p.title, p.description, p.penMoney, p.penStatus\n"
                + "FROM\n"
                + "    [user] u\n" // Escape 'User' keyword
                + "JOIN\n"
                + "    penalty p ON u.userID = p.userID\n"
                + "JOIN\n"
                + "    account a ON u.userID = a.userID\n"
                + "WHERE\n"
                + "    a.userMail = ? AND a.userPassword = ?";

        try ( PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);

            try ( ResultSet rs = ps.executeQuery()) {
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

                    Account account = new Account(userId, email, password, 1);
                    User user = new User(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar);
                    Penalty penalty = new Penalty(penID, penaltyTitle, penaltyDescription, penMoney, penStatus);
                    penalty.setAccount(account);
                    penalty.setUser(user);

                    penalties.add(penalty);
                }
            }
        } catch (SQLException e) {
            // Handle the exception properly (log or rethrow)
            e.printStackTrace();
        }

        return penalties;
    }

    public static void main(String[] args) {
        PenaltyDAO dao = new PenaltyDAO();

        // Uncomment the appropriate method call based on your needs
        // List<Penalty> list = dao.getPenalties();
        List<Penalty> list = dao.getPenalty("tester", "1");

        for (Penalty penalty : list) {
            System.out.println("User ID: " + penalty.getUser().getUserID());
            System.out.println("User Name: " + penalty.getUser().getUserName());
            System.out.println("User Gender: " + penalty.getUser().getUserGender());
            System.out.println("User Birth: " + penalty.getUser().getUserBirth());
            System.out.println("User Address: " + penalty.getUser().getUserAddress());
            System.out.println("User Phone: " + penalty.getUser().getUserPhone());
            System.out.println("User Avatar: " + penalty.getUser().getUserAvatar());

            // Print information from Account
            System.out.println("User Mail: " + penalty.getAccount().getUserMail());
            System.out.println("User Password: " + penalty.getAccount().getUserPassword());

            // Print information from Penalty
            System.out.println("Penalty ID: " + penalty.getPenID());
            System.out.println("Penalty Title: " + penalty.getDescription());
            System.out.println("Penalty Description: " + penalty.getDescription());


            System.out.println("--------");
        }
    }
}
