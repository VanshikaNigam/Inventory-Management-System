package bean;

public class ChangeForm {
	private String username;
	private String cpassword;
	private String npassword;
	private String cnpassword;
	
	public ChangeForm() {
		super();
	}

	public ChangeForm(String username, String cpassword, String npassword,
			String cnpassword) {
		super();
		this.username = username;
		this.cpassword = cpassword;
		this.npassword = npassword;
		this.cnpassword = cnpassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	public String getNpassword() {
		return npassword;
	}

	public void setNpassword(String npassword) {
		this.npassword = npassword;
	}

	public String getCnpassword() {
		return cnpassword;
	}

	public void setCnpassword(String cnpassword) {
		this.cnpassword = cnpassword;
	}
	
	
	
}
