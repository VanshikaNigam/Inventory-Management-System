<!DOCTYPE html>

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


	<div class="wrap">

		<br> <br>

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
			<table align="center" width="75%">


				<tr>
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
					<td><input type="text" name="rqty" placeholder="Remaining"></td>
					<td><input type="text" name="qty" placeholder="Quantity"></td>
					<td><input type="text" name="dis" placeholder="Discount"></td>



					</td>
					<td align="center"><input type="submit" value="Next"
						name="btn" onclick="return valid();"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Details" name="btn"
						onclick="return validate();"> <br> <br>
				</tr>

				<tr>

					<td>Customer Name:</td>
					<td><input type="text" name="name" placeholder="Customer Name"></td>


					<td><input type="submit" value="Generate Bill" name="btn"></td>
			</table>
		</form>

	<br>
<br>
<br>
<br>
<br>

	</div>
	<hr>
	<div align="center"><font color="white">&copy;&nbsp;INMASYS-NVSS</div>



</body>

</html>