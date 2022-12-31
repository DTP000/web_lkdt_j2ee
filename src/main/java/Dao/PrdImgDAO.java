package Dao;

import java.sql.*;
import java.util.ArrayList;
import Model.Product_image;
public class PrdImgDAO {

	public static ArrayList<Product_image> getProducts(String id) {
		Connection conn = connect.db.getConnection();
		ArrayList<Product_image> list = new ArrayList<Product_image>();
		try {
			String sql = "SELECT * FROM image_products WHERE product_id = ? AND status = 1";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, id);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				list.add(new Product_image(rs.getInt("id"), rs.getInt("product_id"), rs.getString("url")));
			}
			conn.close();
			return list;
		} catch (Exception ex) {
			if (utils.config.DEBUG) {
				ex.printStackTrace();
			}
		}
		return null;
	}

}
