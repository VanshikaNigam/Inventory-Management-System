package bean;

public class BillForm {
private int grossqty;
private double grosstotal;

public BillForm() {
	super();
	// TODO Auto-generated constructor stub
}
public BillForm(int grossqty, double grosstotal) {
	super();
	this.grossqty = grossqty;
	this.grosstotal = grosstotal;
}
public int getGrossqty() {
	return grossqty;
}
public void setGrossqty(int grossqty) {
	this.grossqty = grossqty;
}
public double getGrosstotal() {
	return grosstotal;
}
public void setGrosstotal(double grosstotal) {
	this.grosstotal = grosstotal;
}

}
