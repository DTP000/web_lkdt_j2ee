package Model;

public class Product {
	private int id;
	private String name;
	private float price;
	private int quantity;
	private String discount;
	private String shortDesc;
	private String descr;
	private String image;
	private String url;
	private String status;
	
	public Product() {
		super();
	}
	
	public Product(int id, String name, float price, int quantity, String discount, String shortDesc, String descr,
			String image, String url, String status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.discount = discount;
		this.shortDesc = shortDesc;
		this.descr = descr;
		this.image = image;
		this.url = url;
		this.status = status;
	}
	
	

	public Product(String name, float price, int quantity, String image, String url) {
		super();
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
		this.url = url;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
