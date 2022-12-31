package Dao;

import java.sql.ResultSet;

import connect.Conn;
import Model.Address;


public class AddressDao {
	public static final String TABLE_NAME = "address";
	Conn conn;

	public AddressDao() {
		conn = new Conn();
	}
	
	public ResultSet getAll() {
		return conn.getData("SELECT * FROM " + TABLE_NAME);
	}
	
	public ResultSet findAddress(String id) {
		return conn.getData("SELECT * FROM " + TABLE_NAME + "WHERE id = ? LIMIT 1" , id);
	}
	
	public boolean createAddress(Address ad) {
		return conn.updateData("INSERT INTO " + TABLE_NAME + "(`id`, `uid`, `full_name`, `phone`, `address`, `default`, `status`) VALUES (NULL, ?, ?, ?, ?, '0', '1');", String.valueOf(ad.getUid()), ad.getFullName(),ad.getPhone(),ad.getAddress());
	}

	public boolean editAddress(Address ad) {
		return conn.updateData("UPDATE" +TABLE_NAME+" SET `phone` = ? WHERE `address`.`id` = ?;", TABLE_NAME, TABLE_NAME, TABLE_NAME, TABLE_NAME);
	}
	
	public Address getAddress(ResultSet rs) {
		try {
			while (rs.next()) {
				Address user = new Address(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
				);
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
