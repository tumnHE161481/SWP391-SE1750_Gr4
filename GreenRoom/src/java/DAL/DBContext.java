package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String user = "sa";
            String pass = "sa";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=GreenRoom";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ohhhh myy goddd error");
        }
    }

    public static void main(String[] args) {
//        try {
//            DBContext db = new DBContext();
//            if (db.connection != null && !db.connection.isClosed()) {
//                System.out.println("Connection established successfully!");
//                // You can perform further database operations here if needed.
//            } else {
//                System.out.println("Failed to establish connection!");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//



//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//
//        String dobString = "2002-08-24";
//
//        // Chuyển đổi chuỗi ngày tháng từ trình duyệt thành LocalDate
//        LocalDate dob = LocalDate.parse(dobString);
//
//        // Bây giờ bạn có thể sử dụng dob (kiểu LocalDate) trong ứng dụng của bạn
//        // Ví dụ: Định dạng lại thành chuỗi khác
//        String formattedDob = dob.format(formatter);
        AccountDAO a = new AccountDAO();
        
//        boolean v = a.registerAccount("vuduyhung@gmail.com", "11111111", 1);
//        System.out.println(v + " account");
        int b = a.getUserId("vuduyhung@gmail.com");
        boolean c = a.registerUser(b, "Male", "Hanoi", "0858122236", "2002-10-20", "abc");
        System.out.println(c + " user");
            
           
            
    }
}
