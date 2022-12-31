package Model;
import static utils.func.showPrice;
public class prdCard {
	public int prd_id;
	public String image;
	public String name;
	public String url;
	public Double price;
	public String priceVN;
	public int quantity;
	public Double total;
	public String totalVN;
	
	public prdCard(int prd_id, String image, String name, String url, Double price, int quantity, Double total) {
		super();
		this.prd_id = prd_id;
		this.image = image;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.total = total;
		this.url = url;
		this.priceVN = showPrice(this.price);
		this.totalVN = showPrice(this.total);
	}

	public int getPrd_id() {
		return prd_id;
	}

	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPriceVN() {
		return priceVN;
	}

	public void setPriceVN(String priceVN) {
		this.priceVN = priceVN;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getTotalVN() {
		return totalVN;
	}

	public void setTotalVN(String totalVN) {
		this.totalVN = totalVN;
	}
	
}
