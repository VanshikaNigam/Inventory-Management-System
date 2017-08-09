package bean;

public class LoginForm {
	private String username;
	private String password;
	private int id;
	private boolean check;
	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public LoginForm(String username, String password, int id) {
		super();
		this.username = username;
		this.password = password;
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public LoginForm() {
		super();
	}

	public LoginForm(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

}
