<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.SalesServlet"%>
<%@ page import="bean.SalesForm"%>
<%@ page import="bean.EntryForm"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Sale Form</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript">
	function valid() {

		var Qty = document.forms["SaleF"]["qty"].value;
		var Dis = document.forms["SaleF"]["dis"].value;

		if (Qty == "") {
			alert("Quantity field is blank");
			return false;
		}
		if (isNaN(Qty)) {
			alert("Quantity field should contain numbers");
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
	function validate() {
		var Art = document.forms["SaleF"]["artno"].value;

		if (Art == "") {
			alert("Article no. field is blank");
			return false;
		}
		if (isNaN(Art)) {
			alert("Article should contain numbers");
			return false;

		}

	}
</script>
</head>

<body>
	<h3 align="right">
		<font color="White"> <%
 	Object username = session.getAttribute("username");
 %> <%
 	out.print("Welcome:");
 %><%=username%></font>
	</h3>
	<br>

	<div class="wrap">

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
			<u>Sales Form</u>
		</h4>
		<br> <br>

		<form action="sales" method="post" name="SaleF">
			<table align="center">

				<%
					ArrayList<SalesForm> salelist = (ArrayList<SalesForm>) request
							.getAttribute("list");
					int i = 1;
					EntryForm entryForm = (EntryForm) request.getAttribute("entryForm");
					int artno = (Integer) request.getAttribute("artno");
					if (entryForm == null) {
				%><tr>
					<td>Article No.</td>
					<td>Type</td>
					<td>Unit Price</td>
					<td>Remaining Qty</td>
					<td>Quantity</td>
					<td>Discount</td>

				</tr>
				<tr>
					<td><input type="text" name="artno" placeholder="Article no"></td>
					<td><input type="text" name="type" placeholder="Type"></td>
					<td><input type="text" name="rate" placeholder="Unit Price"></td>
					<td><input type="text" name="rqty" placeholder="Remaining Qty"></td>
					<td><input type="text" name="qty" placeholder="Quantity"></td>
					<td><input type="text" name="dis" placeholder="Discount"></td>

					<%
						} else {
					%>
				
				<tr>
					<td>Article No.</td>
					<td>Type</td>
					<td>Unit Price</td>
					<td>Remaining Qty</td>
					<td>Quantity</td>
					<td>Discount</td>

				</tr>
				<tr>
					<td><input type="text" value="<%out.print(artno);%>"
						name="artno" placeholder="Article no"></td>
					<td><input type="text"
						value="<%out.print(entryForm.getType());%>" name="type"
						placeholder="Type"></td>
					<td><input type="text"
						value="<%out.print(entryForm.getSalerate());%>" name="rate"
						placeholder="Unit Price"></td>
					<td><input type="text"
						value="<%out.print(entryForm.getQty());%>" name="rqty"
						placeholder="Unit Price"></td>
					<td><input type="text" name="qty" placeholder="Quantity"></td>
					<td><input type="text" name="dis" placeholder="Discount"></td>
					<td align="center"><input type="submit" value="Next"
						name="btn" onclick="return valid();"></td>



					<%
						}
					%>
				</tr>

				</tr>
				<tr>
					<td><input type="submit" value="Details" name="btn"
						onclick="return validate();"> <br> <br>
				</tr>
				<tr>
					<td>Customer Name:</td>
					<td><input type="text" name="name" placeholder="Customer name"></td>


					<td><input type="submit" value="Generate Bill" name="btn"></td>
				</tr>
			</table>

			<table width="50%" border="2">
				<%
					if (salelist != null) {
				%>
				<tr class="color">
					<td>Art No:</td>
					<td>Type</td>
					<td>Unit Price</td>
					<td>Quantity</td>
					<td>Discount(%)</td>
					<td>Total</td>
				</tr>
				<%
					for (SalesForm salesForm : salelist) {
				%><tr class="color2">

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
		</form>
		<br> <br> <br> <br> <br>

	</div>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS 
	</div>



</body>

</html>