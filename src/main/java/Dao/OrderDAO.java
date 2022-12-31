package Dao;
import connect.Conn;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Order;

public class OrderDAO {
	public static final String TABLE_NAME = "orders";
	Conn conn;

	public OrderDAO() {
		conn = new Conn();
	}
	
	public ResultSet getAll() {
		return conn.getData("SELECT * FROM " + TABLE_NAME);
	}
	
	public ResultSet getUnProcess() {
		return conn.getData("SELECT * FROM " + TABLE_NAME + " WHERE status = 1");
	}
	
	public ResultSet getProcess() {
		return conn.getData("SELECT * FROM " + TABLE_NAME + " WHERE status = 2");
	}
	
	public ResultSet getOrderCancelAdmin() {
		return conn.getData("SELECT * FROM " + TABLE_NAME + " WHERE status = 0");
	}
	
	public ResultSet getOrderCancelUser() {
		return conn.getData("SELECT * FROM " + TABLE_NAME + " WHERE status = 3");
	}
	
	public ResultSet findOrder(int id) {
		return conn.getData("SELECT * FROM "+ TABLE_NAME +" WHERE id= ? limit 1", String.valueOf(id));
	}
	
	public boolean createOrder(Order obj) {
		return conn.updateData(
				"INSERT INTO " + TABLE_NAME + " (`id`, `uid`, `ship_unit`, `ship_code`, `full_name`,"
						+ " `phone`, `address`, `created_at`, `finished`, `staff`, `discount`, `ship_price`,"
						+ " `total_price`, `status`, `note`) "
						+ "VALUES (NULL, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?, 1, ?)",
						String.valueOf(obj.getUid()), obj.getShipUnit(), obj.getShipCode() ,obj.getFullName(),
						obj.getPhone(),obj.getAddress(),obj.getFinished(), String.valueOf(obj.getStaff()),
						String.valueOf(obj.getDiscount()), String.valueOf(obj.getShipPrice()),
						String.valueOf(obj.getTotalPrice()), obj.getNote());
	}
	
	public boolean updateOrderOk(String id) {
		return conn.updateData("Update " + TABLE_NAME +  " SET status = 2 where id = ?", id);
	}
	
	public boolean updateOrderCancel(String response, String id) {
		return conn.updateData("Update " + TABLE_NAME +  " SET status = 0 , response = ? where id = ?", response, id);
	}

	public List<Order> getListOrder(ResultSet rs) {
		List<Order> userAll = new ArrayList<>();
		try {
			while (rs.next()) {
				Order user = new Order(
						rs.getInt("id"),
						rs.getInt("uid"),
						rs.getString("ship_unit"),
						rs.getString("ship_code"),
						rs.getString("full_name"),
						rs.getString("phone"),
						rs.getString("address"),
						rs.getString("created_at"),
						rs.getInt("staff"),
						rs.getFloat("ship_price"),
						rs.getFloat("total_price"),
						rs.getInt("status"),
						rs.getString("note")
				);
				userAll.add(user);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return userAll;
	}
	
	public Order getId(ResultSet rs) {
		try {
			while (rs.next()) {
				Order user = new Order(
						rs.getInt("id"),
						rs.getInt("uid"),
						rs.getString("ship_unit"),
						rs.getString("ship_code"),
						rs.getString("full_name"),
						rs.getString("phone"),
						rs.getString("address"),
						rs.getString("created_at"),
						rs.getInt("staff"),
						rs.getFloat("ship_price"),
						rs.getFloat("total_price"),
						rs.getInt("status"),
						rs.getString("note")
				);
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
}
