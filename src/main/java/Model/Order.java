package Model;

public class Order {
	private int id;
	private int uid;
	private String shipUnit;
	private String shipCode;
	private String fullName;
	private String phone;
	private String address;
	private String createdAt;
	private String finished;
	private int staff;
	private float discount;
	private float shipPrice;
	private float totalPrice;
	private int status;
	private String note;
	
	public Order() {
		super();
	}
	
	public Order(int id, int uid, String shipUnit, String shipCode, String fullName, String phone, String address,
			String createdAt, int staff, float shipPrice, float totalPrice, int status, String note) {
		super();
		this.id = id;
		this.uid = uid;
		this.shipUnit = shipUnit;
		this.shipCode = shipCode;
		this.fullName = fullName;
		this.phone = phone;
		this.address = address;
		this.createdAt = createdAt;
		this.staff = staff;
		this.shipPrice = shipPrice;
		this.totalPrice = totalPrice;
		this.status = status;
		this.note = note;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getShipUnit() {
		return shipUnit;
	}

	public void setShipUnit(String shipUnit) {
		this.shipUnit = shipUnit;
	}

	public String getShipCode() {
		return shipCode;
	}

	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getFinished() {
		return finished;
	}

	public void setFinished(String finished) {
		this.finished = finished;
	}

	public int getStaff() {
		return staff;
	}

	public void setStaff(int staff) {
		this.staff = staff;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getShipPrice() {
		return shipPrice;
	}

	public void setShipPrice(float shipPrice) {
		this.shipPrice = shipPrice;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	
}
