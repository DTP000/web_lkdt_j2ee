package Model;

public class OrderDetailIn {
	private int id;
	private int orderIdIn;
	private int productId;
	private int quantity;
	private float price;
	private String note;
	public OrderDetailIn() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderIdIn() {
		return orderIdIn;
	}
	public void setOrderIdIn(int orderIdIn) {
		this.orderIdIn = orderIdIn;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
}
