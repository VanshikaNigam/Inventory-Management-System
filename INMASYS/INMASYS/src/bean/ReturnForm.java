package bean;
import java.util.*;

public class ReturnForm {
	private int flag;
	private int articleno;
	private String Name;
	private double salerate;
	private int quantity;
	private String saleperson;
	private Date Date;
	public ReturnForm() {
		// TODO Auto-generated constructor stub
	}
	public ReturnForm(int articleno, String name, double salerate,
			int quantity, String saleperson, java.util.Date date) {
		super();
		this.articleno = articleno;
		Name = name;
		this.salerate = salerate;
		this.quantity = quantity;
		this.saleperson = saleperson;
		Date = date;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getArticleno() {
		return articleno;
	}
	public void setArticleno(int articleno) {
		this.articleno = articleno;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public double getSalerate() {
		return salerate;
	}
	public void setSalerate(double salerate) {
		this.salerate = salerate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSaleperson() {
		return saleperson;
	}
	public void setSaleperson(String saleperson) {
		this.saleperson = saleperson;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = date;
	}
}	