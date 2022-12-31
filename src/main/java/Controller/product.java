package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Products;
import Model.Product_image;
import Dao.ProductsDAO;
import Dao.PrdImgDAO;
import java.util.ArrayList;
/**
 * Servlet implementation class product
 */
@WebServlet("/product")
public class product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String q = request.getParameter("q");
//		response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Đặt trạng thái 404
		Products p = ProductsDAO.getProductById(id);
		ArrayList<Products> prd_new = ProductsDAO.getProductsByCategory(1, 0, 3);
		ArrayList<Products> prd_new2 = ProductsDAO.getProductsByCategory(1, 0, 8);
		ArrayList<Product_image> pi = PrdImgDAO.getProducts(id);
		if (p != null && pi != null) {
			request.setAttribute("prd", p);
			request.setAttribute("category", "Sản phẩm mới");
			request.setAttribute("prdImgs", pi);
			request.setAttribute("prdNew", prd_new);
			request.setAttribute("prdCarousel", prd_new2);
			RequestDispatcher rd = request.getRequestDispatcher("pageFile/product.jsp");
			rd.forward(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			RequestDispatcher rd = request.getRequestDispatcher("pageFile/404.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
