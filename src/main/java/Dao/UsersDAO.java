package Dao;

import java.sql.*;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import static utils.func.md5;
import Model.Users;
import javax.servlet.http.HttpSession;

public class UsersDAO {
	/**
	 * Check login
	 * 
	 * @param username: username or email
	 * @param password: password no md5
	 * @return user
	 */
	public static Users checkLogin(String username, String password) {
		Connection conn = connect.db.getConnection();
		try {
			String sql = "select * from users where (username=? or email=?) and password=? and status = 1 limit 1";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, username);
			prst.setString(2, username);
			prst.setString(3, utils.func.md5(password));
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
//	            	int uid, String username, String birthday, String created_at, String email, 
//	            	String phone, String avatar, int permission	            	
				Users userCurrent = new Users(rs.getInt("uid"), rs.getString("username"), rs.getString("birthday"),
						rs.getString("created_at"), rs.getString("email"), rs.getString("phone"),
						rs.getString("avatar"), rs.getString("role"));

				conn.close();
				return userCurrent;
			}
		} catch (Exception ex) {
			if (utils.config.DEBUG) {
				ex.printStackTrace();
			}
		}
		return null;
	}
	
	public static Users getUserFromCookie(Cookie[] cookies, HttpSession session) {
		String cookie_login = null;
		Users userCurrent = null;
		if (session.getAttribute("userCurrent") != null) {
			return (Users) session.getAttribute("userCurrent");
		}
		if (cookies != null) {
			for (Cookie cookie : cookies) {
                if (cookie.getName().equals("uautha")) {
                	cookie_login = cookie.getValue();
                }
            }
		}
		if (cookie_login != null && !(cookie_login.equals(""))) {
			String content = utils.func.base64_decode(cookie_login);
			String[] arrInfo = content.split(Pattern.quote(":")); 
			String sql_check = "SELECT * FROM users WHERE (username=? or email=?) AND status = 1";
			String password_db = "7389w758975837678927982749870928790437098279847";
			String password_hash = "rtghnertdtrfghljhbvyhgfcgfctgcffgxg";
			if (arrInfo[1] != null) {
				password_hash = arrInfo[1];
				System.out.println("ckeck");
				try {
					Connection conn = connect.db.getConnection();
					PreparedStatement prst = conn.prepareStatement(sql_check);
					prst.setString(1, arrInfo[0]);
					prst.setString(2, arrInfo[0]);
					ResultSet rs = prst.executeQuery();
					System.out.println("ẻdfgs");
					if (rs.next()) {
						password_db = rs.getString("password");
						
//						String pass2 = utils.func.md5(password);
//						String salt = pass2.substring(5, 9);
//						String cookie_pass = utils.func.base64_encode(email + ":" + utils.func.md5(password, salt));
						
						System.out.println("vo dc nagng day ni" + password_db);
						
//						md5($password_db, substr(md5($password_db), 5, 9)) == $passHash
//						(utils.func.md5(password_db, utils.func.md5(password_db).substring(5, 9))).equals(password_hash);
						boolean check_pass = md5(password_db, password_db.substring(5, 9)).equals(password_hash);
						System.out.println(md5(password_db, password_db.substring(5, 9)) + " => " + password_hash);
						if (check_pass) {
							userCurrent = new Users(rs.getInt("uid"), rs.getString("username"), rs.getString("birthday"),
									rs.getString("created_at"), rs.getString("email"), rs.getString("phone"),
									rs.getString("avatar"), rs.getString("role"));
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return userCurrent;
	}

	
	public static Users findUser(int id) {
		Connection conn = connect.db.getConnection();
		try {
			String sql = "select * from users where id=? and status = 1 limit 1";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
//	            	int uid, String username, String birthday, String created_at, String email, 
//	            	String phone, String avatar, int permission	            	
				Users userCurrent = new Users(rs.getInt("uid"), rs.getString("username"), rs.getString("birthday"),
						rs.getString("created_at"), rs.getString("email"), rs.getString("phone"),
						rs.getString("avatar"), rs.getString("role"));

				conn.close();
				return userCurrent;
			}
		} catch (Exception ex) {
			if (utils.config.DEBUG) {
				ex.printStackTrace();
			}
		}
		return null;
	}
	
}
