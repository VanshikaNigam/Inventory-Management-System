<!DOCTYPE html>

<html lang="en">

	<head>
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
		<meta charset="utf-8">
		<title>Sale Return</title>
		<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<script src="prefix-free.js"></script>
		<script type="text/javascript">
		function add()
		{

			var unit = document.forms["SaleF"]["prate"].value;
			var qtyB = document.forms["SaleF"]["qtyb"].value;

			var qtyR = document.forms["SaleF"]["qty"].value;
			var type = document.forms["SaleF"]["type"].value;

			var dis = document.forms["SaleF"]["dis"].value;
			if (unit == "") {
				alert("Unit Price field is blank");
				return false;
			}
			if (isNaN(unit)) {
				alert("Unit Price should contain numbers");
				return false;

			}
			if (qtyB == "") {
				alert("Quantity Bought field is blank");
				return false;
			}
			if (isNaN(qtyB)) {
				alert("Quantity Bought should contain numbers");
				return false;

			}
			if (qtyR == "") {
				alert("Quantity return field is blank");
				return false;
			}
			if (isNaN(qtyR)) {
				alert("Quantity Return Field should contain numbers");
				return false;

			}
			if (type == "") {
				alert("Type field is blank");
				return false;
			}
			if (!isNaN(type)) {
				alert("Type should contain string");
				return false;

			}
			if (dis == "") {
				alert("Discount field is blank");
				return false;
			}
			if (isNaN(dis)) {
				alert("Discount should contain numbers");
				return false;

			}
		
		}
	
	function valid() {
		
		var Art = document.forms["SaleF"]["artno"].value;
		var bill = document.forms["SaleF"]["billno"].value;
		if (bill == "") {
			alert("Bill no. field is blank");
			return false;
		}
		if (isNaN(bill)) {
			alert("Bill no should contain numbers");
			return false;

		}
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
<h3 align="right"><font color="White">	<%
						Object username = session.getAttribute("username");
					%>
					<%
						out.print("Welcome:");
					%><%=username%></font></h3>


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
				</ul>
			</li>
			<li><a href="#"><span class="iconic magnifying-glass"></span>Report</a>
			<ul>
									<li><a href="StrByArticleFirst.jsp">Stock Report By Article</a>
									<li><a href="StrByDateFirst.jsp">Stock Report By Date</a>	
									<li><a href="SlByArticleFirst.jsp">Sale Report By Article</a>
									<li><a href="SlByDateFirst.jsp">Sale Report By Date</a>	
								</ul>
				
			</li>
			<li><a href="AddAdminFirst.jsp"><span class="iconic map-pin"></span>Add Admin</a>
				
			</li>
			<li><a href="Change.jsp"><span class="iconic mail"></span>Change Password</a>
			<li><a href="Logout"><span class="iconic home"></span> Logout</a>	
			</li>
		</ul>
		<div class="clearfix"></div>
		<div></div>
		<div></div>
	</nav>
	<br><br>
	<h4 align="center"><u>Sale Return form</u></h4>
	<br>
	<br>
	<br>
				
				<form action="return" method="post" name="SaleF">
					<table align="left" width="100%">

						<tr>
							<td colspan="2"><font size="4">Return
									Details:</td>
						</tr>
						<tr>

							<td>Bill No:</td>
							<td><input type="text" name="billno"
								placeholder="ddmmyyyyHHMM"></td>
						</tr>
						<tr>

							<td>Article no.</td>
							<td><input type="text" name="artno" placeholder="Article no"></td>
						</tr>
						<tr>
						<td></td>
							<td colspan="2"><input type="submit" value="Check"
								name="btn" onclick="return valid();"></td>
		
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

							<td><input type="submit" value="Add" name="btn" onclick="return add();"
								></td>
							<td><input type="submit" value="Generate Balance" name="btn"></td>
						</tr>


					</table>
				</form>


	</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	

	
	
	
</body>

</html>
