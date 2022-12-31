package Model;

public class Category {
	private int id;
	private String name;
	private String slug;
	private int status;
	
	
	public Category() {
		super();
	}

	public Category(int id, String name, String slug, int status) {
		super();
		this.id = id;
		this.name = name;
		this.slug = slug;
		this.status = status;
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


	public String getSlug() {
		return slug;
	}


	public void setSlug(String slug) {
		this.slug = slug;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}

	
	
}
