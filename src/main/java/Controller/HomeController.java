package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.ProductsDAO;
/**
 * Servlet implementation class HomeController
 */
@WebServlet(name="homeController",urlPatterns={"/home"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		// send variable
		String external_js = "<script src=\"../js/scr_js.js\"></script>";
		
		
		request.setAttribute("external_js", external_js);
		request.setAttribute("title", "Trang chủ | DTP000");
		request.setAttribute("prdName", "Sản phẩm mới");
		
		int slht_hotprd = 12;
		request.setAttribute("prdCarousel", ProductsDAO.getProductsByCategoryName("Sản phẩm nổi bật", 0, 8, true));
		request.setAttribute("prd_machTienCS", ProductsDAO.getProductsByCategoryName("Mạch PRE Tiền Công Suất", 0, slht_hotprd, true));
		request.setAttribute("prd_machCSLon", ProductsDAO.getProductsByCategoryName("Mạch CS Lớn Hàng Công Ty", 0, slht_hotprd, true));
		request.setAttribute("prd_machCSgiare", ProductsDAO.getProductsByCategoryName("Mạch CS Âm Thanh Giá Rẻ", 0, slht_hotprd, true));
		RequestDispatcher rd = request.getRequestDispatcher("index2.jsp");
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
