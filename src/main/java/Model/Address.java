package Model;

public class Address {
	private int id;
	private int uid;
	private String fullName;
	private String phone;
	private String address;
	private String defaultA;
	private String status;

	public Address() {
		
	}
	

	public Address(int id, int uid, String fullName, String phone, String address, String defaultA, String status) {
		super();
		this.id = id;
		this.uid = uid;
		this.fullName = fullName;
		this.phone = phone;
		this.address = address;
		this.defaultA = defaultA;
		this.status = status;
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

	public String getDefaultA() {
		return defaultA;
	}

	public void setDefaultA(String defaultA) {
		this.defaultA = defaultA;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
