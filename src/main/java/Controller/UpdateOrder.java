package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.OrderDAO;
import Model.Order;

/**
 * Servlet implementation class UpdateOrder
 */
@WebServlet(name="UpdateOrder",urlPatterns={"/Admin/UpdateOrder"})
public class UpdateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		OrderDAO odao = new OrderDAO();
		if (odao.updateOrderOk(id)) {
			System.out.println("được");
			response.sendRedirect("./unprocessedOrder");
		} else {
			System.out.println("ko được");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//		int id = Integer.parseInt(request.getParameter("id"));
//		
//		OrderDAO odao = new OrderDAO();
//		if (odao.updateOrder(String.valueOf(id), name, phone, address, uid)) {
////			request.getRequestDispatcher("/Admin/table/unprocessedOrder.jsp").forward(request, response);
//			response.sendRedirect("./unprocessedOrder.jsp");
//		} else {
//			Order list = odao.getId(odao.findOrder(id));
//			if (list != null) {
//				request.setAttribute("rs", list);
//				request.setAttribute("name", "fail");
//				request.getRequestDispatcher("/Admin/editOrder.jsp").forward(request, response);
//			}
//		}
	}

}
