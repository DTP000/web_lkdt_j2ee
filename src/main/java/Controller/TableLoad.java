package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDao;
import Dao.OrderDAO;
import Dao.ProductDao;
import Model.Category;
import Model.Order;
import Model.Product;

/**
 * Servlet implementation class TableLoad
 */
@WebServlet(urlPatterns={"/Admin/unprocessedOrder","/Admin/orderFinished", "/Admin/orderProcessed", "/Admin/manageProducts", "/Admin/addProduct"})
public class TableLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableLoad() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		OrderDAO oDao = new OrderDAO();
		
		switch (url) {
			case "/Admin/unprocessedOrder" :
				System.out.println("hello");
				List<Order> list = oDao.getListOrder(oDao.getUnProcess());
				request.setAttribute("rs", list);
				request.getRequestDispatcher("/Admin/unprocessedOrder.jsp").forward(request, response);
				break;
			case "/Admin/orderProcessed" :
				System.out.println("hello2");
				List<Order> list1 = oDao.getListOrder(oDao.getProcess());
				request.setAttribute("rs", list1);
				request.getRequestDispatcher("/Admin/orderProcessed.jsp").forward(request, response);
				break;
			case "/Admin/orderFinished" :
				System.out.println("hello3");
				List<Order> list2 = oDao.getListOrder(oDao.getOrderCancelAdmin());
				request.setAttribute("rs", list2);
				request.getRequestDispatcher("/Admin/orderFinished.jsp").forward(request, response);
				break;
			case "/Admin/manageProducts" :
				ProductDao pDao = new ProductDao();
				List<Product> list3 = pDao.getListProduct(pDao.getAllProduct());
				request.setAttribute("rs", list3);
				request.getRequestDispatcher("/Admin/manageProducts.jsp").forward(request, response);
				break;
			case "/Admin/addProduct" :
				CategoryDao ctgDao = new CategoryDao();
				List<Category> obj = ctgDao.getListCategory(ctgDao.getAllCategory());
				request.setAttribute("rs", obj);
				request.getRequestDispatcher("/Admin/addProduct.jsp").forward(request, response);
		}
		
		System.out.println(request.getServletPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
