package Dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.Conn;

import Model.Product;

public class ProductDao {
	private final String TABLE_NAME = "products";
	Conn conn;

	public ProductDao() {
		conn = new Conn();
	}
	
	public ResultSet getAllProduct() {
		return conn.getData("SELECT * FROM "+ TABLE_NAME +" WHERE status = 1;");
	}
	
	
	public ResultSet findProduct(String id ) {
		return conn.getData("SELECT * FROM " + TABLE_NAME + " WHERE id = ?", id);
	}
	
	public ResultSet createProduct(Product obj) {
		return conn.getLastID("INSERT INTO "+ TABLE_NAME +" (`id`, `name`, `price`, `quantity`, `discount`, `shortDesc`, `descr`, `image`, `url`, `status`) VALUES (NULL, ?, ?, ?, '0', NULL, NULL, ?, ?, '1')", obj.getName(), String.valueOf(obj.getPrice()), String.valueOf(obj.getQuantity()), obj.getImage(),obj.getUrl());
	}
	
	public boolean deleteProduct(String id) {
		return conn.updateData("UPDATE " + TABLE_NAME + " SET status = 0 WHERE id = ?", id);
	}
	
	public int getLastId(ResultSet rs) {
		try {
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		
		}
		return 0;
	}
	
	
	public Product getProduct(ResultSet rs ) {
		try {
			while (rs.next()) {
				Product obj = new Product(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getFloat("price"),
					rs.getInt("quantity"),
					rs.getString("discount"),
					rs.getString("shortDesc"),
					rs.getString("descr"),
					rs.getString("image"),
					rs.getString("url"),
					rs.getString("status")
				);
				return obj;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return null;
	}
	
	public List<Product> getListProduct(ResultSet rs ) {
		List<Product> list = new ArrayList<>();
		try {
			while (rs.next()) {
				Product obj = new Product(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getFloat("price"),
					rs.getInt("quantity"),
					rs.getString("discount"),
					rs.getString("shortDesc"),
					rs.getString("descr"),
					rs.getString("image"),
					rs.getString("url"),
					rs.getString("status")
				);
				list.add(obj);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
