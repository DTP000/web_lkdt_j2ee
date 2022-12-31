package Dao;
import connect.Conn;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.Conn;
import Model.Category;


public class CategoryDao {
	public static final String TABLE_NAME = "category";
	Conn conn;

	public CategoryDao() {
		conn = new Conn();
	}
	
	public ResultSet getAllCategory() {
		return conn.getData("SELECT * FROM " + TABLE_NAME);
	}

	
	public Category getCategory(ResultSet rs) {
		try {
			while (rs.next()) {
				Category obj = new Category(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4)
				);
				return obj;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	
	public List<Category> getListCategory(ResultSet rs) {
		List<Category> userAll = new ArrayList<>();
		try {
			while (rs.next()) {
				Category obj = new Category(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4)
				);
				userAll.add(obj);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return userAll;
	}
}
