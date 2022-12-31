package Dao;
import Model.Card;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
public class CardDao {
	public static void addItem(HttpSession session, int productID, int quantity) {
		ArrayList<Card> cardList = getListCard(session);
		ArrayList<Card> cardListNew = new ArrayList<Card>();
		boolean checkIsset = false;
		boolean isAdd = false;
		if (cardList != null) {
			for (Card card : cardList) {
				if (card.product_id == productID) {
					card.quantity += quantity;
					checkIsset = true;
					isAdd = true;
				}
				cardListNew.add(card);
			}		
		}
		if (!checkIsset) {
			cardListNew.add(new Card(productID, quantity));
			isAdd = true;
		}
		session.setAttribute("cardList", cardListNew);
		if (isAdd) {
			System.out.println("them sp vao session ok =>" + session.getAttribute("cardList"));
		} else {
			System.out.println("them sp vao session that bai");			
		}
	}
	public static void setQuantityItem(HttpSession session, int productID, int quantity) {
		ArrayList<Card> cardList = getListCard(session);
		ArrayList<Card> cardListNew = new ArrayList<Card>();
		boolean checkIsset = false;
		for (Card card : cardList) {
			if (card.product_id == productID) {
				card.quantity = quantity;
				checkIsset = true;
			}
			cardListNew.add(card);
		}
		if (!checkIsset) {
			cardListNew.add(new Card(productID, quantity));
		}
		session.setAttribute("cardList", cardListNew);
	}
	public static void removeItem(HttpSession session, int productID) {
		ArrayList<Card> cardList = getListCard(session);
		ArrayList<Card> cardListNew = new ArrayList<Card>();
		for (Card card : cardList) {
			if (card.product_id == productID) {

			} else {				
				cardListNew.add(card);
			}
		}
		session.setAttribute("cardList", cardListNew);
	}
	public static ArrayList<Card> getListCard(HttpSession session) {
		ArrayList<Card> cardList = (ArrayList<Card>) session.getAttribute("cardList"); 
		return cardList;
	}
}
