package Model;

public class OrderDetail {
	
	private int id;
	private int orderId;
	private String productName;
	private int productId;
	private int quantity;
	private float price;
	private String note;
	
	public OrderDetail() {
		super();
	}

	
	public OrderDetail(int id, int orderId, int productId, int quantity, float price, String note) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
		this.price = price;
		this.note = note;
	}
	
	public OrderDetail(int id, int orderId, String productName, int productId, int quantity, float price, String note) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productName = productName;
		this.productId = productId;
		this.quantity = quantity;
		this.price = price;
		this.note = note;
	}

	public int getId() {
		return id;
	}	
	
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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

	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
}
