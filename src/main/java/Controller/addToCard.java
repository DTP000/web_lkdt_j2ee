package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static utils.func.isNumeric;
/**
 * Servlet implementation class addToCard
 */
@WebServlet("/addToCard")
public class addToCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String product_id = request.getParameter("productID");
		String quantity = request.getParameter("quantity");
		HttpSession session = request.getSession(true);

		if (isNumeric(quantity) && isNumeric(product_id) && Dao.ProductsDAO.getProductById(product_id) != null) {
			Dao.CardDao.addItem(session, Integer.parseInt(product_id), Integer.parseInt(quantity));
		}
		response.sendRedirect("./card");
	}

}
