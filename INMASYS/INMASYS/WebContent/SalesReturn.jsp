<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.SalesServlet"%>
<%@ page import="controller.SaleReturnServlet"%>
<%@ page import="bean.SalesForm"%>
<%@ page import="bean.EntryForm"%>
<%@ page import="bean.SaleReturnForm"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Sale Return</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript">
	function validate() {
		var Rate = document.forms["SaleR"]["prate"].value;
		var Qty = document.forms["SaleR"]["qty"].value;
		var Type = document.forms["SaleR"]["type"].value;
		var Dis = document.forms["SaleR"]["dis"].value;
		if (Rate == "") {
			alert("Rate field is blank");
			return false;
		}
		if (isNaN(Rate)) {
			alert("Rate field should contain numbers");
			return false;

		}
		if (Qty == "") {
			alert("Quantity field is blank");
			return false;
		}
		if (isNaN(Qty)) {
			alert("Quantity field should contain numbers");
			return false;

		}
		if (Type == "") {
			alert("type field is blank");
			return false;
		}
		if (!isNaN(Type)) {
			alert("type should be string");
			return false;

		}

		if (Dis == "") {
			alert("Discount field is blank");
			return false;
		}
		if (isNaN(Disc)) {
			alert("Discount should contain numbers");
			return false;

		}
	}
	function valid() {

		var Art = document.forms["SaleR"]["artno"].value;
		var bill = document.forms["SaleR"]["billno"].value;
		if (Art == "") {
			alert("Article no. field is blank");
			return false;
		}
		if (isNaN(Art)) {
			alert("Article should contain numbers");
			return false;

		}
		if (bill == "") {
			alert("Bill no. field is blank");
			return false;
		}
		if (isNaN(bill)) {
			alert("Bill no should contain numbers");
			return false;

		}
	}
</script>
</head>

<body>
	<h3 align="right">
		<font color="white"> <%
 	Object username = session.getAttribute("username");
 %> <%
 	out.print("Welcome:");
 %><%=username%></font>
	</h3>
	<div class="wrap">

		<br>

		<nav>
			<ul class="menu">

				<li><a href="#"><span class="iconic home"></span> Stock</a>
					<ul>
						<li><a href="StockEntryFirst.jsp">Stock Entry</a></li>
						<li><a href="StockReturnFirst.jsp">Stock Return</a></li>
						<li><a href="List">Stock List</a></li>
					</ul></li>


				<li><a href="#"><span class="iconic plus-alt"></span>Sales</a>
					<ul>
						<li><a href="SaleFormFirst.jsp">Sales Form</a></li>
						<li><a href="SaleReturnFirst.jsp">Sales Return Form</a></li>
					</ul></li>
				<li><a href="#"><span class="iconic magnifying-glass"></span>Report</a>
					<ul>
						<li><a href="StrByArticleFirst.jsp">Stock Report By
								Article</a>
						<li><a href="StrByDateFirst.jsp">Stock Report By Date</a>
						<li><a href="SlByArticleFirst.jsp">Sale Report By Article</a>
						<li><a href="SlByDateFirst.jsp">Sale Report By Date</a>
					</ul></li>
				<li><a href="AddAdminFirst.jsp"><span
						class="iconic map-pin"></span>Add Admin</a></li>
				<li><a href="Change.jsp"><span class="iconic mail"></span>Change
						Password</a>
				<li><a href="Logout"><span class="iconic home"></span>
						Logout</a></li>
			</ul>
			<div class="clearfix"></div>
			<div></div>
			<div></div>
		</nav>
		<br> <br>
		<h4 align="center">
			<u>Sale Return form</u>
		</h4>
		<br> <br>

		<form action="return" method="post" name="SaleR">
			<table align="left" width="100%">
				<%
					ArrayList<SaleReturnForm> salelist = (ArrayList<SaleReturnForm>) request
							.getAttribute("list");
					SaleReturnForm saleForm = (SaleReturnForm) request
							.getAttribute("salesForm");
					int artno = (Integer) request.getAttribute("artno");
					long billno = (Long) request.getAttribute("billno");

					if (saleForm == null) {
				%>

				<tr>
					<td colspan="2"><font size="4">Return Details:</td>


				</tr>
				<tr>

					<td>Bill No:</td>
					<td><input type="text" name="billno"
						value="<%out.print(billno);%>" placeholder="123456"></td>
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td rowspan="7"><table width="100%" border="2">
							<%
								if (salelist != null) {
							%>
							<tr>
								<td>Art No:</td>
								<td>Type</td>
								<td>Unit Price</td>
								<td>Quantity</td>
								<td>Discount(%)</td>
								<td>Total</td>
							</tr>
							<%
								for (SaleReturnForm salesForm : salelist) {
							%><tr>

								<td><%=salesForm.getArtno()%></td>
								<td><%=salesForm.getType()%></td>
								<td><%=salesForm.getRate()%></td>
								<td><%=salesForm.getQty()%></td>
								<td><%=salesForm.getDis()%></td>
								<td><%=salesForm.getTotal()%></td>
							</tr>
							<%
								}
									}
							%>



						</table>
				</tr>
				<tr>

					<td>Article no.</td>
					<td><input type="text" name="artno" placeholder="Article no"
						value="<%out.print(artno);%>"></td>

				</tr>
				<tr>
					<td></td>
					<td colspan="2"><input type="submit" value="Check" name="btn"
						onclick="return valid();"></td>

				</tr>


				<tr>
					<td>Unit Price</td>
					<td><input type="text" name="prate" placeholder="UnitPrice"></td>
				</tr>
				<tr>
					<td>Qty Bought</td>
					<td><input type="text" name="qtyb" placeholder="Quantity"></td>
				</tr>
				<tr>
					<td>Qty to Return</td>
					<td><input type="text" name="qty" placeholder="Quantity"></td>

				</tr>
				<tr>
					<td>Type</td>
					<td><input type="text" name="type" placeholder="Type"></td>
				</tr>




				<tr>
					<td>Discount</td>
					<td><input type="text" name="dis" placeholder="00.00%"></td>
				</tr>
				<tr>

					<td><input type="submit" value="Add" name="btn"
						onclick="return validate();"></td>
					<td><input type="submit" value="Generate Balance" name="btn"></td>


				</tr>
				<%
					} else {
				%>
				<tr>
					<td colspan="2"><font size="4">Return Details:</td>


				</tr>
				<tr>

					<td>Bill No:</td>
					<td><input type="text" name="billno"
						value="<%out.print(billno);%>" placeholder="123456"></td>
					<td></td>
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td rowspan="7"><table width="100%" border="2">
							<%
								if (salelist != null) {
							%>
							<tr>
								<td>Art No:</td>
								<td>Type</td>
								<td>Unit Price</td>
								<td>Quantity</td>
								<td>Discount(%)</td>
								<td>Total</td>
							</tr>
							<%
								for (SaleReturnForm salesForm : salelist) {
							%><tr>

								<td><%=salesForm.getArtno()%></td>
								<td><%=salesForm.getType()%></td>
								<td><%=salesForm.getRate()%></td>
								<td><%=salesForm.getQty()%></td>
								<td><%=salesForm.getDis()%></td>
								<td><%=salesForm.getTotal()%></td>
							</tr>
							<%
								}
									}
							%>



						</table>
				</tr>
				<tr>

					<td>Article no.</td>
					<td><input type="text" name="artno" placeholder="Article no"
						value="<%out.print(artno);%>"></td>

				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Check" name="btn"></td>
					<td></td>
					<td></td>

				</tr>


				<tr>
					<td>Unit Price</td>
					<td><input type="text" name="prate" placeholder="UnitPrice"
						value="<%out.print(saleForm.getRate());%>"></td>

				</tr>
				<tr>
					<td>Qty Bought</td>
					<td><input type="text" name="qtyb" placeholder="Quantity"
						value="<%out.print(saleForm.getQty());%>"></td>
				</tr>
				<tr>
					<td>Qty to return</td>
					<td><input type="text" name="qty" placeholder="Quantity"></td>

				</tr>
				<tr>
					<td>Type</td>
					<td><input type="text" name="type" placeholder="Type"
						value="<%out.print(saleForm.getType());%>"></td>

				</tr>





				<tr>
					<td>Discount</td>
					<td><input type="text" name="dis" placeholder="00.00%"
						value="<%out.print(saleForm.getDis());%>"></td>

				</tr>
				<tr>

					<td><input type="submit" value="Add" name="btn"
						onclick="return validate();"></td>
					<td><input type="submit" value="Generate Balance" name="btn"></td>


				</tr>


				<%
					}
				%>


			</table>
		</form>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
</body>

</html>
