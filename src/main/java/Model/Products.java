package Model;
import static utils.func.showPrice;
public class Products {
	private int id;
	private String name;
	private double price;
	private int quantity;
	private String discount;
	private String desc;
	private String image;
	private String url;
	
	
	public Products() {
		super();
	}
	public Products(int id, String name, double price, int quantity, String discount, String desc, String image,
			String url) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.discount = discount;
		this.desc = desc;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getShortDesc() {
		if (desc.length() == 0) {
			return "";
		}
		int length = desc.length();
		if (length > 100) {
			length = 100;
		} else {
			length--;
		}
		return desc.substring(0, length);
	}
	public String getPriceVND() {
		return showPrice(price);
	}
	
}
