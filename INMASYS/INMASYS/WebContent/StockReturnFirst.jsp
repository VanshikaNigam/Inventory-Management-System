<!DOCTYPE html>
<%@ page import="controller.LoginServlet"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Stock Return</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript">
	function validate() {
		var articleno = document.forms["StockRe"]["articleno"].value;
		var name = document.forms["StockRe"]["Name"].value;
		var saler = document.forms["StockRe"]["salerate"].value;
		var qnty = document.forms["StockRe"]["quantity"].value;
		var date = document.forms["StockRe"]["Date"].value;
		var salep = document.forms["StockRe"]["saleperson"].value;

		if (articleno == "") {
			alert("ArticleNo. field is empty");
			return false;
		}
		if (isNaN(articleno)) {
			alert("ArticleNo should contain numbers");
			return false;
		}

	}
	function valid() {
		var date2 = document.forms["StockRe"]["Date2"].value;
		var qnty = document.forms["StockRe"]["quanty"].value;
		if ((qnty) == "") {
			alert("Quantity field is blank");
			return false;
		}
		if (isNaN(qnty)) {
			alert(" quantity should contain numbers");
			return false;
			if (date2 == "") {
				alert("Date is empty");
				return false;
			}
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
			<u>Stock Return Form</u>
		</h4>
		<br> <br> <br>

		<form action="StockRServlet" method="post" name="SaleF">
			<table align="center">

				<tr>
					<td>Article no</td>
					<td><input type="text" name="articleno"
						placeholder="article no"></td>
					<td>Name</td>
					<td><input type="text" name="Name"
						placeholder="items returned"></td>
				</tr>
				<tr>
					<td>Sale Rate</td>
					<td><input type="text" name="salerate" placeholder="rate"></td>
					<td>Quantity</td>
					<td><input type="text" name="quantity" placeholder="items"></td>
				</tr>
				<tr>
					<td>Sale person</td>
					<td><input type="text" name="saleperson" placeholder="name"></td>
					<td>Date</td>
					<td><input type="date" name="Date"></td>
				</tr>
				<tr>

					<td><input type="submit" value="Check" name="btn"
						onclick="return validate();"></td>
				</tr>

				<tr>

					<td align="center"><strong><u>Enter Quantities to
								be Returned</u></strong></td>
					<td></td>
				</tr>

				<tr>
					<td>Quantity</td>
					<td><input type="text" name="quanty" placeholder="items"></td>
				</tr>
				<tr>
					<td>Date</td>
					<td><input type="date" name="Date2"></td>
				</tr>



				<tr>
					<td><input type="submit" value="Update" name="btn"
						onclick="return valid();"></td>
				</tr>
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
	<br>
	<br>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS 
	</div>




</body>

</html>