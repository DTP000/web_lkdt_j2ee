package connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DTP000
 */
public class db {
	
//	public static final String DB_NAME = "java_web";
//    public static final String DB_URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
//    public static final String USER_NAME = "root";
//    public static final String PASSWORD = "";
    
    // https://viettuts.vn/java-jdbc/ket-noi-java-voi-mysql
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(utils.config.DB_URL, utils.config.USER_NAME, utils.config.PASSWORD);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }
}
