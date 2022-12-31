package Controller;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import Dao.OrderDAO;
import Dao.ProductDao;
import Dao.CateProDao;
import daoOption.Option;
import Model.OrderDetail;
import Model.Product;

/**
 * Servlet implementation class Ajax
 */
@WebServlet("/Ajax")
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("ajax");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
		System.out.println(temp);
		switch (temp) {
			case "1": {
				System.out.println("vô được switch");
				String idStr = request.getParameter("id");
				Option op = new Option();
				List<OrderDetail> list = op.getListOrderDetail(op.getOrderDetail(idStr));
				Gson gson = new Gson();
                JsonElement element = gson.toJsonTree(list, new TypeToken<List<OrderDetail>>(){}.getType());
                JsonArray jsonArray = element.getAsJsonArray();
                response.setContentType("application/json");
                response.getWriter().println(jsonArray);
				break;
			}
			case "2": {
				String idStr = request.getParameter("id");
				String response1 = request.getParameter("response");
				boolean check;
				if (new OrderDAO().updateOrderCancel(response1,idStr)) {
					check = true;
					response.getWriter().println(check);
				} else {
					check = false;
					response.getWriter().println(check);
				}
			}
			case "3": {
				String idStr = request.getParameter("id");
				ProductDao pDao = new ProductDao();
				List<Product> list = pDao.getListProduct(pDao.findProduct(idStr));
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(list, new TypeToken<List<Product>>(){}.getType());
				JsonArray jsonArray = element.getAsJsonArray();
				response.setContentType("application/json");
				response.getWriter().println(jsonArray);
				break;
			}
			case "4": {
				String id_category = request.getParameter("id_category");
				String name_product = request.getParameter("name_product");
				float price_product = Float.parseFloat(request.getParameter("price_product"));
				int quantity_product = Integer.parseInt(request.getParameter("quantity_product"));
				String img_product = "https://bizweb.dktcdn.net/100/184/656/products/img-20220621-155915.jpg?v=1655803599697";
				String url_product = request.getParameter("url_product");
				Product pro = new Product(name_product, price_product,quantity_product,img_product,url_product);
				ProductDao pDao = new ProductDao();
				int lastId = pDao.getLastId(pDao.createProduct(pro));
				System.out.println(lastId);
				boolean check;
				if (lastId != 0) {	
					if (new CateProDao().createCatePro(String.valueOf(lastId),id_category)) {
						check = true;
						response.getWriter().println(check);
					} else {
						check = false;
						response.getWriter().println(check);
					}
				} else {
					check = false;
					response.getWriter().println(check);
				}
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
