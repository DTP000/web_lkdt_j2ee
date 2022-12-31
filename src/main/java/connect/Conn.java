package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conn {

	Connection conn;
	Statement stsm;
	PreparedStatement prsm;

	public Conn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(utils.config.DB_URL, utils.config.USER_NAME, utils.config.PASSWORD);
		} catch (Exception ex) {
			if (utils.config.DEBUG) {
				ex.printStackTrace();
			}
		}
	}

	public ResultSet getData(String sql) {
		stsm = null;
		try {
			stsm = conn.createStatement();
			return stsm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ResultSet getData(String sql, String str1) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, str1);
			return prsm.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ResultSet getData(String sql, String str1, String str2) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, str1);
			prsm.setString(2, str2);
			return prsm.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ResultSet getLastID(String sql, String str1, String str2, String str3, String str4, String str5) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			prsm.setString(1, str1);
			prsm.setString(2, str2);
			prsm.setString(3, str3);
			prsm.setString(4, str4);
			prsm.setString(5, str5);
			prsm.executeUpdate();
			return prsm.getGeneratedKeys();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateData(String sql, String str1) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, str1);
			return prsm.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateData(String sql, String str1, String str2) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, str1);
			prsm.setString(2, str2);
			return prsm.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateData(String sql, String str1, String str2, String str3, String str4) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, str1);
			prsm.setString(2, str2);
			prsm.setString(3, str3);
			prsm.setString(4, str4);
			return prsm.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateData(String sql, String str1, String str2, String str3, String str4, String str5) {
		prsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, str1);
			prsm.setString(2, str2);
			prsm.setString(3, str3);
			prsm.setString(4, str4);
			prsm.setString(5, str5);
			return prsm.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateData(String sql, String string, String string2, String string3, String string4, String string5,
			String string6, String string7, String string8, String string9, String string10, String string11,
			String string12) {
		stsm = null;
		try {
			prsm = conn.prepareStatement(sql);
			prsm.setString(1, string);
			prsm.setString(2, string2);
			prsm.setString(3, string3);
			prsm.setString(4, string4);
			prsm.setString(5, string5);
			prsm.setString(6, string6);
			prsm.setString(7, string7);
			prsm.setString(8, string8);
			prsm.setString(9, string9);
			prsm.setString(10, string10);
			prsm.setString(11, string11);
			prsm.setString(12, string12);
			return stsm.executeUpdate(sql) > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
