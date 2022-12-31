package Dao;

import java.sql.*;
import java.util.ArrayList;
import Model.Products;

public class ProductsDAO {

	public static ArrayList<Products> getProducts(int a, int b) {
		Connection conn = connect.db.getConnection();
		ArrayList<Products> list = new ArrayList<Products>();
		try {
			String sql = "SELECT * FROM products WHERE status = 1 limit ?, ?";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setInt(1, a);
			prst.setInt(2, b);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				list.add(new Products(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getInt("quantity"), rs.getString("discount"), rs.getString("descr"), rs.getString("image"),
						rs.getString("url")));
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
	
	public static ArrayList<Products> searchProducts(String q, int a, int b, boolean orderby) {
		Connection conn = connect.db.getConnection();
		ArrayList<Products> list = new ArrayList<Products>();
		try {
			String sql = "SELECT * FROM products WHERE status = 1 limit ?, ?";
			if (orderby) {
				sql = "SELECT * FROM products WHERE status = 1 AND products.name like ? ORDER by products.id DESC limit ?, ?";
			} else {
				sql = "SELECT * FROM products WHERE status = 1 AND products.name like ? limit ?, ?";				
			}
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, "%" + q + "%");
			prst.setInt(2, a);
			prst.setInt(3, b);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				list.add(new Products(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getInt("quantity"), rs.getString("discount"), rs.getString("descr"), rs.getString("image"),
						rs.getString("url")));
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
	
	
	public static int countSearchProducts(String q) {
		Connection conn = connect.db.getConnection();
		ArrayList<Products> list = new ArrayList<Products>();
		try {
			String sql = "SELECT count(id) as ctn FROM products WHERE status = 1 AND products.name like ?";				
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, "%" + q + "%");
			int rsl = 0;
			ResultSet rs = prst.executeQuery();
			if (rs.next()) {
				rsl = rs.getInt("ctn");
			}
			conn.close();
			return rsl;
		} catch (Exception ex) {
			if (utils.config.DEBUG) {
				ex.printStackTrace();
			}
		}
		return 0;
	}
	
	public static ArrayList<Products> getProductsByCategory(int idCategory, int a, int b) {
		Connection conn = connect.db.getConnection();
		ArrayList<Products> list = new ArrayList<Products>();
		try {
			String sql = "SELECT * FROM products "
						+ "INNER JOIN category_product ON "
						+ "products.id = category_product.product_id  "
						+ "WHERE category_product.category_id = ? AND products.status = 1 limit ?, ?";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setInt(1, idCategory);
			prst.setInt(2, a);
			prst.setInt(3, b);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				list.add(new Products(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getInt("quantity"), rs.getString("discount"), rs.getString("descr"), rs.getString("image"),
						rs.getString("url")));
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
	
	public static ArrayList<Products> getProductsByCategoryName(String name, int a, int b) {
		Connection conn = connect.db.getConnection();
		ArrayList<Products> list = new ArrayList<Products>();
		try {
			String sql = "SELECT * FROM ((products "
						+ "INNER JOIN category_product ON "
						+ "products.id = category_product.product_id) ON  "
						+ "category.id = category_product.product_id))"
						+ "WHERE category.name = ? AND products.status = 1 limit ?, ?";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, name);
			prst.setInt(2, a);
			prst.setInt(3, b);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				list.add(new Products(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getInt("quantity"), rs.getString("discount"), rs.getString("descr"), rs.getString("image"),
						rs.getString("url")));
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
	
	public static ArrayList<Products> getProductsByCategoryName(String name, int a, int b, boolean orderby) {
		Connection conn = connect.db.getConnection();
		ArrayList<Products> list = new ArrayList<Products>();
		try {
			String sql;
			if (orderby) {
				sql = "SELECT * FROM ((products "
						+ "INNER JOIN category_product ON "
						+ "products.id = category_product.product_id) INNER JOIN category ON  "
						+ "category.id = category_product.category_id) "
						+ "WHERE category.name = ? AND products.status = 1 ORDER by products.id DESC limit ?, ?";
			} else {
				sql = "SELECT * FROM ((products "
						+ "INNER JOIN category_product ON "
						+ "products.id = category_product.product_id)  INNER JOIN category ON    "
						+ "category.id = category_product.category_id) "
						+ "WHERE category.name = ? AND products.status = 1 limit ?, ?";
			}
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, name);
			prst.setInt(2, a);
			prst.setInt(3, b);
			ResultSet rs = prst.executeQuery();
			while (rs.next()) {
				list.add(new Products(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getInt("quantity"), rs.getString("discount"), rs.getString("descr"), rs.getString("image"),
						rs.getString("url")));
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

	public static Products getProductById(String id) {
		Connection conn = connect.db.getConnection();
		try {
			String sql = "SELECT * FROM products WHERE status = 1 AND id=?";
			PreparedStatement prst = conn.prepareStatement(sql);
			prst.setString(1, id);
			ResultSet rs = prst.executeQuery();
			Products p = null;
			if (rs.next()) {
				p = (new Products(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
						rs.getInt("quantity"), rs.getString("discount"), rs.getString("descr"), rs.getString("image"),
						rs.getString("url")));
			}
			conn.close();
			return p;
		} catch (Exception ex) {
			if (utils.config.DEBUG) {
				ex.printStackTrace();
			}
		}
		return null;
	}
}
