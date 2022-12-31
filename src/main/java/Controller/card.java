package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import Model.*;
import Dao.*;

/**
 * Servlet implementation class card
 */
@WebServlet("/card")
public class card extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public card() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
//		int prd_id, String image, String name, Double price, int quantity, Double total
		ArrayList<Card> cardList = Dao.CardDao.getListCard(session);
		ArrayList<prdCard> prdCardList = new ArrayList<prdCard>();
		Double totalPrice = 0.0;
		if (cardList != null) {
			for (Card card : cardList) {
				Products prdTemp = Dao.ProductsDAO.getProductById(String.valueOf(card.product_id)); 
				if (prdTemp != null) {
					totalPrice += prdTemp.getPrice() * card.quantity;
					prdCardList.add(new prdCard(card.product_id, prdTemp.getImage(), prdTemp.getName(), prdTemp.getUrl(), prdTemp.getPrice(), card.quantity, (prdTemp.getPrice() * card.quantity)));
				}
			}		
		} else {
			System.out.println("kh co sp trong session");
		}
		request.setAttribute("prdNum", prdCardList.size());
		request.setAttribute("prdCardList", prdCardList);
		request.setAttribute("totalPrice", utils.func.showPrice(totalPrice));
		
		RequestDispatcher rd = request.getRequestDispatcher("pageFile/card.jsp");
		
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
