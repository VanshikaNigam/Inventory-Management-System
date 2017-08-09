package bean;

public class Generate {
	private long billno;
	private String name;
	
	public Generate(long billno, String name) {
		super();
		this.billno = billno;
		this.name = name;
	}
	public long getBillno() {
		return billno;
	}
	public void setBillno(long billno) {
		this.billno = billno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
