package daoOption;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.Conn;
import Model.Order;
import Model.OrderDetail;

public class Option {
	Conn conn;

	public Option() {
		conn = new Conn();
	}
	
	public ResultSet getOrderDetail(String id) {
		return conn.getData("SELECT order_details.id, order_details.order_id,name,order_details.product_id,order_details.quantity, order_details.price, order_details.note FROM `order_details` inner join `products` on order_details.product_id = products.id where order_id = ?;", id);
	}
	
	public List<OrderDetail> getListOrderDetail(ResultSet rs) {
		List<OrderDetail> list = new ArrayList<>();
		try {
			while (rs.next()) {
				OrderDetail obj = new OrderDetail(
						rs.getInt("id"),
						rs.getInt("order_id"),
						rs.getString("name"),
						rs.getInt("product_id"),
						rs.getInt("quantity"),
						rs.getFloat("price"),
						rs.getString("note")
				);
				list.add(obj);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
}
