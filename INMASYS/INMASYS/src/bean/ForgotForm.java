package bean;

public class ForgotForm {
	private String userid;
	private String ques;
	private String ans;
	private String password;
	public ForgotForm(String userid, String ques, String ans,String password) {
		super();
		this.userid = userid;
		this.ques = ques;
		this.ans = ans;
		this.password=password;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public ForgotForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
