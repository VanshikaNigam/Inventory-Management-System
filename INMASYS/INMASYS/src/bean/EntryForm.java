package bean;

import java.util.*;

public class EntryForm {
	private int artno;
	private double salerate;
	private int qty;
	private String saler;
	private Date date;
	private String type;
	private String trantype;
	private long billno;
	private double earning;
	private double discount;
	private double net;

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getNet() {
		return net;
	}

	public void setNet(double net) {
		this.net = net;
	}

	public long getBillno() {
		return billno;
	}

	public void setBillno(long billno) {
		this.billno = billno;
	}

	public String getTrantype() {
		return trantype;
	}

	public void setTrantype(String trantype) {
		this.trantype = trantype;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public EntryForm() {
		// TODO Auto-generated constructor stub
	}

	public EntryForm(int artno, double salerate, int qty, String saler,
			Date date,String trantype,String type) {
		super();
		this.artno = artno;
		this.salerate = salerate;
		this.qty = qty;
		this.saler = saler;
		this.date = date;
		this.trantype=trantype;
		this.type=type;
	}
	public EntryForm(int artno, double salerate, int qty, long bill,
			Date date,String trantype,double discount,double net,double earning) {
		super();
		this.artno = artno;
		this.salerate = salerate;
		this.qty = qty;
		this.saler = saler;
		this.date = date;
		this.trantype=trantype;
		this.billno=bill;
		this.discount=discount;
		this.net=net;
		this.earning=earning;
	}

	public double getEarning() {
		return earning;
	}

	public void setEarning(double earning) {
		this.earning = earning;
	}

	public EntryForm(int artno) {
		super();
		this.artno = artno;

	}

	public int getArtno() {
		return artno;
	}

	public double getSalerate() {
		return salerate;
	}

	public void setSalerate(double salerate) {
		this.salerate = salerate;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getSaler() {
		return saler;
	}

	public void setSaler(String saler) {
		this.saler = saler;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setArtno(int artno) {
		this.artno = artno;
	}
}