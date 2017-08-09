package bean;

import java.util.*;

public class SalesForm {
	private int artno;
	private String type;
	private double rate;
	private Date date;
	private int qty;
	private double dis;
	private double total;
	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public SalesForm(int artno, String type, double rate,
			Date date, int qty, double dis,double total) {
		super();
		this.artno = artno;
		this.type = type;
		this.rate = rate;
		this.date = date;
		this.qty = qty;
		this.dis = dis;
		this.total=total;
	}

	public SalesForm() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getArtno() {
		return artno;
	}

	public void setArtno(int artno) {
		this.artno = artno;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getDis() {
		return dis;
	}

	public void setDis(double dis) {
		this.dis = dis;
	}

}
