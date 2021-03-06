<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.SalesServlet"%>
<%@ page import="bean.SalesForm"%>
<%@ page import="bean.EntryForm"%>
<%@ page import="bean.BillForm"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Sale Balance</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function validate() {
		var article = document.forms["salebalance"]["artno"].value;
	
		if (article == "") {
			alert("Article no. field is blank");
			return false;
		}
	
		if (isNaN(article)) {
			alert("Article No. should contains numbers");
			return false;
		}
		

	}
	function valid(){
		
		var quantity = document.forms["salebalance"]["qty"].value;
		var discount = document.forms["salebalance"]["dis"].value;
		if (quantity == "") {
			alert("Quantity field is blank");
			return false;
		}

		if (discount == "") {
			alert("Discount field is blank");
			return false;
		}
		
		if (isNaN(quantity)) {
		alert("Quantity should contains numbers");
		return false;
	}
		
		function name(){
			var name = document.forms["salebalance"]["name"].value;
			if (name == "") {
				alert("Name field is blank");
				return false;
			}
			if(!isNaN(name)){
				alert("Name should contain string");
				return false;
			}
		}
		
	}
	function check() {
		var balance = document.forms["salebalance"]["bal"].value;
		if (balance >= 0) {
			alert("Balance should be Less than equal to zero");
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
 	out.print("Welcome");
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
			<u>Sales Form</u>
		</h4>
		<br> <br>
		<center>
			<form action="comp" method="post" name="salebalance">
				<table align="center" onsubmit="return name();">

					<%
						ArrayList<SalesForm> salelist = (ArrayList<SalesForm>) request
								.getAttribute("list");
						EntryForm entryForm = (EntryForm) request.getAttribute("entryForm");

						double bal = (Double) request.getAttribute("bal");
						if (entryForm == null) {
					%>
					<tr>
						<td>Balance:</td>
						<td><input type="text" name="bal" value="<%out.print(bal);%>"></td>

					</tr>

					<tr>
					<tr></tr>
					<td>Article No.</td>
					<td>Type</td>
					<td>Unit Price</td>
					<td>Remaining</td>
					<td>Quantity</td>
					<td>Discount</td>

					</tr>
					<tr>
						<td><input type="text" name="artno" placeholder="Article no"></td>
						<td><input type="text" name="type" placeholder="Type"></td>
						<td><input type="text" name="rate" placeholder="Unit Price"></td>
						<td><input type="text" name="rqty" placeholder="Remaining"></td>
						<td><input type="text" name="qty" placeholder="Quantity"></td>
						<td><input type="text" name="dis" placeholder="Discount"></td>

						<%
							} else {
						%>
					
					<tr>
						<td>Balance in(Rs):</td>
						<td><input type="text" name="bal" value="<%out.print(bal);%>"></td>
					</tr>
					<tr>
						<td>Article No.</td>
						<td>Type</td>
						<td>Unit Price</td>
						<td>Remaining</td>
						<td>Quantity</td>
						<td>Discount</td>

					</tr>
					<tr>
						<td><input type="text"
							value="<%out.print(entryForm.getArtno());%>" name="artno"
							placeholder="Article no"></td>
						<td><input type="text"
							value="<%out.print(entryForm.getType());%>" name="type"
							placeholder="Type"></td>
						<td><input type="text"
							value="<%out.print(entryForm.getSalerate());%>" name="rate"
							placeholder="Unit Price"></td>
						<td><input type="text"
							value="<%out.print(entryForm.getQty());%>" name="rate"
							placeholder="Unit Price"></td>

						<td><input type="text" name="qty" placeholder="Quantity"></td>
						<td><input type="text" name="dis" placeholder="Discount"></td>




						<%
							}
						%>
						</td>
						<td align="center"><input type="submit" value="Next"
							name="btn" onclick="return valid();"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Details" name="btn"
							onclick="return validate();">
					</tr>
					<tr>
						<td>Customer Name:</td>
						<td><input type="text" name="name"
							placeholder="Customer Name:"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Generate Bill" name="btn"
							onclick="return check();">
					</tr>
				</table>
			</form>
			<table width="50%" border="2">
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
					for (SalesForm salesForm : salelist) {
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
		</center>

		<br> <br> <br> <br> <br>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS
	</div>



</body>

</html>
