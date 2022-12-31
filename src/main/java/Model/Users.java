package Model;

public class Users {
	private int uid;
	private String username;
	private String birthday;
	private String created_at;
	private String email;
	private String phone;
	private String avatar;
	private String role;
	
	
	
	public Users(String username, String birthday, String created_at, String email, String phone, String avatar,
			String role) {
		super();
		this.username = username;
		this.birthday = birthday;
		this.created_at = created_at;
		this.email = email;
		this.phone = phone;
		this.avatar = avatar;
		this.role = role;
	}
	public Users(int uid, String username, String birthday, String created_at, String email, String phone,
			String avatar, String role) {
		super();
		this.uid = uid;
		this.username = username;
		this.birthday = birthday;
		this.created_at = created_at;
		this.email = email;
		this.phone = phone;
		this.avatar = avatar;
		this.role = role;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	
	
}
