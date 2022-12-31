package Dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.Conn;

import Model.OrderDetail;

public class OrderDetailDao {
	public static final String TABLE_NAME = "order_details";
	Conn conn;

	public OrderDetailDao() {
		conn = new Conn();
	}
	
	public ResultSet getAll() {
		return conn.getData("SELECT * FROM " + TABLE_NAME);
	}
	
	public ResultSet findID(String id) {
		return conn.getData("SELECT * FROM " + TABLE_NAME + "WHERE id = ? LIMIT 1" , id);
	}
	
	public List<OrderDetail> getListOBJ(ResultSet rs) {
		List<OrderDetail> array = new ArrayList<>();
		try {
			while (rs.next()) {
				OrderDetail obj = new OrderDetail(rs.getInt("id"), rs.getInt("order_id"), rs.getInt("product_id"), rs.getInt("quantity"),rs.getFloat("price"),rs.getString("note"));
				array.add(obj);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return array;
	}
	
	public OrderDetail getOBJ(ResultSet rs) {
		try {
			while (rs.next()) {
				OrderDetail obj = new OrderDetail(rs.getInt("id"), rs.getInt("order_id"), rs.getInt("product_id"), rs.getInt("quantity"),rs.getFloat("price"),rs.getString("note"));
				return obj;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	public boolean createOBJ(OrderDetail obj) {
		return conn.updateData("INSERT INTO " + TABLE_NAME + "(`id`, `order_id`, `product_id`, `quantity`, `price`, `note`) VALUES (NULL, ?, ?, ?, ?, ?)", String.valueOf(obj.getOrderId()), String.valueOf(obj.getProductId()),String.valueOf(obj.getQuantity()),String.valueOf(obj.getPrice()),obj.getNote());
	}
	
	public boolean editOBJ(OrderDetail obj) {
		return conn.updateData("UPDATE" +TABLE_NAME+" SET `phone` = ? WHERE `address`.`id` = ?;", TABLE_NAME, TABLE_NAME, TABLE_NAME, TABLE_NAME);
	}
}
