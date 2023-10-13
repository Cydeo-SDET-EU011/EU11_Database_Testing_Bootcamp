import java.sql.*;

public class ConnectionTest {
    static String url = "jdbc:oracle:thin:@54.152.219.47:1521:XE";
    static String username = "hr";
    static String passoword = "hr";

    public static void main(String[] args) throws SQLException {

        Connection connection = DriverManager.getConnection(url, username, passoword);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");

        rs.next();  // cursor jump to line 1
        System.out.println(rs.getString("FIRST_NAME")); // steven
        System.out.println(rs.getInt("EMPLOYEE_ID")); // 100

        rs.next();  // cursor jump to line 2
        System.out.println(rs.getString("FIRST_NAME")); // neena
        System.out.println(rs.getInt("EMPLOYEE_ID")); // 101

        // go to line 8 directly
        rs.absolute(8);
        System.out.println(rs.getInt(1));  //107

        rs.last();
        System.out.println(rs.getInt("SALARY"));


    }
}
