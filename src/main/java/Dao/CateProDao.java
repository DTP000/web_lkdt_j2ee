package Dao;

import connect.Conn;

public class CateProDao {
	public final String TABLE_NAME ="category_product";
	Conn conn;
	
	public CateProDao() {
		conn = new Conn();
	}
	
	public boolean createCatePro(String id_product, String id_category) {
		System.out.println("prd => " + id_product);
		System.out.println("cate => " + id_category);
		return conn.updateData("Insert into " + TABLE_NAME + " (`category_id`, `product_id`) VALUES (?, ?)", id_category, id_product);
	}
}
