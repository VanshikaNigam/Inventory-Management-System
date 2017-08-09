package bean;

public class StockForm
{
	private int Articleno;
	private int Quantity;
	private String type;
	
	public StockForm(int articleno, int quantity, String type) 
	{
		super();
		Articleno = articleno;
		Quantity = quantity;
		this.type = type;
	}

	public int getArticleno() {
		return Articleno;
	}

	public void setArticleno(int articleno) {
		Articleno = articleno;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

}

