package Model;

public class Product_image {
	private int id;
	private int product_id;
	private String url;
	
	public Product_image() {
		super();
	}

	public Product_image(int id, int product_id, String url) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.url = url;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
